const { pool } = require('../config/database');

/**
 * MODEL - Database operations
 * Simple functions to interact with database
 */

/**
 * Search for dishes by name with price range filter
 * @param {string} dishName - Name of the dish to search
 * @param {number} minPrice - Minimum price
 * @param {number} maxPrice - Maximum price
 * @returns {Promise<Array>} Array of restaurant results
 */
async function searchByName(dishName, minPrice, maxPrice) {
  const query = `
    SELECT 
      r.id AS restaurantId,
      r.name AS restaurantName,
      r.city,
      m.dish_name AS dishName,
      m.price AS dishPrice,
      COUNT(o.id) AS orderCount
    FROM restaurants r
    INNER JOIN menu_items m ON r.id = m.restaurant_id
    INNER JOIN orders o ON m.id = o.menu_item_id
    WHERE m.dish_name LIKE ?
      AND m.price >= ?
      AND m.price <= ?
    GROUP BY r.id, r.name, r.city, m.dish_name, m.price
    ORDER BY orderCount DESC
    LIMIT 10
  `;

  const searchPattern = `%${dishName}%`;
  
  // Retry logic for connection errors
  let retries = 3;
  while (retries > 0) {
    try {
      const [rows] = await pool.execute(query, [searchPattern, minPrice, maxPrice]);
      return rows;
    } catch (error) {
      // If connection error, retry
      if ((error.code === 'ECONNRESET' || error.code === 'PROTOCOL_CONNECTION_LOST' || error.code === 'ETIMEDOUT') && retries > 1) {
        retries--;
        console.log(`Connection error, retrying... (${retries} attempts left)`);
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait 1 second before retry
        continue;
      }
      throw error; // Re-throw if not a connection error or out of retries
    }
  }
}

/**
 * Get database statistics
 * @returns {Promise<Object>} Statistics object
 */
async function getStats() {
  // Retry logic for connection errors
  const executeWithRetry = async (query, params = []) => {
    let retries = 3;
    while (retries > 0) {
      try {
        const [rows] = await pool.execute(query, params);
        return rows;
      } catch (error) {
        if ((error.code === 'ECONNRESET' || error.code === 'PROTOCOL_CONNECTION_LOST' || error.code === 'ETIMEDOUT') && retries > 1) {
          retries--;
          await new Promise(resolve => setTimeout(resolve, 1000));
          continue;
        }
        throw error;
      }
    }
  };

  const [restaurantCount] = await executeWithRetry('SELECT COUNT(*) as count FROM restaurants');
  const [menuItemCount] = await executeWithRetry('SELECT COUNT(*) as count FROM menu_items');
  const [orderCount] = await executeWithRetry('SELECT COUNT(*) as count FROM orders');
  
  return {
    restaurants: restaurantCount[0].count,
    menuItems: menuItemCount[0].count,
    orders: orderCount[0].count
  };
}

module.exports = {
  searchByName,
  getStats
};

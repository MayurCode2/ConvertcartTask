import { searchByName, getStats } from '../models/Dish.js';

/**
 * SERVICE - Business logic layer
 * Handles business rules and coordinates between Model and Controller
 */

/**
 * Search for dishes by name with price range
 * @param {string} name - Dish name
 * @param {number} minPrice - Minimum price
 * @param {number} maxPrice - Maximum price
 * @returns {Promise<Array>} Array of restaurants
 */
async function searchDishes(name, minPrice, maxPrice) {
  try {
    // Call model to get data from database
    const restaurants = await searchByName(name, minPrice, maxPrice);
    return restaurants;
  } catch (error) {
    console.error('Error in dishService.searchDishes:', error);
    throw error;
  }
}

/**
 * Get database statistics
 * @returns {Promise<Object>} Statistics object
 */
async function getDatabaseStats() {
  try {
    // Call model to get statistics
    const stats = await getStats();
    return stats;
  } catch (error) {
    console.error('Error in dishService.getDatabaseStats:', error);
    throw error;
  }
}

export default {
  searchDishes,
  getDatabaseStats
};


import dishService from '../services/dishService.js';
import Response from '../views/Response.js';

/**
 * CONTROLLER - Request handling
 * Simple functions to handle HTTP requests
 */

/**
 * Search for dishes
 * GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
 */
async function search(req, res) {
  try {
    // Get parameters from URL
    const { name, minPrice, maxPrice } = req.query;

    // Validate: Dish name required
    if (!name) {
      return Response.error(res, 400, 'Dish name is required');
    }

    // Validate: Price range required
    if (!minPrice || !maxPrice) {
      return Response.error(res, 400, 'Both minPrice and maxPrice are required');
    }

    // Convert to numbers
    const min = parseFloat(minPrice);
    const max = parseFloat(maxPrice);

    // Validate: Must be valid numbers
    if (isNaN(min) || isNaN(max)) {
      return Response.error(res, 400, 'minPrice and maxPrice must be valid numbers');
    }

    // Validate: Cannot be negative
    if (min < 0 || max < 0) {
      return Response.error(res, 400, 'Price values cannot be negative');
    }

    // Validate: Min cannot be greater than max
    if (min > max) {
      return Response.error(res, 400, 'minPrice cannot be greater than maxPrice');
    }

    // Call service to get data
    const restaurants = await dishService.searchDishes(name, min, max);

    // Send formatted response
    return Response.searchResults(res, restaurants);

  } catch (error) {
    console.error('Error in dishController.search:', error);
    return Response.error(res, 500, 'Internal server error', error.message);
  }
}

/**
 * Get database statistics
 * GET /search/stats
 */
async function getStats(req, res) {
  try {
    // Call service to get statistics
    const stats = await dishService.getDatabaseStats();

    // Send formatted response
    return Response.stats(res, stats);

  } catch (error) {
    console.error('Error in dishController.getStats:', error);
    return Response.error(res, 500, 'Internal server error', error.message);
  }
}

export {
  search,
  getStats
};

const Dish = require('../models/Dish');
const Response = require('../views/Response');

/**
 * CONTROLLER - Handles requests and responses
 * This is where validation and request handling happens
 */
class DishController {
  /**
   * Search for dishes
   * GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
   */
  static async search(req, res) {
    try {
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

      // Get data from Model
      const restaurants = await Dish.searchByName(name, min, max);

      // Send formatted response using View
      return Response.searchResults(res, restaurants);

    } catch (error) {
      console.error('Error in DishController.search:', error);
      return Response.error(res, 500, 'Internal server error', error.message);
    }
  }

  /**
   * Get database statistics
   * GET /search/stats
   */
  static async getStats(req, res) {
    try {
      // Get data from Model
      const stats = await Dish.getStats();

      // Send formatted response using View
      return Response.stats(res, stats);

    } catch (error) {
      console.error('Error in DishController.getStats:', error);
      return Response.error(res, 500, 'Internal server error', error.message);
    }
  }
}

module.exports = DishController;


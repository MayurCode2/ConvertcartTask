/**
 * VIEW - Response formatting
 * Simple functions to format responses
 */

/**
 * Success response
 * @param {Object} res - Express response object
 * @param {number} statusCode - HTTP status code
 * @param {Object} data - Data to send
 */
function success(res, statusCode = 200, data = {}) {
  return res.status(statusCode).json({
    success: true,
    ...data
  });
}

/**
 * Error response
 * @param {Object} res - Express response object
 * @param {number} statusCode - HTTP status code
 * @param {string} message - Error message
 * @param {string} error - Detailed error (only in development)
 */
function error(res, statusCode = 500, message = 'Internal server error', error = null) {
  const response = {
    success: false,
    message
  };

  // Only show detailed error in development
  if (error && process.env.NODE_ENV === 'development') {
    response.error = error;
  }

  return res.status(statusCode).json(response);
}

/**
 * Format search results
 * @param {Object} res - Express response object
 * @param {Array} restaurants - Array of restaurant results
 */
function searchResults(res, restaurants) {
  return success(res, 200, {
    count: restaurants.length,
    restaurants: restaurants
  });
}

/**
 * Format stats response
 * @param {Object} res - Express response object
 * @param {Object} stats - Statistics object
 */
function stats(res, stats) {
  return success(res, 200, { stats });
}

module.exports = {
  success,
  error,
  searchResults,
  stats
};

const express = require('express');
const router = express.Router();
const dishController = require('../controllers/dishController');

/**
 * ROUTES - Define API endpoints
 * Routes connect URLs to Controller functions
 */

// GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
router.get('/dishes', dishController.search);

// GET /search/stats
router.get('/stats', dishController.getStats);

module.exports = router;

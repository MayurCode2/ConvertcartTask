const express = require('express');
const router = express.Router();
const DishController = require('../controllers/DishController');

/**
 * ROUTES - Define API endpoints
 * Routes connect URLs to Controllers
 */

// GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
router.get('/dishes', DishController.search);

// GET /search/stats
router.get('/stats', DishController.getStats);

module.exports = router;

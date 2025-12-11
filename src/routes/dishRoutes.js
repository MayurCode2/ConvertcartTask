import express from 'express';
import * as dishController from '../controllers/dishController.js';
const router = express.Router();

/**
 * ROUTES - Define API endpoints
 * Routes connect URLs to Controller functions
 */

// GET /search/dishes?name=biryani&minPrice=150&maxPrice=300
router.get('/dishes', dishController.search);

// GET /search/stats
router.get('/stats', dishController.getStats);

export default router;

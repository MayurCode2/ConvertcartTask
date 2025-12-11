import express from 'express';
import cors from 'cors';
import dishRoutes from './routes/dishRoutes.js';
import Response from './views/Response.js';

// Create Express app
const app = express();

// Middleware
app.use(cors()); // Enable CORS for all routes
app.use(express.json()); // Parse JSON request bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// Request logging middleware (development)
if (process.env.NODE_ENV === 'development') {
  app.use((req, res, next) => {
    console.log(`${new Date().toISOString()} - ${req.method} ${req.path}`);
    next();
  });
}



// API Routes
app.use('/search', dishRoutes);

// 404 handler
app.use((req, res) => {
  return Response.error(res, 404, 'Endpoint not found');
});

// Global error handler
app.use((err, req, res, next) => {
  console.error('Unhandled error:', err);
  return Response.error(res, 500, 'Internal server error', err.message);
});

export default app;


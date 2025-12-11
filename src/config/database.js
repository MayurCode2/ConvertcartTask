import mysql from 'mysql2/promise';
import 'dotenv/config';

// Database configuration
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'restaurant_search',
  port: process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  // Connection timeout settings for free MySQL hosts
  connectTimeout: 60000, // 60 seconds
  acquireTimeout: 60000,
  timeout: 60000,
  // Keep connection alive
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
  // Reconnect settings
  reconnect: true
};

// Create connection pool
const pool = mysql.createPool(dbConfig);

// Handle connection errors and reconnect
pool.on('connection', (connection) => {
  console.log('New database connection established');
  
  connection.on('error', (err) => {
    console.error('Database connection error:', err);
    if (err.code === 'PROTOCOL_CONNECTION_LOST' || err.code === 'ECONNRESET') {
      console.log('Connection lost, will reconnect on next query');
    }
  });
});

// Handle pool errors
pool.on('error', (err) => {
  console.error('Database pool error:', err);
});

// Test database connection
const testConnection = async () => {
  try {
    const connection = await pool.getConnection();
    console.log('✅ Database connected successfully');
    connection.release();
    return true;
  } catch (error) {
    console.error('❌ Database connection failed:', error.message);
    return false;
  }
};

export {
  pool,
  testConnection
};


# Restaurant Dish Search API

A simple and efficient backend service that allows users to search for restaurants based on dish names with mandatory price range filtering. The system returns the top 10 restaurants where the specified dish has been ordered the most.

## 🚀 Features

- Search restaurants by dish name
- Mandatory price range filtering (minPrice & maxPrice)
- Returns top 10 restaurants ordered by order count
- RESTful API design
- Clean and well-structured code
- Comprehensive seed data included

## 🛠️ Tech Stack

- **Backend**: Node.js + Express.js
- **Database**: MySQL
- **Dependencies**: mysql2, dotenv, cors

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/) (v14 or higher)
- [MySQL](https://www.mysql.com/) (v5.7 or higher)
- npm or yarn package manager

## ⚙️ Installation & Setup

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd restaurant-dish-search
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Database Configuration

Create a `.env` file in the root directory with your database credentials:

```env
# Server Configuration
PORT=3000
NODE_ENV=development

# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=restaurant_search
DB_PORT=3306
```

You can copy from the example file:

```bash
cp env.example .env
```

Then edit `.env` with your actual database credentials.

### 4. Set Up Database

#### Option 1: Using MySQL Command Line

```bash
# Login to MySQL
mysql -u root -p

# Create database and tables
source database/schema.sql

# Load seed data
source database/seed.sql
```

#### Option 2: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your MySQL server
3. Open and execute `database/schema.sql`
4. Open and execute `database/seed.sql`

### 5. Start the Server

```bash
# Development mode (with auto-reload)
npm run dev

# Production mode
npm start
```

The server will start on `http://localhost:3000`

## 📡 API Endpoints

### Search Dishes

Search for restaurants by dish name with mandatory price range filter.

**Endpoint**: `GET /search/dishes`

**Query Parameters**:
- `name` (string, required): The dish name to search for
- `minPrice` (number, required): Minimum price filter
- `maxPrice` (number, required): Maximum price filter

**Example Request**:
```bash
GET http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300
```

**Example Response**:
```json
{
  "success": true,
  "count": 10,
  "restaurants": [
    {
      "restaurantId": 1,
      "restaurantName": "Hyderabadi Spice House",
      "city": "Hyderabad",
      "dishName": "Chicken Biryani",
      "dishPrice": 220,
      "orderCount": 96
    },
    {
      "restaurantId": 13,
      "restaurantName": "Golden Fork",
      "city": "Bangalore",
      "dishName": "Chicken Biryani",
      "dishPrice": 245,
      "orderCount": 85
    },
    {
      "restaurantId": 11,
      "restaurantName": "Bay Leaf Bistro",
      "city": "Mumbai",
      "dishName": "Chicken Biryani",
      "dishPrice": 260,
      "orderCount": 78
    }
  ]
}
```

### Health Check

Check if the API is running.

**Endpoint**: `GET /`

**Example Response**:
```json
{
  "success": true,
  "message": "Restaurant Dish Search API is running",
  "version": "1.0.0",
  "endpoints": {
    "searchDishes": "GET /search/dishes?name={dishName}&minPrice={min}&maxPrice={max}",
    "stats": "GET /search/stats"
  }
}
```

### Database Statistics

Get statistics about the database (optional).

**Endpoint**: `GET /search/stats`

**Example Response**:
```json
{
  "success": true,
  "stats": {
    "restaurants": 15,
    "menuItems": 56,
    "orders": 1234
  }
}
```

## 🧪 Testing the API

### Using cURL

```bash
# Search for biryani dishes between ₹150-₹300
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# Search for chicken biryani with different price range
curl "http://localhost:3000/search/dishes?name=chicken%20biryani&minPrice=200&maxPrice=250"

# Get database statistics
curl "http://localhost:3000/search/stats"
```

### Using Postman

1. Open Postman
2. Create a new GET request
3. Enter URL: `http://localhost:3000/search/dishes`
4. Add query parameters:
   - `name`: `biryani`
   - `minPrice`: `150`
   - `maxPrice`: `300`
5. Click Send

### Using a Web Browser

Simply open:
```
http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300
```

## 📊 Database Schema

### Restaurants Table
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT)
- `name` (VARCHAR)
- `city` (VARCHAR)
- `created_at` (TIMESTAMP)

### Menu Items Table
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT)
- `restaurant_id` (INT, FOREIGN KEY)
- `dish_name` (VARCHAR)
- `price` (DECIMAL)
- `created_at` (TIMESTAMP)

### Orders Table
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT)
- `menu_item_id` (INT, FOREIGN KEY)
- `order_date` (TIMESTAMP)

## 📁 Project Structure

```
restaurant-dish-search/
├── database/
│   ├── schema.sql          # Database schema
│   └── seed.sql            # Sample data
├── src/
│   ├── config/
│   │   └── database.js     # Database connection
│   ├── controllers/
│   │   └── dishController.js  # Request handlers
│   ├── routes/
│   │   └── dishRoutes.js   # API routes
│   ├── services/
│   │   └── dishService.js  # Business logic
│   └── app.js              # Express app setup
├── .gitignore
├── env.example             # Environment variables template
├── package.json
├── README.md
└── server.js               # Server entry point
```

## 🚢 Deployment





### Deploy to Render

1. Create account on [Render](https://render.com/)
2. Create new Web Service
3. Connect your GitHub repository
4. Set environment variables in Render dashboard
5. Add MySQL database (use external service like PlanetScale or Railway)
6. Deploy

### Environment Variables for Production

Make sure to set these in your deployment platform:
- `DB_HOST`
- `DB_USER`
- `DB_PASSWORD`
- `DB_NAME`
- `DB_PORT`
- `PORT` (usually set automatically)
- `NODE_ENV=production`

## 🔍 Sample Data

The seed file includes:
- 15 restaurants across different cities
- 56+ menu items including various biryani dishes
- 1000+ orders distributed realistically across restaurants

Sample restaurants:
- Hyderabadi Spice House (Hyderabad) - 96 Chicken Biryani orders
- Golden Fork (Bangalore) - 85 Chicken Biryani orders
- Bay Leaf Bistro (Mumbai) - 78 Chicken Biryani orders
- And more...

## ⚠️ Error Handling

The API returns appropriate HTTP status codes and error messages:

- `400 Bad Request`: Missing or invalid parameters
- `404 Not Found`: Endpoint not found
- `500 Internal Server Error`: Database or server errors

Example error response:
```json
{
  "success": false,
  "message": "Both minPrice and maxPrice are required"
}
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 👨‍💻 Author

Created as a backend coding assessment project.

## 📞 Support

For issues and questions, please create an issue in the GitHub repository.

---

**Happy Coding! 🎉**

# Setup Verification Checklist

Use this checklist to verify your project setup is complete and working correctly.

## 📁 File Structure Verification

Check that all these files exist:

### Root Directory Files
- [ ] `package.json` - Project dependencies
- [ ] `server.js` - Application entry point
- [ ] `env.example` - Environment template
- [ ] `.gitignore` - Git ignore rules
- [ ] `README.md` - Main documentation
- [ ] `QUICK_START.md` - Quick setup guide
- [ ] `API_EXAMPLES.md` - API usage examples
- [ ] `DEPLOYMENT.md` - Deployment guide
- [ ] `GIT_SETUP.md` - Git and deployment instructions
- [ ] `PROJECT_SUMMARY.md` - Project overview
- [ ] `LICENSE` - MIT License
- [ ] `Dockerfile` - Docker container config
- [ ] `docker-compose.yml` - Docker orchestration
- [ ] `.dockerignore` - Docker ignore rules
- [ ] `TEST_COMMANDS.sh` - Linux/Mac test script
- [ ] `TEST_COMMANDS.bat` - Windows test script

### Database Directory
- [ ] `database/schema.sql` - Database schema
- [ ] `database/seed.sql` - Sample data

### Source Directory
- [ ] `src/app.js` - Express app configuration
- [ ] `src/config/database.js` - Database connection
- [ ] `src/controllers/dishController.js` - Request handlers
- [ ] `src/routes/dishRoutes.js` - API routes
- [ ] `src/services/dishService.js` - Business logic

## ⚙️ Installation Verification

### 1. Dependencies Installed

```bash
# Run this command
npm install

# Verify node_modules directory exists
ls node_modules
```

Expected packages:
- [ ] express
- [ ] mysql2
- [ ] dotenv
- [ ] cors
- [ ] nodemon (dev dependency)

### 2. Environment Configuration

```bash
# Create .env file from example
cp env.example .env

# Edit with your credentials
# Verify it contains:
# - PORT
# - DB_HOST
# - DB_USER
# - DB_PASSWORD
# - DB_NAME
# - DB_PORT
```

- [ ] `.env` file created
- [ ] Database credentials configured
- [ ] Port number set

## 🗄️ Database Verification

### 1. MySQL Running

```bash
# Check MySQL is running
# Linux/Mac:
sudo service mysql status

# Windows:
# Check Services for MySQL

# Or try connecting:
mysql -u root -p
```

- [ ] MySQL service is running
- [ ] Can connect to MySQL

### 2. Database Created

```bash
# Login to MySQL
mysql -u root -p

# Run these commands:
SHOW DATABASES;
# Should see 'restaurant_search'

USE restaurant_search;
SHOW TABLES;
# Should see: restaurants, menu_items, orders
```

- [ ] `restaurant_search` database exists
- [ ] All 3 tables created
- [ ] Tables have data (run `SELECT COUNT(*) FROM restaurants;`)

### 3. Sample Data Loaded

```sql
-- In MySQL, run:
SELECT COUNT(*) FROM restaurants;  -- Should be 15
SELECT COUNT(*) FROM menu_items;   -- Should be 56+
SELECT COUNT(*) FROM orders;       -- Should be 1000+
```

- [ ] 15 restaurants loaded
- [ ] 50+ menu items loaded
- [ ] 1000+ orders loaded

## 🚀 Server Verification

### 1. Server Starts

```bash
npm start
```

Expected output:
```
✅ Database connected successfully
🚀 Server is running on port 3000
📝 Environment: development
🔗 API URL: http://localhost:3000
🔍 Search endpoint: http://localhost:3000/search/dishes

✨ Ready to accept requests!
```

- [ ] No error messages
- [ ] Database connection successful
- [ ] Server listening on port 3000

### 2. Health Check Endpoint

Open browser or use curl:
```bash
curl http://localhost:3000/
```

Expected response:
```json
{
  "success": true,
  "message": "Restaurant Dish Search API is running",
  "version": "1.0.0",
  "endpoints": { ... }
}
```

- [ ] Health check returns success
- [ ] Status code 200
- [ ] JSON response valid

## 🧪 API Testing Verification

### Test 1: Basic Search

```bash
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

- [ ] Returns JSON with `success: true`
- [ ] Contains `restaurants` array
- [ ] Has restaurant details (id, name, city)
- [ ] Shows dish name, price, orderCount
- [ ] Results ordered by orderCount (descending)

### Test 2: Search with Spaces

```bash
curl "http://localhost:3000/search/dishes?name=chicken%20biryani&minPrice=200&maxPrice=250"
```

- [ ] Handles URL-encoded spaces
- [ ] Returns relevant results
- [ ] No errors

### Test 3: Price Filtering

```bash
# Low price range
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=180"

# High price range  
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=250&maxPrice=350"
```

- [ ] Low range returns budget options only
- [ ] High range returns premium options only
- [ ] All results within specified range

### Test 4: Error Handling

```bash
# Missing dish name
curl "http://localhost:3000/search/dishes?minPrice=150&maxPrice=300"
# Should return 400 error

# Missing price
curl "http://localhost:3000/search/dishes?name=biryani"
# Should return 400 error

# Invalid price
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=abc&maxPrice=300"
# Should return 400 error
```

- [ ] Missing parameters return 400
- [ ] Invalid values return 400
- [ ] Error messages are clear

### Test 5: Stats Endpoint

```bash
curl http://localhost:3000/search/stats
```

- [ ] Returns database statistics
- [ ] Shows counts for restaurants, menu items, orders

## 🐳 Docker Verification (Optional)

If using Docker:

```bash
# Build and start
docker-compose up -d

# Check containers
docker ps
# Should see: restaurant-api and restaurant-mysql

# Check logs
docker logs restaurant-api

# Test API
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# Stop containers
docker-compose down
```

- [ ] Containers build successfully
- [ ] Both containers running
- [ ] API accessible
- [ ] Database initialized

## 📊 Performance Verification

### Response Time

```bash
# Use curl with timing
curl -w "\nTime: %{time_total}s\n" \
  "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

- [ ] Response time < 1 second
- [ ] No timeout errors
- [ ] Consistent performance

### Concurrent Requests

```bash
# Test multiple requests (if you have 'ab' installed)
ab -n 100 -c 10 "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

- [ ] Handles concurrent requests
- [ ] No crashes or errors
- [ ] Maintains performance

## 🔒 Security Verification

- [ ] `.env` file not committed to git
- [ ] `node_modules` not committed to git
- [ ] No hardcoded passwords in code
- [ ] Environment variables used for sensitive data
- [ ] SQL queries use parameterized statements

## 📚 Documentation Verification

- [ ] README has clear setup instructions
- [ ] API examples are accurate
- [ ] Deployment guide is complete
- [ ] All code has comments
- [ ] Error messages are descriptive

## 🎯 Final Checklist

Before deployment:

- [ ] All files created correctly
- [ ] Dependencies installed
- [ ] Database initialized with data
- [ ] Server starts without errors
- [ ] All API endpoints work
- [ ] Error handling works
- [ ] Performance is acceptable
- [ ] Documentation is complete
- [ ] Code is clean and commented
- [ ] Ready to push to Git

## ✅ Verification Commands (Run All)

Copy and paste these commands to verify everything:

```bash
# 1. Check files exist
ls -la
ls database/
ls src/

# 2. Install dependencies
npm install

# 3. Check environment
cat env.example

# 4. Start server (in background or separate terminal)
npm start &

# 5. Test health check
curl http://localhost:3000/

# 6. Test main endpoint
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# 7. Test stats
curl http://localhost:3000/search/stats

# 8. Test error handling
curl "http://localhost:3000/search/dishes?name=biryani"

echo "✅ All checks complete!"
```

## 🐛 Common Issues and Solutions

### Issue: "Cannot connect to database"
**Solution**: 
- Check MySQL is running
- Verify credentials in `.env`
- Ensure database `restaurant_search` exists

### Issue: "Port 3000 already in use"
**Solution**: 
- Change PORT in `.env` to 3001 or other available port
- Or stop process using port 3000

### Issue: "Module not found"
**Solution**: 
- Run `npm install` again
- Delete `node_modules` and `package-lock.json`, then `npm install`

### Issue: "Empty results"
**Solution**: 
- Check if seed data is loaded
- Run `database/seed.sql` again

### Issue: "CORS errors"
**Solution**: 
- CORS is enabled by default
- Check if frontend and backend URLs are correct

## 🎉 Success Criteria

Your setup is complete when:

✅ Server starts without errors  
✅ Health check returns success  
✅ Search endpoint returns restaurants  
✅ Price filtering works correctly  
✅ Error handling works  
✅ All documentation is in place  
✅ Ready to deploy  

**Congratulations! Your Restaurant Dish Search API is ready!** 🚀

---

Next Steps:
1. Review [GIT_SETUP.md](GIT_SETUP.md) to push to GitHub
2. Review [DEPLOYMENT.md](DEPLOYMENT.md) to deploy online
3. Share your API with the world! 🌍


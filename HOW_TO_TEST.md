# 🧪 How to Test Your API

## Quick Test Guide

### Step 1: Start Your Server

Open terminal/PowerShell and run:

```powershell
npm start
```

Wait until you see:
```
✅ Database connected successfully
🚀 Server is running on port 3000
```

### Step 2: Run Tests

**Option A: Automated Test (Recommended)**

Open a **NEW terminal window** (keep server running) and run:

```powershell
npm test
```

This will run all tests automatically and show you:
- ✅ Which tests passed
- ❌ Which tests failed
- Summary of results

**Option B: Manual Test in Browser**

1. Open browser
2. Go to these URLs:

```
Health Check:
http://localhost:3000/

Search Dishes:
http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300

Database Stats:
http://localhost:3000/search/stats
```

**Option C: Manual Test with PowerShell**

```powershell
# Test 1: Health Check
curl http://localhost:3000/

# Test 2: Search Dishes
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# Test 3: Database Stats
curl http://localhost:3000/search/stats
```

---

## ✅ What Tests Check

The automated test (`npm test`) checks:

1. **Health Check** - Server is running
2. **Search Dishes** - Valid request works
3. **Missing Name** - Returns error when name is missing
4. **Missing Price** - Returns error when price is missing
5. **Invalid Price** - Returns error for non-number prices
6. **Min > Max** - Returns error when min > max
7. **Database Stats** - Stats endpoint works
8. **404 Error** - Invalid endpoints return 404

---

## 🎯 Expected Results

### ✅ Success Response Example:

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
    }
  ]
}
```

### ❌ Error Response Example:

```json
{
  "success": false,
  "message": "Dish name is required"
}
```

---

## 🐛 Troubleshooting

**If tests fail:**

1. **Server not running?**
   - Make sure `npm start` is running in another terminal
   - Check if port 3000 is available

2. **Database connection error?**
   - Check your `.env` file has correct database credentials
   - Make sure database and tables are created

3. **No results returned?**
   - Make sure `seed.sql` was executed
   - Check if data exists in database

4. **Connection refused?**
   - Server might not be started
   - Check firewall settings

---

## 📊 Test Results

When you run `npm test`, you'll see:

```
🧪 Starting API Tests...

Testing: Health Check - GET /
✅ PASS

Testing: Search Dishes - Valid Request
✅ PASS

...

═══════════════════════════════════════
Test Summary:
✅ Passed: 8
❌ Failed: 0
Total: 8
═══════════════════════════════════════

🎉 All tests passed! Your API is working correctly!
```

---

## 🚀 Quick Start

```powershell
# Terminal 1: Start server
npm start

# Terminal 2: Run tests
npm test
```

That's it! 🎉


# 📁 MVC Structure - Simple & Easy to Understand

## Project Structure

```
src/
├── models/          ← DATABASE (Data Layer)
│   └── Dish.js      → All database queries
│
├── views/           ← RESPONSE (Presentation Layer)
│   └── Response.js  → Format responses (success/error)
│
├── controllers/     ← LOGIC (Business Layer)
│   └── DishController.js → Handle requests, validate, call models
│
├── routes/          ← ROUTING (URL Mapping)
│   └── dishRoutes.js → Map URLs to controllers
│
├── config/          ← CONFIGURATION
│   └── database.js  → Database connection
│
└── app.js           ← MAIN APP
    └── Express setup, middleware
```

---

## 🔄 How It Works (Request Flow)

```
1. User Request
   ↓
2. Route (dishRoutes.js)
   → Maps URL to Controller
   ↓
3. Controller (DishController.js)
   → Validates input
   → Calls Model
   ↓
4. Model (Dish.js)
   → Queries database
   → Returns data
   ↓
5. Controller
   → Gets data from Model
   → Calls View
   ↓
6. View (Response.js)
   → Formats response
   ↓
7. Response to User
```

---

## 📝 File Responsibilities

### **Model (Dish.js)**
- ✅ Database queries only
- ✅ No validation
- ✅ No response formatting
- ✅ Just data operations

**Example:**
```javascript
Dish.searchByName('biryani', 150, 300)
// Returns: Array of restaurants
```

### **View (Response.js)**
- ✅ Format responses
- ✅ Success responses
- ✅ Error responses
- ✅ No business logic

**Example:**
```javascript
Response.success(res, 200, { data: results })
Response.error(res, 400, 'Invalid input')
```

### **Controller (DishController.js)**
- ✅ Handle HTTP requests
- ✅ Validate input
- ✅ Call Model for data
- ✅ Call View for response
- ✅ Error handling

**Example:**
```javascript
// 1. Validate input
if (!name) return Response.error(...)

// 2. Get data from Model
const data = await Dish.searchByName(...)

// 3. Send response via View
return Response.searchResults(res, data)
```

### **Routes (dishRoutes.js)**
- ✅ Map URLs to Controllers
- ✅ Define endpoints
- ✅ No logic, just routing

**Example:**
```javascript
router.get('/dishes', DishController.search)
```

---

## 🎯 Benefits of This Structure

1. **Easy to Understand**
   - Clear separation of concerns
   - Each file has one job

2. **Easy to Maintain**
   - Change database? → Only Model
   - Change response format? → Only View
   - Change validation? → Only Controller

3. **Easy to Test**
   - Test each layer separately
   - Models can be tested without HTTP
   - Controllers can be tested with mock data

4. **Easy to Extend**
   - Add new endpoint? → Add route + controller
   - Add new model? → Create new Model file
   - Change response? → Update View

---

## 🧪 Testing

Run tests:
```powershell
npm test
```

Tests check:
- ✅ All endpoints work
- ✅ Validation works
- ✅ Error handling works
- ✅ Response format is correct

---

## 📚 Quick Reference

| Layer | File | Purpose |
|-------|------|---------|
| **Model** | `models/Dish.js` | Database queries |
| **View** | `views/Response.js` | Response formatting |
| **Controller** | `controllers/DishController.js` | Request handling |
| **Routes** | `routes/dishRoutes.js` | URL mapping |
| **Config** | `config/database.js` | Database connection |

---

## ✅ Simple MVC Rules

1. **Model** → Only talks to database
2. **View** → Only formats responses
3. **Controller** → Coordinates Model + View
4. **Routes** → Maps URLs to Controllers

**That's it! Simple and clean!** 🎉


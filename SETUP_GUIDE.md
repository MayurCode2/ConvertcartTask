# Quick Setup Guide - Restaurant Dish Search API

## 🚀 Get Running in 5 Minutes

Follow these steps to get your API running:

---

## Step 1: Check MySQL Installation

First, verify MySQL is installed:

```powershell
# Check if MySQL is installed
mysql --version
```

**If MySQL is NOT installed:**
- Download from: https://dev.mysql.com/downloads/mysql/
- Or install via Chocolatey: `choco install mysql`
- Or use XAMPP: https://www.apachefriends.org/

---

## Step 2: Start MySQL Service

```powershell
# Start MySQL service
net start MySQL80

# Or if using XAMPP, start it from XAMPP Control Panel
```

---

## Step 3: Create Database

Open MySQL command line or MySQL Workbench and run:

```sql
-- Login to MySQL
mysql -u root -p

-- Create the database
CREATE DATABASE restaurant_search;

-- Verify it was created
SHOW DATABASES;

-- Exit
EXIT;
```

**Or use the SQL files directly:**

```powershell
# From your project directory
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seed.sql
```

---

## Step 4: Configure Environment Variables

Create a `.env` file in the project root:

```powershell
# Copy the example file
copy env.example .env

# Edit .env with your MySQL password
notepad .env
```

Update these values in `.env`:

```env
PORT=3000
NODE_ENV=development

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD_HERE
DB_NAME=restaurant_search
DB_PORT=3306
```

**Important**: Replace `YOUR_MYSQL_PASSWORD_HERE` with your actual MySQL root password!

---

## Step 5: Install Dependencies (Already Done ✅)

```powershell
npm install
```

---

## Step 6: Start the Server

```powershell
npm start
```

You should see:
```
✅ Database connected successfully
🚀 Server is running on port 3000
📝 Environment: development
🔗 API URL: http://localhost:3000
```

---

## Step 7: Test the API

Open a browser or new terminal:

```powershell
# Test health check
curl http://localhost:3000/

# Test search endpoint
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

---

## 🐛 Troubleshooting

### Error: "Database connection failed"

**Possible causes:**

1. **MySQL service not running**
   ```powershell
   # Check service status
   Get-Service -Name MySQL*
   
   # Start service
   net start MySQL80
   ```

2. **Wrong password in .env**
   - Open `.env` file
   - Make sure `DB_PASSWORD` matches your MySQL root password

3. **Database doesn't exist**
   ```sql
   mysql -u root -p
   CREATE DATABASE restaurant_search;
   ```

4. **MySQL not installed**
   - Install MySQL from: https://dev.mysql.com/downloads/mysql/
   - Or use Docker (see below)

### Error: "Port 3000 already in use"

```powershell
# Find process using port 3000
netstat -ano | findstr :3000

# Kill the process (replace PID with actual number)
taskkill /PID <PID> /F

# Or change PORT in .env to 3001
```

### Error: "Cannot find module"

```powershell
# Reinstall dependencies
rm -r node_modules
rm package-lock.json
npm install
```

---

## 🐳 Alternative: Use Docker (Easiest!)

If you have Docker installed, this is the easiest way:

```powershell
# Start everything (database + API)
docker-compose up -d

# Wait 30 seconds for database to initialize

# Test the API
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"

# View logs
docker-compose logs -f

# Stop everything
docker-compose down
```

**No MySQL installation needed with Docker!**

---

## ✅ Verification Checklist

Before the server can start, ensure:

- [ ] MySQL is installed and running
- [ ] Database `restaurant_search` exists
- [ ] Tables are created (schema.sql executed)
- [ ] Sample data is loaded (seed.sql executed)
- [ ] `.env` file exists with correct password
- [ ] Dependencies are installed (`npm install`)

---

## 📝 Quick Commands Reference

```powershell
# Check MySQL service
Get-Service -Name MySQL*

# Start MySQL
net start MySQL80

# Create database using SQL file
mysql -u root -p < database/schema.sql
mysql -u root -p < database/seed.sql

# Copy environment file
copy env.example .env

# Install dependencies
npm install

# Start server
npm start

# Test API (in another terminal)
curl http://localhost:3000/
curl "http://localhost:3000/search/dishes?name=biryani&minPrice=150&maxPrice=300"
```

---

## 🎯 Current Status

Based on your error, you need to:

1. ✅ Dependencies installed
2. ❌ MySQL not running or not configured
3. ❌ .env file not configured
4. ❌ Database not created

**Next steps**: Follow Steps 2-4 above to set up MySQL and database.

---

## 💡 Need Help?

- Check if MySQL is running: `Get-Service -Name MySQL*`
- Check MySQL version: `mysql --version`
- Test MySQL connection: `mysql -u root -p`

If you continue having issues, let me know your MySQL installation type (standalone, XAMPP, etc.).

---

**Good luck! 🚀**


# Troubleshooting Table Creation Errors

## Common Errors and Solutions

### Error 1: "Access denied for user"
**Problem**: You're trying to CREATE DATABASE but don't have permission.

**Solution**: 
- Don't create database, just create tables
- Use `schema-freesql.sql` instead of `schema.sql`

---

### Error 2: "Cannot add foreign key constraint"
**Problem**: Foreign keys might fail if:
- Tables don't exist in correct order
- Foreign key already exists
- Data type mismatch

**Solution**: 
- Try `schema-freesql.sql` (creates foreign keys separately)
- Or use `schema-simple.sql` (no foreign keys)

---

### Error 3: "Table already exists"
**Problem**: Tables were partially created before.

**Solution**: Drop tables first, then recreate:

```sql
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS restaurants;
```

Then run the CREATE TABLE statements again.

---

### Error 4: "Unknown database"
**Problem**: Database not selected.

**Solution**: 
1. In MySQL Workbench, select your database from dropdown
2. Or add: `USE your_database_name;` at the top

---

## Step-by-Step Fix

### Method 1: Use schema-freesql.sql (Recommended)

1. Open MySQL Workbench
2. Connect to your FreeSQLDatabase
3. **Select your database** from the schema dropdown (top left)
4. File → Open SQL Script → `database/schema-freesql.sql`
5. Execute (⚡ button)

---

### Method 2: Create Tables One by One

If you get errors, create tables one at a time:

**Step 1: Create restaurants table**
```sql
CREATE TABLE IF NOT EXISTS restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_city (city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```
✅ Execute this first

**Step 2: Create menu_items table**
```sql
CREATE TABLE IF NOT EXISTS menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    dish_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_dish_name (dish_name),
    INDEX idx_price (price),
    INDEX idx_restaurant_dish (restaurant_id, dish_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```
✅ Execute this second

**Step 3: Create orders table**
```sql
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_item_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_menu_item (menu_item_id),
    INDEX idx_order_date (order_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```
✅ Execute this third

**Step 4: Add foreign keys (optional)**
```sql
ALTER TABLE menu_items 
ADD CONSTRAINT fk_menu_restaurant 
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE;

ALTER TABLE orders 
ADD CONSTRAINT fk_order_menu_item 
FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE CASCADE;
```

---

### Method 3: Use Simple Version (No Foreign Keys)

If foreign keys keep causing issues:

1. Use `schema-simple.sql` 
2. This creates tables without foreign key constraints
3. Your API will still work fine!

---

## Verify Tables Were Created

Run this to check:

```sql
SHOW TABLES;
```

Should show:
- restaurants
- menu_items
- orders

Check structure:
```sql
DESCRIBE restaurants;
DESCRIBE menu_items;
DESCRIBE orders;
```

---

## What Error Are You Getting?

**Share the exact error message** and I can help you fix it specifically!

Common error messages:
- "Access denied" → Use schema-freesql.sql
- "Foreign key constraint fails" → Use schema-simple.sql
- "Table already exists" → Drop tables first
- "Unknown database" → Select database first


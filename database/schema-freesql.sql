-- Schema for FreeSQLDatabase (database already exists)
-- Make sure you select your database first in MySQL Workbench
-- Or use: USE your_database_name;

-- Step 1: Create restaurants table first (no dependencies)
CREATE TABLE IF NOT EXISTS restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_city (city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Step 2: Create menu_items table (depends on restaurants)
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

-- Add foreign key constraint separately (safer)
ALTER TABLE menu_items 
ADD CONSTRAINT fk_menu_restaurant 
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE;

-- Step 3: Create orders table (depends on menu_items)
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    menu_item_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_menu_item (menu_item_id),
    INDEX idx_order_date (order_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add foreign key constraint separately (safer)
ALTER TABLE orders 
ADD CONSTRAINT fk_order_menu_item 
FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE CASCADE;


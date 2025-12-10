USE restaurant_search;

-- Clear existing data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE orders;
TRUNCATE TABLE menu_items;
TRUNCATE TABLE restaurants;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert restaurants
INSERT INTO restaurants (id, name, city) VALUES
(1, 'Hyderabadi Spice House', 'Hyderabad'),
(2, 'Biryani Paradise', 'Hyderabad'),
(3, 'Mughlai Kitchen', 'Delhi'),
(4, 'Spice Garden', 'Mumbai'),
(5, 'Royal Biryani', 'Bangalore'),
(6, 'Flavors of India', 'Chennai'),
(7, 'The Curry House', 'Pune'),
(8, 'Tandoor Express', 'Kolkata'),
(9, 'Masala Magic', 'Hyderabad'),
(10, 'Heritage Restaurant', 'Lucknow'),
(11, 'Bay Leaf Bistro', 'Mumbai'),
(12, 'Spice Route', 'Delhi'),
(13, 'Golden Fork', 'Bangalore'),
(14, 'Taste of Tradition', 'Chennai'),
(15, 'Food Junction', 'Pune');

-- Insert menu items (Biryani dishes)
INSERT INTO menu_items (id, restaurant_id, dish_name, price) VALUES
-- Hyderabadi Spice House
(1, 1, 'Chicken Biryani', 220),
(2, 1, 'Mutton Biryani', 280),
(3, 1, 'Veg Biryani', 180),
-- Biryani Paradise
(4, 2, 'Chicken Biryani', 250),
(5, 2, 'Dum Biryani', 290),
(6, 2, 'Prawn Biryani', 350),
-- Mughlai Kitchen
(7, 3, 'Chicken Biryani', 200),
(8, 3, 'Mutton Biryani', 320),
(9, 3, 'Paneer Biryani', 190),
-- Spice Garden
(10, 4, 'Chicken Biryani', 240),
(11, 4, 'Fish Biryani', 280),
(12, 4, 'Egg Biryani', 160),
-- Royal Biryani
(13, 5, 'Chicken Biryani', 230),
(14, 5, 'Mutton Biryani', 300),
(15, 5, 'Hyderabadi Biryani', 260),
-- Flavors of India
(16, 6, 'Chicken Biryani', 210),
(17, 6, 'Veg Biryani', 170),
(18, 6, 'Mutton Biryani', 290),
-- The Curry House
(19, 7, 'Chicken Biryani', 195),
(20, 7, 'Paneer Biryani', 175),
(21, 7, 'Egg Biryani', 150),
-- Tandoor Express
(22, 8, 'Chicken Biryani', 225),
(23, 8, 'Mutton Biryani', 310),
(24, 8, 'Kolkata Biryani', 240),
-- Masala Magic
(25, 9, 'Chicken Biryani', 215),
(26, 9, 'Veg Biryani', 185),
(27, 9, 'Prawn Biryani', 340),
-- Heritage Restaurant
(28, 10, 'Chicken Biryani', 235),
(29, 10, 'Mutton Biryani', 295),
(30, 10, 'Lucknowi Biryani', 270),
-- Bay Leaf Bistro
(31, 11, 'Chicken Biryani', 260),
(32, 11, 'Fish Biryani', 300),
-- Spice Route
(33, 12, 'Chicken Biryani', 190),
(34, 12, 'Paneer Biryani', 165),
-- Golden Fork
(35, 13, 'Chicken Biryani', 245),
(36, 13, 'Mutton Biryani', 305),
-- Taste of Tradition
(37, 14, 'Chicken Biryani', 205),
(38, 14, 'Veg Biryani', 175),
-- Food Junction
(39, 15, 'Chicken Biryani', 220),
(40, 15, 'Egg Biryani', 155);

-- Insert more diverse menu items (non-biryani)
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(1, 'Butter Chicken', 250),
(1, 'Paneer Tikka', 180),
(2, 'Dal Makhani', 160),
(3, 'Tandoori Chicken', 240),
(4, 'Fish Curry', 280),
(5, 'Chicken Tikka', 220),
(6, 'Masala Dosa', 120),
(7, 'Palak Paneer', 170),
(8, 'Rogan Josh', 290),
(9, 'Chole Bhature', 140),
(10, 'Kebab Platter', 320),
(11, 'Seafood Platter', 450),
(12, 'Naan Combo', 100),
(13, 'Thali', 200),
(14, 'Sambar Rice', 130),
(15, 'Pizza', 250);

-- Insert orders for Chicken Biryani (simulating popularity)
-- Restaurant 1 - Hyderabadi Spice House (96 orders)
INSERT INTO orders (menu_item_id) 
SELECT 1 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 96;

-- Restaurant 13 - Golden Fork (85 orders)
INSERT INTO orders (menu_item_id) 
SELECT 35 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 85;

-- Restaurant 11 - Bay Leaf Bistro (78 orders)
INSERT INTO orders (menu_item_id) 
SELECT 31 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 78;

-- Restaurant 2 - Biryani Paradise (72 orders)
INSERT INTO orders (menu_item_id) 
SELECT 4 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 72;

-- Restaurant 10 - Heritage Restaurant (68 orders)
INSERT INTO orders (menu_item_id) 
SELECT 28 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 68;

-- Restaurant 4 - Spice Garden (65 orders)
INSERT INTO orders (menu_item_id) 
SELECT 10 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 65;

-- Restaurant 5 - Royal Biryani (62 orders)
INSERT INTO orders (menu_item_id) 
SELECT 13 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 62;

-- Restaurant 8 - Tandoor Express (58 orders)
INSERT INTO orders (menu_item_id) 
SELECT 22 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 58;

-- Restaurant 15 - Food Junction (55 orders)
INSERT INTO orders (menu_item_id) 
SELECT 39 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 55;

-- Restaurant 9 - Masala Magic (52 orders)
INSERT INTO orders (menu_item_id) 
SELECT 25 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 52;

-- Restaurant 6 - Flavors of India (48 orders)
INSERT INTO orders (menu_item_id) 
SELECT 16 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 48;

-- Restaurant 14 - Taste of Tradition (45 orders)
INSERT INTO orders (menu_item_id) 
SELECT 37 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 45;

-- Restaurant 3 - Mughlai Kitchen (42 orders)
INSERT INTO orders (menu_item_id) 
SELECT 7 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 42;

-- Restaurant 12 - Spice Route (38 orders)
INSERT INTO orders (menu_item_id) 
SELECT 33 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 38;

-- Restaurant 7 - The Curry House (35 orders)
INSERT INTO orders (menu_item_id) 
SELECT 19 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t2,
               (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3
LIMIT 35;

-- Add some orders for other dishes to make data more realistic
INSERT INTO orders (menu_item_id) 
SELECT 2 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
              (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t2
LIMIT 45;

INSERT INTO orders (menu_item_id) 
SELECT 5 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
              (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t2
LIMIT 40;

INSERT INTO orders (menu_item_id) 
SELECT 8 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) t1,
              (SELECT 1 UNION ALL SELECT 2) t2
LIMIT 30;

-- Add random orders for other menu items
INSERT INTO orders (menu_item_id)
SELECT 41 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1, (SELECT 1 UNION ALL SELECT 2) t2 LIMIT 25;

INSERT INTO orders (menu_item_id)
SELECT 42 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1, (SELECT 1 UNION ALL SELECT 2) t2 LIMIT 20;

INSERT INTO orders (menu_item_id)
SELECT 43 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1, (SELECT 1 UNION ALL SELECT 2) t2 LIMIT 18;

INSERT INTO orders (menu_item_id)
SELECT 44 FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1, (SELECT 1 UNION ALL SELECT 2) t2 LIMIT 22;


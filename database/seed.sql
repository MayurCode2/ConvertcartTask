-- Restaurant Dish Search - Sample Data
-- This file contains realistic sample data for testing

USE restaurant_search;

-- Insert restaurants
INSERT INTO restaurants (name, city) VALUES
('Hyderabadi Spice House', 'Hyderabad'),
('Royal Biryani Palace', 'Hyderabad'),
('Mumbai Masala', 'Mumbai'),
('Delhi Delights', 'Delhi'),
('Bangalore Bites', 'Bangalore'),
('Chennai Curry House', 'Chennai'),
('Kolkata Kitchen', 'Kolkata'),
('Pune Paradise', 'Pune'),
('Jaipur Junction', 'Jaipur'),
('Ahmedabad Aroma', 'Ahmedabad'),
('Bay Leaf Bistro', 'Mumbai'),
('Spice Garden', 'Delhi'),
('Golden Fork', 'Bangalore'),
('Tasty Treats', 'Chennai'),
('Food Factory', 'Hyderabad');

-- Insert menu items for each restaurant
-- Restaurant 1: Hyderabadi Spice House
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(1, 'Chicken Biryani', 220),
(1, 'Mutton Biryani', 280),
(1, 'Veg Biryani', 180),
(1, 'Hyderabadi Haleem', 200);

-- Restaurant 2: Royal Biryani Palace
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(2, 'Chicken Biryani', 240),
(2, 'Mutton Biryani', 300),
(2, 'Fish Biryani', 250),
(2, 'Paneer Biryani', 190);

-- Restaurant 3: Mumbai Masala
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(3, 'Chicken Biryani', 230),
(3, 'Butter Chicken', 280),
(3, 'Paneer Tikka', 220),
(3, 'Dal Makhani', 160);

-- Restaurant 4: Delhi Delights
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(4, 'Chicken Biryani', 200),
(4, 'Mutton Biryani', 290),
(4, 'Tandoori Chicken', 250),
(4, 'Kadai Paneer', 180);

-- Restaurant 5: Bangalore Bites
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(5, 'Chicken Biryani', 210),
(5, 'Mutton Biryani', 270),
(5, 'Veg Biryani', 170),
(5, 'Chicken Curry', 200);

-- Restaurant 6: Chennai Curry House
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(6, 'Chicken Biryani', 190),
(6, 'Mutton Biryani', 260),
(6, 'Fish Curry', 220),
(6, 'Chettinad Chicken', 240);

-- Restaurant 7: Kolkata Kitchen
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(7, 'Chicken Biryani', 195),
(7, 'Mutton Biryani', 275),
(7, 'Fish Biryani', 230),
(7, 'Chicken Kasha', 210);

-- Restaurant 8: Pune Paradise
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(8, 'Chicken Biryani', 215),
(8, 'Mutton Biryani', 285),
(8, 'Veg Biryani', 175),
(8, 'Chicken Kolhapuri', 220);

-- Restaurant 9: Jaipur Junction
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(9, 'Chicken Biryani', 205),
(9, 'Mutton Biryani', 265),
(9, 'Laal Maas', 300),
(9, 'Dal Baati', 150);

-- Restaurant 10: Ahmedabad Aroma
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(10, 'Chicken Biryani', 225),
(10, 'Mutton Biryani', 295),
(10, 'Veg Biryani', 185),
(10, 'Gujarati Thali', 200);

-- Restaurant 11: Bay Leaf Bistro
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(11, 'Chicken Biryani', 260),
(11, 'Mutton Biryani', 320),
(11, 'Prawn Biryani', 280),
(11, 'Butter Chicken', 270);

-- Restaurant 12: Spice Garden
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(12, 'Chicken Biryani', 235),
(12, 'Mutton Biryani', 305),
(12, 'Veg Biryani', 195),
(12, 'Chicken Tikka Masala', 250);

-- Restaurant 13: Golden Fork
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(13, 'Chicken Biryani', 245),
(13, 'Mutton Biryani', 310),
(13, 'Egg Biryani', 160),
(13, 'Paneer Butter Masala', 210);

-- Restaurant 14: Tasty Treats
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(14, 'Chicken Biryani', 180),
(14, 'Mutton Biryani', 250),
(14, 'Veg Biryani', 140),
(14, 'Chicken 65', 190);

-- Restaurant 15: Food Factory
INSERT INTO menu_items (restaurant_id, dish_name, price) VALUES
(15, 'Chicken Biryani', 255),
(15, 'Mutton Biryani', 315),
(15, 'Veg Biryani', 200),
(15, 'Hyderabadi Marag', 230);

-- Insert orders (distributed to make certain restaurants most popular)
-- Restaurant 1 (Hyderabadi Spice House) - Most popular for Chicken Biryani (96 orders)
INSERT INTO orders (menu_item_id, order_date)
SELECT 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2
LIMIT 96;

-- Restaurant 13 (Golden Fork) - Second most popular for Chicken Biryani (85 orders)
INSERT INTO orders (menu_item_id, order_date)
SELECT 49, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8) t2
LIMIT 85;

-- Restaurant 11 (Bay Leaf Bistro) - Third most popular for Chicken Biryani (78 orders)
INSERT INTO orders (menu_item_id, order_date)
SELECT 41, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8) t2
LIMIT 78;

-- Restaurant 2 (Royal Biryani Palace) - 72 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 5, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7) t2
LIMIT 72;

-- Restaurant 15 (Food Factory) - 68 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 57, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7) t2
LIMIT 68;

-- Restaurant 12 (Spice Garden) - 65 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 45, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6) t2
LIMIT 65;

-- Restaurant 3 (Mumbai Masala) - 62 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 9, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6) t2
LIMIT 62;

-- Restaurant 10 (Ahmedabad Aroma) - 58 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 37, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6) t2
LIMIT 58;

-- Restaurant 8 (Pune Paradise) - 54 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 29, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 54;

-- Restaurant 5 (Bangalore Bites) - 50 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 17, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 50;

-- Restaurant 9 (Jaipur Junction) - 47 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 33, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 47;

-- Restaurant 4 (Delhi Delights) - 45 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 13, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 45;

-- Restaurant 7 (Kolkata Kitchen) - 42 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 25, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 42;

-- Restaurant 6 (Chennai Curry House) - 38 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 21, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 38;

-- Restaurant 14 (Tasty Treats) - 35 orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 53, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 35;

-- Add some orders for other dishes (Mutton Biryani, Veg Biryani, etc.) to make the database more realistic
-- Mutton Biryani orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 2, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2
LIMIT 52;

-- Veg Biryani orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 3, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 40;

-- Butter Chicken orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 10, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2
LIMIT 35;

-- Paneer dishes orders
INSERT INTO orders (menu_item_id, order_date)
SELECT 11, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 90) DAY)
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3) t2
LIMIT 30;

-- Display summary
SELECT 
    'Database seeded successfully!' AS status,
    (SELECT COUNT(*) FROM restaurants) AS restaurants,
    (SELECT COUNT(*) FROM menu_items) AS menu_items,
    (SELECT COUNT(*) FROM orders) AS orders;

-- Show top 10 restaurants for Chicken Biryani
SELECT 
    r.name AS restaurantName,
    r.city,
    m.dish_name AS dishName,
    m.price AS dishPrice,
    COUNT(o.id) AS orderCount
FROM restaurants r
INNER JOIN menu_items m ON r.id = m.restaurant_id
INNER JOIN orders o ON m.id = o.menu_item_id
WHERE m.dish_name LIKE '%Chicken Biryani%'
GROUP BY r.id, r.name, r.city, m.dish_name, m.price
ORDER BY orderCount DESC
LIMIT 10;


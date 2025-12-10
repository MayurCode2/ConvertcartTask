/**
 * Check if database has data
 * Run: node check-data.js
 */

require('dotenv').config();
const { pool } = require('./src/config/database');

async function checkData() {
  try {
    console.log('🔍 Checking database data...\n');

    // Check restaurants
    const [restaurants] = await pool.execute('SELECT COUNT(*) as count FROM restaurants');
    console.log(`Restaurants: ${restaurants[0].count}`);

    // Check menu items
    const [menuItems] = await pool.execute('SELECT COUNT(*) as count FROM menu_items');
    console.log(`Menu Items: ${menuItems[0].count}`);

    // Check orders
    const [orders] = await pool.execute('SELECT COUNT(*) as count FROM orders');
    console.log(`Orders: ${orders[0].count}`);

    // Check for biryani dishes
    const [biryani] = await pool.execute(
      "SELECT COUNT(*) as count FROM menu_items WHERE dish_name LIKE '%biryani%'"
    );
    console.log(`Biryani dishes: ${biryani[0].count}`);

    // Show sample data
    if (restaurants[0].count > 0) {
      console.log('\n📋 Sample restaurants:');
      const [samples] = await pool.execute('SELECT id, name, city FROM restaurants LIMIT 5');
      samples.forEach(r => console.log(`  - ${r.name} (${r.city})`));
    }

    if (menuItems[0].count > 0) {
      console.log('\n🍽️  Sample menu items:');
      const [dishes] = await pool.execute(
        "SELECT dish_name, price FROM menu_items WHERE dish_name LIKE '%biryani%' LIMIT 5"
      );
      dishes.forEach(d => console.log(`  - ${d.dish_name}: ₹${d.price}`));
    }

    if (restaurants[0].count === 0) {
      console.log('\n❌ NO DATA FOUND!');
      console.log('You need to run database/seed.sql to load sample data.');
      console.log('\nSteps:');
      console.log('1. Open MySQL Workbench');
      console.log('2. Select your database');
      console.log('3. File → Open SQL Script → database/seed.sql');
      console.log('4. Click Execute (⚡)');
    } else if (orders[0].count === 0) {
      console.log('\n⚠️  Tables exist but no orders found!');
      console.log('You need to run database/seed.sql to load orders.');
    } else {
      console.log('\n✅ Data exists! Your API should work now.');
    }

    process.exit(0);
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

checkData();


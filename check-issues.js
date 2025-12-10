/**
 * Diagnostic Script - Check for Issues
 * Run: node check-issues.js
 */

const fs = require('fs');
const path = require('path');

console.log('🔍 Checking for Issues...\n');

let issues = [];
let warnings = [];

// Check 1: Required files exist
console.log('1. Checking required files...');
const requiredFiles = [
  'server.js',
  'src/app.js',
  'src/config/database.js',
  'src/models/Dish.js',
  'src/views/Response.js',
  'src/controllers/DishController.js',
  'src/routes/dishRoutes.js',
  'package.json',
  '.env'
];

requiredFiles.forEach(file => {
  if (fs.existsSync(file)) {
    console.log(`   ✅ ${file}`);
  } else {
    console.log(`   ❌ ${file} - MISSING`);
    issues.push(`Missing file: ${file}`);
  }
});

// Check 2: Package.json has test script
console.log('\n2. Checking package.json...');
try {
  const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
  if (pkg.scripts && pkg.scripts.test) {
    console.log('   ✅ Test script found');
  } else {
    console.log('   ⚠️  Test script missing');
    warnings.push('Add "test": "node test-api.js" to package.json scripts');
  }
} catch (e) {
  issues.push('Cannot read package.json');
}

// Check 3: Check imports
console.log('\n3. Checking module imports...');
try {
  require('./src/models/Dish');
  console.log('   ✅ Dish model loads');
} catch (e) {
  console.log(`   ❌ Dish model error: ${e.message}`);
  issues.push(`Dish model: ${e.message}`);
}

try {
  require('./src/views/Response');
  console.log('   ✅ Response view loads');
} catch (e) {
  console.log(`   ❌ Response view error: ${e.message}`);
  issues.push(`Response view: ${e.message}`);
}

try {
  require('./src/controllers/DishController');
  console.log('   ✅ DishController loads');
} catch (e) {
  console.log(`   ❌ DishController error: ${e.message}`);
  issues.push(`DishController: ${e.message}`);
}

try {
  require('./src/routes/dishRoutes');
  console.log('   ✅ Routes load');
} catch (e) {
  console.log(`   ❌ Routes error: ${e.message}`);
  issues.push(`Routes: ${e.message}`);
}

try {
  require('./src/app');
  console.log('   ✅ App loads');
} catch (e) {
  console.log(`   ❌ App error: ${e.message}`);
  issues.push(`App: ${e.message}`);
}

// Check 4: Check .env file
console.log('\n4. Checking .env configuration...');
if (fs.existsSync('.env')) {
  const envContent = fs.readFileSync('.env', 'utf8');
  const requiredVars = ['DB_HOST', 'DB_USER', 'DB_PASSWORD', 'DB_NAME'];
  let missingVars = [];
  
  requiredVars.forEach(variable => {
    if (envContent.includes(variable)) {
      console.log(`   ✅ ${variable} found`);
    } else {
      console.log(`   ⚠️  ${variable} missing`);
      missingVars.push(variable);
    }
  });
  
  if (envContent.includes('your_password') || envContent.includes('YOUR_PASSWORD')) {
    warnings.push('Update DB_PASSWORD in .env with your actual database password');
  }
  
  if (missingVars.length > 0) {
    warnings.push(`Missing environment variables: ${missingVars.join(', ')}`);
  }
} else {
  issues.push('.env file not found - copy from env.example');
}

// Check 5: Check for duplicate files
console.log('\n5. Checking for duplicate files...');
const controllersDir = 'src/controllers';
if (fs.existsSync(controllersDir)) {
  const files = fs.readdirSync(controllersDir);
  const controllerFiles = files.filter(f => f.toLowerCase().includes('controller'));
  if (controllerFiles.length > 1) {
    console.log(`   ⚠️  Multiple controller files found: ${controllerFiles.join(', ')}`);
    warnings.push(`Multiple controller files - keep only DishController.js`);
  } else {
    console.log('   ✅ No duplicate controllers');
  }
}

// Summary
console.log('\n' + '='.repeat(50));
console.log('📊 SUMMARY');
console.log('='.repeat(50));

if (issues.length === 0 && warnings.length === 0) {
  console.log('✅ No issues found! Everything looks good.');
  console.log('\nNext steps:');
  console.log('  1. Make sure database is set up');
  console.log('  2. Run: npm start');
  console.log('  3. Run: npm test (in another terminal)');
} else {
  if (issues.length > 0) {
    console.log(`\n❌ ISSUES FOUND (${issues.length}):`);
    issues.forEach((issue, i) => {
      console.log(`   ${i + 1}. ${issue}`);
    });
  }
  
  if (warnings.length > 0) {
    console.log(`\n⚠️  WARNINGS (${warnings.length}):`);
    warnings.forEach((warning, i) => {
      console.log(`   ${i + 1}. ${warning}`);
    });
  }
}

console.log('\n' + '='.repeat(50));

process.exit(issues.length > 0 ? 1 : 0);


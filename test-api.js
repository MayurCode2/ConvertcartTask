/**
 * API Test Script
 * Run this to test if your API is working properly
 * Usage: node test-api.js
 */

const http = require('http');

const BASE_URL = 'http://localhost:3000';
let testsPassed = 0;
let testsFailed = 0;

// Colors for console output
const colors = {
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  reset: '\x1b[0m'
};

/**
 * Make HTTP request
 */
function makeRequest(url) {
  return new Promise((resolve, reject) => {
    http.get(url, (res) => {
      let data = '';

      res.on('data', (chunk) => {
        data += chunk;
      });

      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          resolve({ status: res.statusCode, data: json });
        } catch (e) {
          resolve({ status: res.statusCode, data: data });
        }
      });
    }).on('error', (err) => {
      reject(err);
    });
  });
}

/**
 * Test function
 */
async function test(name, url, expectedStatus, validator) {
  try {
    console.log(`${colors.blue}Testing: ${name}${colors.reset}`);
    const result = await makeRequest(url);

    if (result.status === expectedStatus && validator(result.data)) {
      console.log(`${colors.green}✅ PASS${colors.reset}\n`);
      testsPassed++;
      return true;
    } else {
      console.log(`${colors.red}❌ FAIL${colors.reset}`);
      console.log(`   Expected status: ${expectedStatus}, Got: ${result.status}`);
      console.log(`   Response:`, JSON.stringify(result.data, null, 2));
      console.log('');
      testsFailed++;
      return false;
    }
  } catch (error) {
    console.log(`${colors.red}❌ ERROR${colors.reset}`);
    console.log(`   ${error.message}\n`);
    testsFailed++;
    return false;
  }
}

/**
 * Run all tests
 */
async function runTests() {
  console.log(`${colors.yellow}🧪 Starting API Tests...${colors.reset}\n`);
  console.log(`Base URL: ${BASE_URL}\n`);

  // Test 1: Health Check
  await test(
    'Health Check - GET /',
    `${BASE_URL}/`,
    200,
    (data) => data.success === true && data.message !== undefined
  );

  // Test 2: Search Dishes - Valid Request
  await test(
    'Search Dishes - Valid Request',
    `${BASE_URL}/search/dishes?name=biryani&minPrice=150&maxPrice=300`,
    200,
    (data) => data.success === true && Array.isArray(data.restaurants)
  );

  // Test 3: Search Dishes - Missing Name
  await test(
    'Search Dishes - Missing Name Parameter',
    `${BASE_URL}/search/dishes?minPrice=150&maxPrice=300`,
    400,
    (data) => data.success === false && data.message.includes('name')
  );

  // Test 4: Search Dishes - Missing Price
  await test(
    'Search Dishes - Missing Price Parameter',
    `${BASE_URL}/search/dishes?name=biryani`,
    400,
    (data) => data.success === false && data.message.includes('price')
  );

  // Test 5: Search Dishes - Invalid Price
  await test(
    'Search Dishes - Invalid Price (not a number)',
    `${BASE_URL}/search/dishes?name=biryani&minPrice=abc&maxPrice=300`,
    400,
    (data) => data.success === false && data.message.includes('number')
  );

  // Test 6: Search Dishes - Min > Max
  await test(
    'Search Dishes - Min Price > Max Price',
    `${BASE_URL}/search/dishes?name=biryani&minPrice=300&maxPrice=150`,
    400,
    (data) => data.success === false && data.message.includes('greater')
  );

  // Test 7: Database Stats
  await test(
    'Database Statistics - GET /search/stats',
    `${BASE_URL}/search/stats`,
    200,
    (data) => data.success === true && data.stats !== undefined
  );

  // Test 8: 404 Not Found
  await test(
    '404 Not Found - Invalid Endpoint',
    `${BASE_URL}/invalid-endpoint`,
    404,
    (data) => data.success === false && data.message.includes('not found')
  );

  // Print Summary
  console.log(`${colors.yellow}═══════════════════════════════════════${colors.reset}`);
  console.log(`${colors.blue}Test Summary:${colors.reset}`);
  console.log(`${colors.green}✅ Passed: ${testsPassed}${colors.reset}`);
  console.log(`${colors.red}❌ Failed: ${testsFailed}${colors.reset}`);
  console.log(`${colors.yellow}Total: ${testsPassed + testsFailed}${colors.reset}`);
  console.log(`${colors.yellow}═══════════════════════════════════════${colors.reset}\n`);

  if (testsFailed === 0) {
    console.log(`${colors.green}🎉 All tests passed! Your API is working correctly!${colors.reset}\n`);
    process.exit(0);
  } else {
    console.log(`${colors.red}⚠️  Some tests failed. Please check the errors above.${colors.reset}\n`);
    process.exit(1);
  }
}

// Check if server is running
console.log(`${colors.yellow}Checking if server is running...${colors.reset}\n`);

makeRequest(`${BASE_URL}/`)
  .then(() => {
    console.log(`${colors.green}✅ Server is running!${colors.reset}\n`);
    runTests();
  })
  .catch((error) => {
    console.log(`${colors.red}❌ Cannot connect to server!${colors.reset}`);
    console.log(`   Make sure the server is running: ${colors.blue}npm start${colors.reset}`);
    console.log(`   Error: ${error.message}\n`);
    process.exit(1);
  });


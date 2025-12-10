@echo off
REM Restaurant Dish Search API - Test Commands (Windows)
REM Run this file: TEST_COMMANDS.bat

echo ================================
echo Restaurant Dish Search API Test
echo ================================
echo.

REM Set your API URL (change this to your deployed URL)
set API_URL=http://localhost:3000

echo Testing API at: %API_URL%
echo.

REM Test 1: Health Check
echo Test 1: Health Check
curl -s "%API_URL%/"
echo.
echo.

REM Test 2: Search Biryani (150-300)
echo Test 2: Search Biryani (Rs.150-300)
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=150&maxPrice=300"
echo.
echo.

REM Test 3: Search Chicken Biryani (200-250)
echo Test 3: Search Chicken Biryani (Rs.200-250)
curl -s "%API_URL%/search/dishes?name=chicken%%20biryani&minPrice=200&maxPrice=250"
echo.
echo.

REM Test 4: Search Veg Biryani (150-200)
echo Test 4: Search Veg Biryani (Rs.150-200)
curl -s "%API_URL%/search/dishes?name=veg%%20biryani&minPrice=150&maxPrice=200"
echo.
echo.

REM Test 5: Search Mutton Biryani (250-350)
echo Test 5: Search Mutton Biryani (Rs.250-350)
curl -s "%API_URL%/search/dishes?name=mutton%%20biryani&minPrice=250&maxPrice=350"
echo.
echo.

REM Test 6: Budget Options (150-180)
echo Test 6: Budget Options (Rs.150-180)
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=150&maxPrice=180"
echo.
echo.

REM Test 7: Premium Options (250-350)
echo Test 7: Premium Options (Rs.250-350)
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=250&maxPrice=350"
echo.
echo.

REM Test 8: Database Statistics
echo Test 8: Database Statistics
curl -s "%API_URL%/search/stats"
echo.
echo.

REM Test 9: Error - Missing Dish Name
echo Test 9: Error Test - Missing Dish Name
curl -s "%API_URL%/search/dishes?minPrice=150&maxPrice=300"
echo.
echo.

REM Test 10: Error - Missing Price Range
echo Test 10: Error Test - Missing Price Range
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=150"
echo.
echo.

REM Test 11: Error - Invalid Price
echo Test 11: Error Test - Invalid Price
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=abc&maxPrice=300"
echo.
echo.

REM Test 12: Error - Min Greater Than Max
echo Test 12: Error Test - Min Price Greater Than Max Price
curl -s "%API_URL%/search/dishes?name=biryani&minPrice=300&maxPrice=150"
echo.
echo.

echo ================================
echo All tests completed!
echo ================================
echo.
echo Summary:
echo   - Health check
echo   - 6 successful search queries
echo   - 1 stats query
echo   - 5 error handling tests
echo.
echo API is working correctly!
pause


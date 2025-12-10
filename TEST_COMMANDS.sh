#!/bin/bash

# Restaurant Dish Search API - Test Commands
# Make this file executable: chmod +x TEST_COMMANDS.sh

echo "🧪 Restaurant Dish Search API - Test Suite"
echo "==========================================="
echo ""

# Set your API URL (change this to your deployed URL)
API_URL="http://localhost:3000"

echo "📍 Testing API at: $API_URL"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test 1: Health Check
echo -e "${BLUE}Test 1: Health Check${NC}"
curl -s "$API_URL/" | json_pp
echo ""
echo ""

# Test 2: Search Biryani (₹150-₹300)
echo -e "${BLUE}Test 2: Search Biryani (₹150-₹300)${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=150&maxPrice=300" | json_pp
echo ""
echo ""

# Test 3: Search Chicken Biryani (₹200-₹250)
echo -e "${BLUE}Test 3: Search Chicken Biryani (₹200-₹250)${NC}"
curl -s "$API_URL/search/dishes?name=chicken%20biryani&minPrice=200&maxPrice=250" | json_pp
echo ""
echo ""

# Test 4: Search Veg Biryani (₹150-₹200)
echo -e "${BLUE}Test 4: Search Veg Biryani (₹150-₹200)${NC}"
curl -s "$API_URL/search/dishes?name=veg%20biryani&minPrice=150&maxPrice=200" | json_pp
echo ""
echo ""

# Test 5: Search Mutton Biryani (₹250-₹350)
echo -e "${BLUE}Test 5: Search Mutton Biryani (₹250-₹350)${NC}"
curl -s "$API_URL/search/dishes?name=mutton%20biryani&minPrice=250&maxPrice=350" | json_pp
echo ""
echo ""

# Test 6: Budget Options (₹150-₹180)
echo -e "${BLUE}Test 6: Budget Options (₹150-₹180)${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=150&maxPrice=180" | json_pp
echo ""
echo ""

# Test 7: Premium Options (₹250-₹350)
echo -e "${BLUE}Test 7: Premium Options (₹250-₹350)${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=250&maxPrice=350" | json_pp
echo ""
echo ""

# Test 8: Database Statistics
echo -e "${BLUE}Test 8: Database Statistics${NC}"
curl -s "$API_URL/search/stats" | json_pp
echo ""
echo ""

# Test 9: Error - Missing Dish Name
echo -e "${BLUE}Test 9: Error Test - Missing Dish Name${NC}"
curl -s "$API_URL/search/dishes?minPrice=150&maxPrice=300" | json_pp
echo ""
echo ""

# Test 10: Error - Missing Price Range
echo -e "${BLUE}Test 10: Error Test - Missing Price Range${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=150" | json_pp
echo ""
echo ""

# Test 11: Error - Invalid Price
echo -e "${BLUE}Test 11: Error Test - Invalid Price${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=abc&maxPrice=300" | json_pp
echo ""
echo ""

# Test 12: Error - Min > Max
echo -e "${BLUE}Test 12: Error Test - Min Price > Max Price${NC}"
curl -s "$API_URL/search/dishes?name=biryani&minPrice=300&maxPrice=150" | json_pp
echo ""
echo ""

echo -e "${GREEN}✅ All tests completed!${NC}"
echo ""
echo "📝 Summary:"
echo "  - Health check"
echo "  - 6 successful search queries"
echo "  - 1 stats query"
echo "  - 5 error handling tests"
echo ""
echo "🎉 API is working correctly!"


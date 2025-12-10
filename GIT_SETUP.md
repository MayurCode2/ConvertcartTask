# Git Setup & Deployment Guide

This guide will help you push the project to GitHub and deploy it.

## 📋 Prerequisites

- Git installed on your system
- GitHub account created
- Project files ready in your local directory

## 🚀 Initial Git Setup

### Step 1: Initialize Git Repository

```bash
# Navigate to your project directory
cd restaurant-dish-search

# Initialize git repository
git init

# Check status
git status
```

### Step 2: Create GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click the **"+"** icon (top right) → **"New repository"**
3. Fill in details:
   - **Repository name**: `restaurant-dish-search`
   - **Description**: `Backend service to search restaurants by dish name with price filtering`
   - **Visibility**: Public
   - ⚠️ **DO NOT** initialize with README, .gitignore, or license (we already have these)
4. Click **"Create repository"**

### Step 3: Add Files to Git

```bash
# Add all files to staging
git add .

# Check what will be committed
git status

# Commit with message
git commit -m "Initial commit: Complete restaurant dish search API"
```

### Step 4: Push to GitHub

```bash
# Add remote repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/restaurant-dish-search.git

# Verify remote was added
git remote -v

# Push to GitHub
git branch -M main
git push -u origin main
```

🎉 **Your code is now on GitHub!**

## 🌐 Get Your Public URL

After pushing, your repository will be at:
```
https://github.com/YOUR_USERNAME/restaurant-dish-search
```

## 🚢 Deploy to Railway (Recommended)

### Option 1: Deploy from GitHub

1. Go to [Railway.app](https://railway.app)
2. Click **"Start a New Project"**
3. Select **"Deploy from GitHub repo"**
4. Choose `restaurant-dish-search`
5. Railway will auto-deploy

### Option 2: Deploy with Railway CLI

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Initialize project
railway init

# Add MySQL database
railway add --database mysql

# Deploy
railway up

# Get public URL
railway domain
```

### Configure Railway

1. **Add MySQL Database**:
   - In Railway dashboard, click "New"
   - Select "Database" → "MySQL"
   - Railway auto-configures connection

2. **Set Environment Variables**:
   - Go to your service
   - Click "Variables"
   - Add:
     ```
     NODE_ENV=production
     DB_HOST=${{MySQL.MYSQL_HOST}}
     DB_USER=${{MySQL.MYSQL_USER}}
     DB_PASSWORD=${{MySQL.MYSQL_PASSWORD}}
     DB_NAME=${{MySQL.MYSQL_DATABASE}}
     DB_PORT=${{MySQL.MYSQL_PORT}}
     ```

3. **Initialize Database**:
   - Click on MySQL service
   - Open "Data" tab
   - Copy contents of `database/schema.sql` and execute
   - Copy contents of `database/seed.sql` and execute

4. **Generate Public Domain**:
   - Go to your web service settings
   - Click "Generate Domain"
   - Copy your public URL

5. **Test Your API**:
   ```bash
   curl "https://your-app.railway.app/search/dishes?name=biryani&minPrice=150&maxPrice=300"
   ```

## 🎨 Deploy to Render

1. Go to [Render.com](https://render.com)
2. Click **"New"** → **"Web Service"**
3. Connect GitHub repository
4. Configure:
   - **Name**: `restaurant-dish-search`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
5. Add environment variables (see DEPLOYMENT.md)
6. Click **"Create Web Service"**

**Note**: Render requires external MySQL. Use Railway MySQL or PlanetScale.

## 📝 Update README with Links

After deployment, update your README.md with actual URLs:

```bash
# Edit README.md and add:
# - GitHub Repository: https://github.com/YOUR_USERNAME/restaurant-dish-search
# - Live API: https://your-app.railway.app
```

## 🔄 Making Updates

### Update Code

```bash
# Make changes to your code
# ...

# Check what changed
git status
git diff

# Add changes
git add .

# Commit
git commit -m "Description of changes"

# Push to GitHub
git push origin main
```

Railway/Render will automatically redeploy!

## 🌟 Repository Best Practices

### Add Topics to GitHub Repository

1. Go to your repository on GitHub
2. Click the gear icon ⚙️ next to "About"
3. Add topics:
   - `nodejs`
   - `express`
   - `mysql`
   - `restaurant-api`
   - `backend`
   - `api`
   - `rest-api`

### Create Good Repository Description

Add this to your repository description:
```
🍽️ Backend service to search restaurants by dish name with mandatory price range filtering. Built with Node.js, Express, and MySQL. Features optimized queries, comprehensive seed data, and ready for deployment.
```

### Add Repository Links

In your GitHub repository "About" section, add:
- **Website**: Your deployed Railway/Render URL
- **Topics**: nodejs, express, mysql, api, restaurant

## 📊 Share Your Project

### Share These Links

1. **GitHub Repository**:
   ```
   https://github.com/YOUR_USERNAME/restaurant-dish-search
   ```

2. **Live API**:
   ```
   https://your-app.railway.app
   ```

3. **Example API Call**:
   ```
   https://your-app.railway.app/search/dishes?name=biryani&minPrice=150&maxPrice=300
   ```

### Create a Nice Project Preview

Add this to your email/submission:

```
Project: Restaurant Dish Search API

📁 GitHub Repository:
https://github.com/YOUR_USERNAME/restaurant-dish-search

🌐 Live API:
https://your-app.railway.app

🔍 Try the API:
https://your-app.railway.app/search/dishes?name=biryani&minPrice=150&maxPrice=300

📝 Key Features:
✅ Search restaurants by dish name
✅ Mandatory price range filtering
✅ Returns top 10 restaurants by order count
✅ Clean Node.js + Express + MySQL architecture
✅ Comprehensive seed data (15 restaurants, 1000+ orders)
✅ Complete documentation
✅ Docker ready
✅ Production deployed

🛠️ Tech Stack:
- Node.js + Express.js
- MySQL 8.0
- Deployed on Railway
```

## 🐛 Troubleshooting

### Push Rejected

```bash
# If push is rejected, pull first
git pull origin main --rebase
git push origin main
```

### Wrong Remote URL

```bash
# Remove wrong remote
git remote remove origin

# Add correct remote
git remote add origin https://github.com/YOUR_USERNAME/restaurant-dish-search.git
```

### Large Files Error

```bash
# If you accidentally committed large files
# Make sure .gitignore includes node_modules
git rm -r --cached node_modules
git commit -m "Remove node_modules"
git push origin main
```

## ✅ Verification Checklist

Before sharing, verify:

- [ ] Code is on GitHub
- [ ] README has clear setup instructions
- [ ] API is deployed and accessible
- [ ] Database is initialized with seed data
- [ ] Example API call works
- [ ] All documentation files are included
- [ ] .gitignore excludes node_modules and .env
- [ ] Repository has good description and topics

## 🎉 You're Done!

Your project is now:
- ✅ On GitHub (public repository)
- ✅ Deployed (accessible via public URL)
- ✅ Documented (comprehensive README)
- ✅ Ready to share

Share your GitHub link and deployed API URL! 🚀

---

Need help? Check DEPLOYMENT.md for detailed hosting instructions.


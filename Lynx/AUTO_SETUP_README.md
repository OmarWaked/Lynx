# 🚀 Automated Firebase Setup for Lynx App

## What This Does

The automated setup script will:
- ✅ Create all Firestore collections (`categories`, `coupons`)
- ✅ Add 8 categories with placeholder images
- ✅ Add 11 sample coupons across different categories
- ✅ Set up Storage folder structure
- ✅ Verify everything is working correctly

## 🎯 Quick Start (3 Steps)

### Step 1: Install Prerequisites
```bash
# Install Google Cloud SDK (if not already installed)
brew install --cask google-cloud-sdk

# Or download from: https://cloud.google.com/sdk/docs/install
```

### Step 2: Authenticate with Google Cloud
```bash
# Login to Google Cloud
gcloud auth login

# Set your project
gcloud config set project lynx-waked
```

### Step 3: Run the Setup Script
```bash
# Make the script executable (if needed)
chmod +x setup_firebase.sh

# Run the automated setup
./setup_firebase.sh
```

## 🔧 What the Script Does

1. **Checks Prerequisites**
   - Python 3 installed
   - Google Cloud SDK installed
   - User authenticated with gcloud
   - Project set to `lynx-waked`

2. **Installs Dependencies**
   - Firebase Admin SDK for Python
   - Required Python packages

3. **Sets Up Firebase**
   - Creates Firestore collections
   - Adds sample data
   - Sets up Storage folders
   - Verifies setup

4. **Provides Next Steps**
   - Instructions for security rules
   - Testing instructions
   - Troubleshooting tips

## 📊 Expected Output

When successful, you'll see:
```
🚀 Starting Firebase Auto-Setup for Lynx App...
📱 Project: lynx-waked
==================================================
✅ Firebase Admin SDK initialized successfully
✅ Firestore client initialized
✅ Storage client initialized

🌱 Setting up Firestore collections...
📁 Creating categories collection...
   ✅ Created category: Food & Beverages
   ✅ Created category: Retail
   ✅ Created category: Health & Beauty
   ✅ Created category: Sports & Outdoors
   ✅ Created category: Technology
   ✅ Created category: Automotive
   ✅ Created category: Home & Garden
   ✅ Created category: Entertainment
✅ Firestore collections setup completed!

📁 Setting up Storage folder structure...
   ✅ Created folder: public/categories/food-beverages
   ✅ Created folder: public/categories/retail
   ✅ Created folder: public/categories/health-beauty
   ✅ Created folder: public/categories/sports-outdoors
   ✅ Created folder: public/categories/technology
   ✅ Created folder: public/categories/automotive
   ✅ Created folder: public/categories/home-garden
   ✅ Created folder: public/categories/entertainment
   ✅ Created folder: public/coupons/mcdonalds
   ✅ Created folder: public/coupons/starbucks
   ✅ Created folder: public/coupons/walmart
   ✅ Created folder: public/coupons/target
   ✅ Created folder: public/coupons/apple
   ✅ Created folder: public/coupons/samsung
   ✅ Created folder: public/coupons/nike
   ✅ Created folder: public/coupons/cvs
   ✅ Created folder: public/coupons/autozone
   ✅ Created folder: public/coupons/home-depot
   ✅ Created folder: public/coupons/netflix
   ✅ Created folder: users/profile
   ✅ Created folder: users/uploads
✅ Storage folder structure setup completed!

🔒 Setting up security rules...
⚠️  Security rules setup required manually:
   1. Go to Firestore → Rules
   2. Paste the rules from FIREBASE_CONSOLE_SETUP.md
   3. Go to Storage → Rules
   4. Paste the storage rules from FIREBASE_CONSOLE_SETUP.md

🔍 Verifying setup...
   📊 Categories: 8/8 documents
   📊 Coupons: 11/11 documents
   📁 Storage folders: 21/21 folders
✅ Setup verification successful!

==================================================
🎉 Firebase Auto-Setup Completed Successfully!

📋 Next Steps:
1. ✅ Firebase is now configured
2. 🔒 Set security rules manually in Firebase Console
3. 🧪 Test the app in Xcode
4. 📱 Verify categories and coupons load
5. 🔐 Test user authentication
```

## 🚨 Troubleshooting

### "gcloud not found"
```bash
# Install Google Cloud SDK
brew install --cask google-cloud-sdk

# Or download from: https://cloud.google.com/sdk/docs/install
```

### "Not authenticated with Google Cloud"
```bash
# Login to Google Cloud
gcloud auth login

# Set your project
gcloud config set project lynx-waked
```

### "Permission denied" errors
- Make sure you have access to the `lynx-waked` project
- Check that you're authenticated with the correct account
- Verify project permissions in Google Cloud Console

### Python errors
```bash
# Install Python 3 if not already installed
brew install python3

# Install Firebase Admin SDK
pip3 install firebase-admin
```

## 🔒 After Setup - Security Rules

The script sets up the data but you need to manually set security rules:

1. **Go to [Firebase Console](https://console.firebase.google.com/)**
2. **Select project: `lynx-waked`**
3. **Firestore → Rules** - Paste rules from `FIREBASE_CONSOLE_SETUP.md`
4. **Storage → Rules** - Paste rules from `FIREBASE_CONSOLE_SETUP.md`

## 🧪 Testing the Setup

1. **Open Lynx app in Xcode**
2. **Build and run the app**
3. **Check console for Firebase success messages**
4. **Navigate to Admin Panel → Test Firebase Services**
5. **Verify categories and coupons load**

## 📱 What You'll Get

### Categories (8 total)
- Food & Beverages
- Retail
- Health & Beauty
- Sports & Outdoors
- Technology
- Automotive
- Home & Garden
- Entertainment

### Sample Coupons (11 total)
- McDonald's: 20% Off Any Meal
- Starbucks: 15% Off Any Beverage
- Walmart: $10 Off $50 Purchase
- Target: 25% Off Home & Garden
- Apple: $50 Off iPhone Purchase
- Samsung: 30% Off Galaxy Devices
- Nike: 40% Off Running Shoes
- CVS: $5 Off $25 Beauty Purchase
- AutoZone: 20% Off Auto Parts
- Home Depot: $15 Off $75 Purchase
- Netflix: 2 Months Free

## 🎯 Success Criteria

Setup is successful when:
- ✅ All console tests pass
- ✅ App loads categories and coupons
- ✅ User authentication works
- ✅ No permission errors in console
- ✅ Images load from URLs
- ✅ Admin panel functions work

## 📞 Support

If the automated setup fails:
1. Check the error messages above
2. Verify Google Cloud authentication
3. Check project permissions
4. Review the manual setup guide in `FIREBASE_CONSOLE_SETUP.md`

## 🎉 You're Done!

Once the script completes successfully:
1. Your Firebase project is fully configured
2. All sample data is loaded
3. The app is ready to test
4. Just set security rules and you're good to go!

---

**Note:** The automated script handles 90% of the setup. You only need to manually set security rules in Firebase Console.

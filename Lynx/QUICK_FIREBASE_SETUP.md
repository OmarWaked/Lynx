# Quick Firebase Setup - Get Running in 5 Minutes

## Immediate Steps (Do These First)

### 1. Firebase Console Setup
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select project: `lynx-waked`
3. **Create Firestore Database**:
   - Click "Firestore Database" → "Create Database"
   - Choose "Start in test mode"
   - Select location: `us-central1`
   - Click "Done"

4. **Initialize Storage**:
   - Click "Storage" → "Get Started"
   - Choose "Start in test mode"
   - Select same location as Firestore
   - Click "Done"

5. **Enable Authentication**:
   - Click "Authentication" → "Sign-in method"
   - Enable "Email/Password"
   - Click "Save"

### 2. Import Sample Data (Copy-Paste Method)

#### Create Categories Collection
1. In Firestore, click "Start collection"
2. Collection ID: `categories`
3. Add these documents one by one:

**Document 1:**
- Document ID: `Food & Beverages`
- Fields:
  - `name`: `Food & Beverages` (string)
  - `imageURL`: `https://images.unsplash.com/photo-1504674900240-7747b97952ac?w=400&h=300&fit=crop` (string)

**Document 2:**
- Document ID: `Retail`
- Fields:
  - `name`: `Retail` (string)
  - `imageURL`: `https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop` (string)

**Document 3:**
- Document ID: `Technology`
- Fields:
  - `name`: `Technology` (string)
  - `imageURL`: `https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop` (string)

#### Create Coupons Collection
1. Click "Start collection"
2. Collection ID: `coupons`
3. Add these documents:

**Document 1:**
- Document ID: `1234567890123`
- Fields:
  - `barcode`: `1234567890123` (string)
  - `brand`: `McDonald's` (string)
  - `category`: `Food & Beverages` (string)
  - `subcategory`: `Fast Food` (string)
  - `discount`: `20%` (string)
  - `expiration`: `12/31/2024` (string)
  - `imageURL`: `https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop` (string)
  - `name`: `20% Off Any Meal` (string)
  - `terms`: `Valid on any meal purchase. Cannot be combined with other offers.` (string)
  - `discountType`: `true` (boolean)
  - `companyName`: `McDonald's Corporation` (string)
  - `companyCUID`: `MC001` (string)

**Document 2:**
- Document ID: `1234567890127`
- Fields:
  - `barcode`: `1234567890127` (string)
  - `brand`: `Apple` (string)
  - `category`: `Technology` (string)
  - `subcategory`: `Electronics` (string)
  - `discount`: `$50` (string)
  - `expiration`: `03/31/2025` (string)
  - `imageURL`: `https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400&h=300&fit=crop` (string)
  - `name`: `$50 Off iPhone Purchase` (string)
  - `terms`: `Valid on iPhone purchases. Cannot be combined with other offers.` (string)
  - `discountType`: `false` (boolean)
  - `companyName`: `Apple Inc.` (string)
  - `companyCUID`: `AP001` (string)

### 3. Test the App
1. Build and run the app in Xcode
2. Check Xcode console for Firebase logs
3. Navigate to Admin Panel → Test Firebase Services
4. Verify all services show "Success"

## If You Get Errors

### Permission Denied
- Go to Firestore → Rules
- Replace with:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

### Storage Access Denied
- Go to Storage → Rules
- Replace with:
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if true;
    }
  }
}
```

## Verify Setup

### Check Firestore
- Go to Firestore → Data
- You should see 2 collections: `categories` and `coupons`
- Categories should have 3+ documents
- Coupons should have 2+ documents

### Check Storage
- Go to Storage → Files
- Should show empty but accessible

### Check Authentication
- Go to Authentication → Users
- Should be empty but ready for users

## Next Steps

After basic setup works:
1. Add more categories and coupons
2. Test user registration
3. Test bookmarking functionality
4. Set up proper security rules

## Quick Test Commands

In Xcode console, you should see:
```
✅ Firebase configuration validated:
   - Firestore: lynx-waked
   - Storage: lynx-waked
   - Auth: lynx-waked
✅ Firestore connection test successful
✅ Storage connection test successful
```

If you see these messages, Firebase is working correctly!

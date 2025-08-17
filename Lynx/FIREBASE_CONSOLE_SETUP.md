# Firebase Console Setup Guide

## Step 1: Access Firebase Console
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: `lynx-waked`
3. Ensure you're in the correct project

## Step 2: Set Up Firestore Database

### 2.1 Create Firestore Database
1. Navigate to **Firestore Database** in the left sidebar
2. Click **Create Database**
3. Choose **Start in test mode** (for development)
4. Select a location close to your users (e.g., `us-central1`)
5. Click **Done**

### 2.2 Set Up Collections Structure
The app expects the following collections:

#### Collection: `categories`
- Document ID: `Food & Beverages`
- Document ID: `Retail`
- Document ID: `Health & Beauty`
- Document ID: `Sports & Outdoors`
- Document ID: `Technology`
- Document ID: `Automotive`
- Document ID: `Home & Garden`
- Document ID: `Entertainment`

#### Collection: `coupons`
- Document ID: `1234567890123` (McDonald's)
- Document ID: `1234567890124` (Starbucks)
- Document ID: `1234567890125` (Walmart)
- Document ID: `1234567890126` (Target)
- Document ID: `1234567890127` (Apple)
- Document ID: `1234567890128` (Samsung)
- Document ID: `1234567890129` (Nike)
- Document ID: `1234567890130` (CVS)
- Document ID: `1234567890131` (AutoZone)
- Document ID: `1234567890132` (Home Depot)
- Document ID: `1234567890133` (Netflix)

#### Collection: `users`
- This will be created automatically when users sign up
- Each user document contains:
  - `bookmarks` subcollection
  - `transactions` subcollection

## Step 3: Set Up Storage

### 3.1 Initialize Storage
1. Navigate to **Storage** in the left sidebar
2. Click **Get Started**
3. Choose **Start in test mode** (for development)
4. Select a location (same as Firestore)
5. Click **Done**

### 3.2 Create Storage Folders
Create the following folder structure:

```
storage/
├── public/
│   ├── categories/
│   │   ├── food-beverages/
│   │   ├── retail/
│   │   ├── health-beauty/
│   │   ├── sports-outdoors/
│   │   ├── technology/
│   │   ├── automotive/
│   │   ├── home-garden/
│   │   └── entertainment/
│   └── coupons/
│       ├── mcdonalds/
│       ├── starbucks/
│       ├── walmart/
│       ├── target/
│       ├── apple/
│       ├── samsung/
│       ├── nike/
│       ├── cvs/
│       ├── autozone/
│       ├── home-depot/
│       └── netflix/
└── users/
    └── {userId}/
        ├── profile/
        └── uploads/
```

## Step 4: Add Sample Data

### 4.1 Add Categories Data
For each category document, add the following fields:

```json
{
  "name": "Food & Beverages",
  "imageURL": "https://images.unsplash.com/photo-1504674900240-7747b97952ac?w=400&h=300&fit=crop"
}
```

### 4.2 Add Coupons Data
For each coupon document, add the following fields:

```json
{
  "barcode": "1234567890123",
  "brand": "McDonald's",
  "category": "Food & Beverages",
  "subcategory": "Fast Food",
  "discount": "20%",
  "expiration": "12/31/2024",
  "imageURL": "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
  "name": "20% Off Any Meal",
  "terms": "Valid on any meal purchase. Cannot be combined with other offers.",
  "discountType": true,
  "companyName": "McDonald's Corporation",
  "companyCUID": "MC001"
}
```

## Step 5: Set Security Rules

### 5.1 Firestore Rules
Go to **Firestore Database** → **Rules** and paste:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
      
      // Users can manage their bookmarks and transactions
      match /bookmarks/{document=**} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
      
      match /transactions/{document=**} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }
    
    // Categories are publicly readable
    match /categories/{categoryId} {
      allow read: if true;
      allow write: if false; // Only admins can modify
    }
    
    // Coupons are publicly readable
    match /coupons/{couponId} {
      allow read: if true;
      allow write: if false; // Only admins can modify
    }
  }
}
```

### 5.2 Storage Rules
Go to **Storage** → **Rules** and paste:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Users can upload images to their own folder
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Public images (coupons, categories) are readable by all
    match /public/{allPaths=**} {
      allow read: if true;
      allow write: if false; // Only admins can upload
    }
  }
}
```

## Step 6: Enable Authentication

### 6.1 Enable Email/Password Auth
1. Navigate to **Authentication** → **Sign-in method**
2. Click **Email/Password**
3. Enable **Email/Password**
4. Click **Save**

### 6.2 Optional: Enable Additional Providers
- Google Sign-In
- Apple Sign-In
- Phone Number

## Step 7: Test the Setup

### 7.1 Test Firestore
1. Go to **Firestore Database** → **Data**
2. Verify collections exist
3. Check that documents have proper data

### 7.2 Test Storage
1. Go to **Storage** → **Files**
2. Verify folder structure exists
3. Check permissions

### 7.3 Test Authentication
1. Go to **Authentication** → **Users**
2. Try creating a test user
3. Verify sign-in works

## Step 8: Monitor Usage

### 8.1 Check Quotas
- Go to **Usage and billing**
- Monitor Firestore reads/writes
- Monitor Storage usage

### 8.2 Set Up Alerts
- Configure usage alerts
- Set up budget notifications

## Troubleshooting

### Common Issues
1. **Permission denied**: Check security rules
2. **Collection not found**: Verify collection names match exactly
3. **Storage access denied**: Check Storage rules
4. **Authentication failed**: Verify auth providers are enabled

### Debug Steps
1. Check Firebase Console logs
2. Verify project ID matches `GoogleService-Info.plist`
3. Test rules in Firebase Console
4. Check network connectivity

## Next Steps

After setup:
1. Test the app with real data
2. Monitor Firebase usage
3. Implement proper admin controls
4. Set up production security rules
5. Configure backup strategies

## Support

If you encounter issues:
1. Check Firebase documentation
2. Review security rules
3. Verify project configuration
4. Test with Firebase Console tools

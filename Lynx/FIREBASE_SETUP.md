# Firebase Setup Guide for Lynx App

## Overview
The Lynx app is configured to use the following Firebase services:
- **Authentication** - User sign-in/sign-up
- **Firestore** - Database for coupons, categories, users, and transactions
- **Storage** - Image storage for coupon and category images

## Current Configuration
- **Project ID**: `lynx-waked`
- **Storage Bucket**: `lynx-waked.firebasestorage.app`
- **Bundle ID**: `com.waked.Lynx`

## Firebase Console Setup

### 1. Authentication
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: `lynx-waked`
3. Navigate to **Authentication** → **Sign-in method**
4. Enable **Email/Password** authentication
5. Configure additional providers if needed (Google, Apple, etc.)

### 2. Firestore Database
1. Navigate to **Firestore Database**
2. Create database in **test mode** (for development)
3. Choose a location close to your users
4. Set up security rules (see Security Rules section below)

### 3. Storage
1. Navigate to **Storage**
2. Initialize storage with default rules
3. Set up security rules (see Security Rules section below)

## Security Rules

### Firestore Rules
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

### Storage Rules
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

## Demo Data

The app automatically seeds demo data when first launched:

### Categories
- Food & Beverages
- Retail
- Health & Beauty
- Sports & Outdoors
- Technology
- Automotive
- Home & Garden
- Entertainment

### Sample Coupons
- McDonald's: 20% Off Any Meal
- Starbucks: 15% Off Any Beverage
- Walmart: $10 Off $50 Purchase
- Target: 25% Off Home & Garden
- Apple: $50 Off iPhone Purchase
- Nike: 40% Off Running Shoes
- And more...

## Testing Firebase Services

### 1. Test Authentication
- Try signing up with a new email
- Sign in with existing credentials
- Test password reset functionality

### 2. Test Firestore
- Check if categories and coupons are loaded
- Verify user profile creation
- Test bookmark functionality

### 3. Test Storage
- Verify images are loading from URLs
- Check if placeholder images are displayed

## Troubleshooting

### Common Issues

1. **"Permission denied" errors**
   - Check security rules in Firebase Console
   - Ensure user is authenticated
   - Verify document paths match rules

2. **Images not loading**
   - Check image URLs in Firestore documents
   - Verify Storage rules allow public read access
   - Check network connectivity

3. **Authentication failures**
   - Verify Email/Password auth is enabled
   - Check if user exists in Firebase Console
   - Ensure proper error handling in code

### Debug Steps

1. Check Xcode console for Firebase logs
2. Verify GoogleService-Info.plist is properly configured
3. Test Firebase services in Firebase Console
4. Check network requests in Xcode Network Inspector

## Production Considerations

### 1. Security Rules
- Implement proper user role management
- Add rate limiting for API calls
- Restrict admin access to authorized users only

### 2. Data Management
- Implement data backup strategies
- Set up data retention policies
- Monitor database usage and costs

### 3. Performance
- Enable Firestore offline persistence
- Implement proper indexing for queries
- Use Storage caching for frequently accessed images

## Support

If you encounter issues:
1. Check Firebase Console for service status
2. Review Firebase documentation
3. Check Xcode console for detailed error messages
4. Verify all Firebase dependencies are properly linked

## Dependencies

The app uses the following Firebase packages:
- FirebaseCore (12.1.0)
- FirebaseAuth (12.1.0)
- FirebaseFirestore (12.1.0)
- FirebaseStorage (12.1.0)

All packages are managed through Swift Package Manager and automatically resolved.

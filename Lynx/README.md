# Lynx - SwiftUI Coupon App

A modern iOS coupon and deals application built with SwiftUI, featuring user authentication, coupon management, bookmarking, and transaction tracking.

## Features

### 🔐 Authentication
- User registration and login
- Password reset functionality
- Secure Firebase authentication

### 🏠 Home Screen
- Featured deals carousel
- Category browsing
- Search functionality
- All available coupons

### 💰 Coupon Management
- Browse coupons by category
- Search coupons by name, brand, or category
- View detailed coupon information
- Barcode display for in-store use

### 🔖 Bookmarking System
- Save favorite coupons
- Quick access to bookmarked items
- Easy bookmark management

### 📊 Transaction History
- Track coupon usage
- Record store purchases
- View spending history

### ⚙️ Settings & Preferences
- User profile management
- Dark mode toggle
- Notification preferences
- Location services

## Technical Stack

- **Framework**: SwiftUI
- **Backend**: Firebase (Authentication, Firestore)
- **Architecture**: MVVM with ObservableObject
- **iOS Target**: iOS 15.0+

## Setup Instructions

### 1. Prerequisites
- Xcode 13.0 or later
- iOS 15.0+ deployment target
- Firebase project setup

### 2. Firebase Configuration
1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Add an iOS app to your Firebase project
3. Download the `GoogleService-Info.plist` file
4. Replace the placeholder `GoogleService-Info.plist` in the project
5. Enable Authentication (Email/Password) in Firebase Console
6. Create a Firestore database with the following collections:
   - `users` - User profiles and preferences
   - `coupons` - Coupon data
   - `categories` - Category information

### 3. Project Setup
1. Open `Lynx.xcodeproj` in Xcode
2. Add Firebase dependencies via Swift Package Manager:
   - Firebase/Auth
   - Firebase/Firestore
   - Firebase/Analytics (optional)
3. Build and run the project

### 4. Database Structure

#### Users Collection
```json
{
  "uid": "user_id",
  "email": "user@example.com",
  "displayName": "User Name",
  "photoURL": "profile_photo_url",
  "preferences": {
    "isDarkMode": false,
    "notificationsEnabled": true,
    "locationEnabled": true
  }
}
```

#### Coupons Collection
```json
{
  "barcode": "123456789",
  "brand": "Brand Name",
  "category": "Category",
  "subcategory": "Subcategory",
  "discount": "20% OFF",
  "expiration": "12/31/2024",
  "imageURL": "image_url",
  "name": "Coupon Name",
  "terms": "Terms and conditions",
  "discountType": true,
  "companyName": "Company Name",
  "companyCUID": "company_id",
  "isActive": true
}
```

#### Categories Collection
```json
{
  "name": "Category Name",
  "imageURL": "category_image_url"
}
```

## Project Structure

```
Lynx/
├── LynxApp.swift              # Main app entry point
├── ContentView.swift          # Root content view
├── Models/                    # Data models
│   └── Coupon.swift
├── Managers/                  # Business logic managers
│   ├── AuthenticationManager.swift
│   └── CouponManager.swift
├── Views/                     # UI components
│   ├── Authentication/        # Auth views
│   ├── Home/                 # Home screen
│   ├── Transaction/          # Transaction views
│   ├── Bookmarked/           # Bookmark views
│   ├── Settings/             # Settings views
│   └── Shared/               # Shared components
└── GoogleService-Info.plist  # Firebase configuration
```

## Key Components

### AuthenticationManager
Handles user authentication, profile management, and Firebase Auth integration.

### CouponManager
Manages coupon data, bookmarks, transactions, and Firebase Firestore operations.

### Views
- **HomeView**: Main dashboard with featured deals and categories
- **TransactionView**: Transaction history and management
- **BookmarkedView**: Saved coupons
- **SettingsView**: User preferences and account management

## Customization

### Colors and Styling
The app uses system colors and can be customized by modifying the color schemes in the respective views.

### Firebase Rules
Set up appropriate Firestore security rules to protect user data:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /coupons/{couponId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.token.admin == true;
    }
  }
}
```

## Future Enhancements

- [ ] Barcode scanning functionality
- [ ] Push notifications
- [ ] Location-based coupon suggestions
- [ ] Social sharing features
- [ ] Offline support
- [ ] Analytics and reporting
- [ ] Admin panel for coupon management

## Support

For issues and questions, please check the Firebase documentation or create an issue in the project repository.

## License

This project is for educational and development purposes. Please ensure compliance with Firebase terms of service and Apple App Store guidelines.

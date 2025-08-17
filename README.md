# 🐾 Lynx - Your Personal Coupon Companion

[![iOS](https://img.shields.io/badge/iOS-18.5+-blue.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-blue.svg)](https://developer.apple.com/xcode/swiftui/)
[![Firebase](https://img.shields.io/badge/Firebase-12.1.0-yellow.svg)](https://firebase.google.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern, feature-rich iOS coupon and deals application built with **SwiftUI** and **Firebase**. Lynx helps users discover, save, and track the best deals while providing a seamless shopping experience.

<div align="center">
  <img src="Lynx/Assets.xcassets/Logo.imageset/Logo.png" alt="Lynx Logo" width="200"/>
</div>

## ✨ Features

### 🔐 **Authentication & Security**
- **Secure User Registration & Login** with Firebase Authentication
- **Password Reset** functionality
- **User Profile Management** with customizable preferences
- **Secure Data Storage** with Firestore security rules

### 🏠 **Smart Home Dashboard**
- **Featured Deals Carousel** showcasing top offers
- **Category-Based Browsing** for easy navigation
- **Advanced Search** by name, brand, or category
- **Real-time Updates** with Firebase integration

### 💰 **Coupon Management**
- **Comprehensive Coupon Database** with detailed information
- **Barcode Display** for in-store redemption
- **Expiration Tracking** with smart notifications
- **Category Organization** for better discovery

### 🔖 **Personalization**
- **Bookmark System** to save favorite deals
- **User Preferences** including dark mode support
- **Customizable Notifications** and location services
- **Personalized Recommendations**

### 📊 **Transaction Tracking**
- **Purchase History** with detailed records
- **Spending Analytics** and insights
- **Store Information** tracking
- **Usage Statistics**

### 🎨 **Modern UI/UX**
- **Beautiful SwiftUI Interface** with smooth animations
- **Dark Mode Support** for comfortable viewing
- **Responsive Design** optimized for all iOS devices
- **Accessibility Features** for inclusive design

## 🚀 Quick Start

### Prerequisites
- **Xcode 15.0+** (Latest stable version recommended)
- **iOS 18.5+** deployment target
- **Firebase Account** for backend services
- **Swift 5.0+** knowledge

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/lynx.git
   cd lynx
   ```

2. **Firebase Setup**
   - Create a new project at [Firebase Console](https://console.firebase.google.com/)
   - Add iOS app and download `GoogleService-Info.plist`
   - Replace the placeholder file in the project
   - Enable Authentication (Email/Password)
   - Create Firestore database

3. **Open in Xcode**
   ```bash
   open Lynx.xcodeproj
   ```

4. **Install Dependencies**
   - Firebase packages are managed via Swift Package Manager
   - Build the project to resolve dependencies

5. **Run the App**
   - Select your target device/simulator
   - Press `Cmd + R` to build and run

## 🏗️ Architecture

### **MVVM Pattern**
- **Models**: Data structures for coupons, users, and transactions
- **Views**: SwiftUI components with modern design patterns
- **ViewModels**: ObservableObject managers for business logic

### **Key Components**

```
Lynx/
├── 📱 LynxApp.swift                 # App entry point & configuration
├── 🎯 ContentView.swift             # Root view with authentication flow
├── 🏗️ Models/                      # Data models & structures
│   ├── Coupon.swift                # Coupon data model
│   └── UserProfile.swift           # User profile & preferences
├── ⚙️ Managers/                    # Business logic & data management
│   ├── AuthenticationManager.swift # User authentication & profiles
│   ├── CouponManager.swift         # Coupon data & operations
│   ├── StorageManager.swift        # Firebase storage operations
│   └── FirebaseConfig.swift        # Firebase configuration
├── 🎨 Views/                       # UI components & screens
│   ├── Authentication/             # Login, signup, password reset
│   ├── Home/                      # Main dashboard & search
│   ├── Transaction/               # Purchase history & tracking
│   ├── Bookmarked/                # Saved coupons management
│   ├── Settings/                  # User preferences & account
│   └── Shared/                    # Reusable components
└── 🔧 Configuration/               # Firebase & project setup
```

## 🔥 Firebase Integration

### **Services Used**
- **Firebase Authentication** - User management & security
- **Cloud Firestore** - Real-time database
- **Firebase Storage** - Image & file storage
- **Firebase Analytics** - Usage insights (optional)

### **Database Schema**

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
  "companyCUID": "company_id"
}
```

#### Categories Collection
```json
{
  "name": "Category Name",
  "imageURL": "category_image_url"
}
```

## 🎯 Key Features Implementation

### **Modern SwiftUI Patterns**
- **@MainActor** for UI updates
- **Async/Await** for modern concurrency
- **ObservableObject** for reactive UI
- **Environment Objects** for dependency injection

### **Performance Optimizations**
- **Lazy Loading** for large datasets
- **Image Caching** and optimization
- **Efficient Firebase queries** with proper indexing
- **Memory management** with weak references

### **Security Features**
- **Firestore Security Rules** for data protection
- **User authentication** with Firebase Auth
- **Data validation** and sanitization
- **Secure API calls** with proper error handling

## 🛠️ Development

### **Code Style**
- **SwiftLint** compliance
- **Consistent naming** conventions
- **Documentation** for public APIs
- **Error handling** best practices

### **Testing**
- **Unit Tests** for business logic
- **UI Tests** for critical user flows
- **Integration Tests** for Firebase operations

### **Debugging**
- **Comprehensive logging** system
- **Firebase Debug** mode support
- **Performance profiling** tools

## 📱 Screenshots

<div align="center">
  <img src="screenshots/home.png" alt="Home Screen" width="200"/>
  <img src="screenshots/coupons.png" alt="Coupons" width="200"/>
  <img src="screenshots/bookmarks.png" alt="Bookmarks" width="200"/>
  <img src="screenshots/settings.png" alt="Settings" width="200"/>
</div>

*Note: Screenshots will be added to the repository*

## 🚧 Future Enhancements

### **Phase 1 - Core Features**
- [ ] **Barcode Scanner** for coupon redemption
- [ ] **Push Notifications** for expiring deals
- [ ] **Offline Support** with local caching

### **Phase 2 - Advanced Features**
- [ ] **Location Services** for nearby deals
- [ ] **Social Sharing** of favorite coupons
- [ ] **Analytics Dashboard** for users

### **Phase 3 - Enterprise Features**
- [ ] **Admin Panel** for coupon management
- [ ] **Multi-language Support**
- [ ] **Advanced Search Filters**

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### **How to Contribute**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### **Development Setup**
1. Follow the installation steps above
2. Set up Firebase project for development
3. Configure development environment variables
4. Run tests to ensure everything works

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Apple** for SwiftUI and iOS development tools
- **Firebase** for the robust backend infrastructure
- **SwiftUI Community** for inspiration and best practices
- **Open Source Contributors** who made this project possible

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/lynx/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/lynx/discussions)
- **Documentation**: [Wiki](https://github.com/yourusername/lynx/wiki)

## 🌟 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/lynx&type=Date)](https://star-history.com/#yourusername/lynx&Date)

---

<div align="center">
  <p>Made with ❤️ by the Lynx Team</p>
  <p>If you find this project helpful, please give it a ⭐️</p>
</div>

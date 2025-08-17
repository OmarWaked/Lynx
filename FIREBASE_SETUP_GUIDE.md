# 🔥 Firebase Setup Guide - Fix Permission Issues

## 🚨 **Current Issue: "Missing or insufficient permissions"**

The app is getting permission denied errors because Firebase security rules are too restrictive.

## 📋 **Step-by-Step Fix:**

### **1. Update Firestore Security Rules**

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: `lynx-waked`
3. Click **Firestore Database** in the left sidebar
4. Click **Rules** tab
5. Replace the existing rules with the content from `firestore_rules.rules`
6. Click **Publish**

### **2. Update Storage Security Rules**

1. In Firebase Console, click **Storage** in the left sidebar
2. Click **Rules** tab
3. Replace the existing rules with the content from `storage_rules.rules`
4. Click **Publish**

### **3. Verify Rules Deployment**

After publishing, wait 1-2 minutes for rules to propagate.

## 🔒 **What the Rules Do:**

- **Categories & Coupons**: Public read access (anyone can view)
- **User Data**: Only authenticated users can access their own data
- **Admin Operations**: Restricted to prevent unauthorized writes
- **Test Collections**: Open for connection testing

## 🧪 **Test the Fix:**

1. Run the app again
2. Check console logs for:
   - ✅ "Firestore connection test successful"
   - ✅ "Storage connection test successful"
   - ✅ "Found X categories"
   - ✅ "Found X coupons"

## 🚀 **Alternative: Quick Test Mode**

If you want to test quickly, you can temporarily use these permissive rules:

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

**⚠️ WARNING: Only use for testing, never in production!**

## 📱 **Expected Results:**

After fixing the rules:
- ✅ Categories will load and display
- ✅ Coupons will load and display
- ✅ Settings page buttons will work
- ✅ User authentication will work properly
- ✅ App will be fully functional

## 🆘 **Still Having Issues?**

1. Check Firebase Console for any error messages
2. Verify your project ID matches `lynx-waked`
3. Ensure you're logged into the correct Google account
4. Wait 5-10 minutes after rule changes
5. Check the app console logs for specific error messages

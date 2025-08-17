#!/usr/bin/env python3
"""
Firebase Auto-Setup Script for Lynx App
This script automatically sets up Firestore collections, documents, and data.
"""

import json
import os
import sys
from typing import Dict, Any

try:
    import firebase_admin
    from firebase_admin import credentials, firestore, storage
    from firebase_admin.exceptions import FirebaseError
except ImportError:
    print("❌ Firebase Admin SDK not installed. Installing now...")
    os.system("pip install firebase-admin")
    import firebase_admin
    from firebase_admin import credentials, firestore, storage
    from firebase_admin.exceptions import FirebaseError

class FirebaseAutoSetup:
    def __init__(self, project_id: str = "lynx-waked"):
        self.project_id = project_id
        self.db = None
        self.bucket = None
        
    def initialize_firebase(self):
        """Initialize Firebase Admin SDK"""
        try:
            # Check if already initialized
            if not firebase_admin._apps:
                # Initialize with default credentials (service account or gcloud auth)
                firebase_admin.initialize_app()
                print("✅ Firebase Admin SDK initialized successfully")
            else:
                print("✅ Firebase Admin SDK already initialized")
            
            # Initialize Firestore
            self.db = firestore.client()
            print("✅ Firestore client initialized")
            
            # Skip Storage for now - focus on Firestore setup
            print("⚠️  Storage setup skipped - focusing on Firestore")
            print("   Storage can be set up later in Firebase Console")
            self.bucket = None
            
            return True
            
        except Exception as e:
            print(f"❌ Failed to initialize Firebase: {e}")
            print("\n🔧 Troubleshooting:")
            print("1. Make sure you're logged into gcloud: gcloud auth login")
            print("2. Set the project: gcloud config set project lynx-waked")
            print("3. Or use a service account key file")
            return False
    
    def setup_firestore_collections(self):
        """Set up Firestore collections and documents"""
        try:
            print("\n🌱 Setting up Firestore collections...")
            
            # Categories data
            categories = {
                "Food & Beverages": {
                    "name": "Food & Beverages",
                    "imageURL": "https://images.unsplash.com/photo-1504674900240-7747b97952ac?w=400&h=300&fit=crop"
                },
                "Retail": {
                    "name": "Retail",
                    "imageURL": "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop"
                },
                "Health & Beauty": {
                    "name": "Health & Beauty",
                    "imageURL": "https://images.unsplash.com/photo-1559591935-c6c6b9e3a94d?w=400&h=300&fit=crop"
                },
                "Sports & Outdoors": {
                    "name": "Sports & Outdoors",
                    "imageURL": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop"
                },
                "Technology": {
                    "name": "Technology",
                    "imageURL": "https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop"
                },
                "Automotive": {
                    "name": "Automotive",
                    "imageURL": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop"
                },
                "Home & Garden": {
                    "name": "Home & Garden",
                    "imageURL": "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop"
                },
                "Entertainment": {
                    "name": "Entertainment",
                    "imageURL": "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop"
                }
            }
            
            # Coupons data
            coupons = {
                "1234567890123": {
                    "barcode": "1234567890123",
                    "brand": "McDonald's",
                    "category": "Food & Beverages",
                    "subcategory": "Fast Food",
                    "discount": "20%",
                    "expiration": "12/31/2024",
                    "imageURL": "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
                    "name": "20% Off Any Meal",
                    "terms": "Valid on any meal purchase. Cannot be combined with other offers.",
                    "discountType": True,
                    "companyName": "McDonald's Corporation",
                    "companyCUID": "MC001"
                },
                "1234567890124": {
                    "barcode": "1234567890124",
                    "brand": "Starbucks",
                    "category": "Food & Beverages",
                    "subcategory": "Coffee",
                    "discount": "15%",
                    "expiration": "11/30/2024",
                    "imageURL": "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=300&fit=crop",
                    "name": "15% Off Any Beverage",
                    "terms": "Valid on any beverage. Excludes food items.",
                    "discountType": True,
                    "companyName": "Starbucks Corporation",
                    "companyCUID": "SB001"
                },
                "1234567890125": {
                    "barcode": "1234567890125",
                    "brand": "Walmart",
                    "category": "Retail",
                    "subcategory": "General Merchandise",
                    "discount": "$10",
                    "expiration": "01/15/2025",
                    "imageURL": "https://images.unsplash.com/photo-1607082349566-187342175e2f?w=400&h=300&fit=crop",
                    "name": "$10 Off $50 Purchase",
                    "terms": "Valid on purchases of $50 or more. Excludes groceries.",
                    "discountType": False,
                    "companyName": "Walmart Inc.",
                    "companyCUID": "WM001"
                },
                "1234567890126": {
                    "barcode": "1234567890126",
                    "brand": "Target",
                    "category": "Retail",
                    "subcategory": "General Merchandise",
                    "discount": "25%",
                    "expiration": "02/28/2025",
                    "imageURL": "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
                    "name": "25% Off Home & Garden",
                    "terms": "Valid on home and garden items. Excludes electronics.",
                    "discountType": True,
                    "companyName": "Target Corporation",
                    "companyCUID": "TG001"
                },
                "1234567890127": {
                    "barcode": "1234567890127",
                    "brand": "Apple",
                    "category": "Technology",
                    "subcategory": "Electronics",
                    "discount": "$50",
                    "expiration": "03/31/2025",
                    "imageURL": "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400&h=300&fit=crop",
                    "name": "$50 Off iPhone Purchase",
                    "terms": "Valid on iPhone purchases. Cannot be combined with other offers.",
                    "discountType": False,
                    "companyName": "Apple Inc.",
                    "companyCUID": "AP001"
                },
                "1234567890128": {
                    "barcode": "1234567890128",
                    "brand": "Samsung",
                    "category": "Technology",
                    "subcategory": "Electronics",
                    "discount": "30%",
                    "expiration": "04/15/2025",
                    "imageURL": "https://images.unsplash.com/photo-1610945415295-d609bb34245d?w=400&h=300&fit=crop",
                    "name": "30% Off Galaxy Devices",
                    "terms": "Valid on Samsung Galaxy smartphones and tablets.",
                    "discountType": True,
                    "companyName": "Samsung Electronics",
                    "companyCUID": "SG001"
                },
                "1234567890129": {
                    "barcode": "1234567890129",
                    "brand": "Nike",
                    "category": "Sports & Outdoors",
                    "subcategory": "Athletic Wear",
                    "discount": "40%",
                    "expiration": "05/30/2025",
                    "imageURL": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop",
                    "name": "40% Off Running Shoes",
                    "terms": "Valid on all running shoes. Excludes limited editions.",
                    "discountType": True,
                    "companyName": "Nike Inc.",
                    "companyCUID": "NK001"
                },
                "1234567890130": {
                    "barcode": "1234567890130",
                    "brand": "CVS",
                    "category": "Health & Beauty",
                    "subcategory": "Pharmacy",
                    "discount": "$5",
                    "expiration": "06/30/2025",
                    "imageURL": "https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400&h=300&fit=crop",
                    "name": "$5 Off $25 Beauty Purchase",
                    "terms": "Valid on beauty products. Excludes prescriptions.",
                    "discountType": False,
                    "companyName": "CVS Health",
                    "companyCUID": "CV001"
                },
                "1234567890131": {
                    "barcode": "1234567890131",
                    "brand": "AutoZone",
                    "category": "Automotive",
                    "subcategory": "Auto Parts",
                    "discount": "20%",
                    "expiration": "07/31/2025",
                    "imageURL": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop",
                    "name": "20% Off Auto Parts",
                    "terms": "Valid on all auto parts. Excludes batteries and oil.",
                    "discountType": True,
                    "companyName": "AutoZone Inc.",
                    "companyCUID": "AZ001"
                },
                "1234567890132": {
                    "barcode": "1234567890132",
                    "brand": "Home Depot",
                    "category": "Home & Garden",
                    "subcategory": "Hardware",
                    "discount": "$15",
                    "expiration": "08/31/2025",
                    "imageURL": "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop",
                    "name": "$15 Off $75 Purchase",
                    "terms": "Valid on purchases of $75 or more. Excludes appliances.",
                    "discountType": False,
                    "companyName": "Home Depot Inc.",
                    "companyCUID": "HD001"
                },
                "1234567890133": {
                    "barcode": "1234567890133",
                    "brand": "Netflix",
                    "category": "Entertainment",
                    "subcategory": "Streaming",
                    "discount": "2 Months Free",
                    "expiration": "09/30/2025",
                    "imageURL": "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop",
                    "name": "2 Months Free Netflix",
                    "terms": "New subscribers only. Valid for standard plan.",
                    "discountType": False,
                    "companyName": "Netflix Inc.",
                    "companyCUID": "NF001"
                }
            }
            
            # Create categories collection
            print("📁 Creating categories collection...")
            categories_ref = self.db.collection('categories')
            for doc_id, data in categories.items():
                doc_ref = categories_ref.document(doc_id)
                doc_ref.set(data)
                print(f"   ✅ Created category: {doc_id}")
            
            # Create coupons collection
            print("📁 Creating coupons collection...")
            coupons_ref = self.db.collection('coupons')
            for doc_id, data in coupons.items():
                doc_ref = coupons_ref.document(doc_id)
                doc_ref.set(data)
                print(f"   ✅ Created coupon: {data['name']}")
            
            print("✅ Firestore collections setup completed!")
            return True
            
        except Exception as e:
            print(f"❌ Failed to setup Firestore collections: {e}")
            return False
    
    def setup_storage_folders(self):
        """Set up Storage folder structure"""
        if not self.bucket:
            print("\n📁 Skipping Storage folder setup (Storage not initialized)")
            print("   To enable Storage setup:")
            print("   1. Go to Firebase Console → Storage")
            print("   2. Click 'Get Started'")
            print("   3. Choose 'Start in test mode'")
            print("   4. Select location (same as Firestore)")
            print("   5. Run this script again")
            return True
        
        try:
            print("\n📁 Setting up Storage folder structure...")
            
            # Create folder structure
            folders = [
                "public/categories/food-beverages",
                "public/categories/retail",
                "public/categories/health-beauty",
                "public/categories/sports-outdoors",
                "public/categories/technology",
                "public/categories/automotive",
                "public/categories/home-garden",
                "public/categories/entertainment",
                "public/coupons/mcdonalds",
                "public/coupons/starbucks",
                "public/coupons/walmart",
                "public/coupons/target",
                "public/coupons/apple",
                "public/coupons/samsung",
                "public/coupons/nike",
                "public/coupons/cvs",
                "public/coupons/autozone",
                "public/coupons/home-depot",
                "public/coupons/netflix",
                "users/profile",
                "users/uploads"
            ]
            
            for folder in folders:
                # Create a placeholder file to establish the folder
                blob = self.bucket.blob(f"{folder}/.placeholder")
                blob.upload_from_string("", content_type="text/plain")
                print(f"   ✅ Created folder: {folder}")
            
            print("✅ Storage folder structure setup completed!")
            return True
            
        except Exception as e:
            print(f"❌ Failed to setup Storage folders: {e}")
            return False
    
    def setup_security_rules(self):
        """Set up basic security rules (test mode)"""
        try:
            print("\n🔒 Setting up security rules...")
            
            # Note: This script can't modify security rules directly
            # You'll need to do this manually in Firebase Console
            print("⚠️  Security rules setup required manually:")
            print("   1. Go to Firestore → Rules")
            print("   2. Paste the rules from FIREBASE_CONSOLE_SETUP.md")
            print("   3. Go to Storage → Rules")
            print("   4. Paste the storage rules from FIREBASE_CONSOLE_SETUP.md")
            
            return True
            
        except Exception as e:
            print(f"❌ Failed to setup security rules: {e}")
            return False
    
    def verify_setup(self):
        """Verify that the setup was successful"""
        try:
            print("\n🔍 Verifying setup...")
            
            # Check categories
            categories_ref = self.db.collection('categories')
            categories_docs = categories_ref.get()
            categories_count = len(list(categories_docs))
            print(f"   📊 Categories: {categories_count}/8 documents")
            
            # Check coupons
            coupons_ref = self.db.collection('coupons')
            coupons_docs = coupons_ref.get()
            coupons_count = len(list(coupons_docs))
            print(f"   📊 Coupons: {coupons_count}/11 documents")
            
            # Check storage folders
            if self.bucket:
                blobs = list(self.bucket.list_blobs())
                folder_count = len([b for b in blobs if b.name.endswith('.placeholder')])
                print(f"   📁 Storage folders: {folder_count}/21 folders")
                
                if categories_count >= 8 and coupons_count >= 11 and folder_count >= 21:
                    print("✅ Setup verification successful!")
                    return True
                else:
                    print("⚠️  Setup verification incomplete")
                    return False
            else:
                print("   📁 Storage folders: Skipped (Storage not initialized)")
                
                if categories_count >= 8 and coupons_count >= 11:
                    print("✅ Setup verification successful! (Firestore only)")
                    return True
                else:
                    print("⚠️  Setup verification incomplete")
                    return False
                
        except Exception as e:
            print(f"❌ Failed to verify setup: {e}")
            return False
    
    def run_full_setup(self):
        """Run the complete Firebase setup"""
        print("🚀 Starting Firebase Auto-Setup for Lynx App...")
        print(f"📱 Project: {self.project_id}")
        print("=" * 50)
        
        # Step 1: Initialize Firebase
        if not self.initialize_firebase():
            return False
        
        # Step 2: Setup Firestore
        if not self.setup_firestore_collections():
            return False
        
        # Step 3: Setup Storage
        if not self.setup_storage_folders():
            return False
        
        # Step 4: Setup Security Rules (manual)
        self.setup_security_rules()
        
        # Step 5: Verify Setup
        if not self.verify_setup():
            return False
        
        print("\n" + "=" * 50)
        print("🎉 Firebase Auto-Setup Completed Successfully!")
        print("\n📋 Next Steps:")
        print("1. ✅ Firebase is now configured")
        print("2. 🔒 Set security rules manually in Firebase Console")
        print("3. 🧪 Test the app in Xcode")
        print("4. 📱 Verify categories and coupons load")
        print("5. 🔐 Test user authentication")
        
        return True

def main():
    """Main function"""
    print("🔥 Firebase Auto-Setup Script for Lynx App")
    print("This script will automatically set up your Firebase project.")
    print()
    
    # Check if user is authenticated
    try:
        import subprocess
        result = subprocess.run(['gcloud', 'auth', 'list', '--filter=status:ACTIVE', '--format=value(account)'], 
                              capture_output=True, text=True)
        if result.returncode != 0 or not result.stdout.strip():
            print("⚠️  gcloud not authenticated. Please run:")
            print("   gcloud auth login")
            print("   gcloud config set project lynx-waked")
            print()
            return
        else:
            print(f"✅ Authenticated as: {result.stdout.strip()}")
    except FileNotFoundError:
        print("⚠️  gcloud CLI not found. Please install Google Cloud SDK")
        print("   https://cloud.google.com/sdk/docs/install")
        print()
        return
    
    # Run setup
    setup = FirebaseAutoSetup()
    success = setup.run_full_setup()
    
    if success:
        print("\n🎯 Your Firebase project is ready!")
        print("   Open the Lynx app in Xcode and test it!")
    else:
        print("\n❌ Setup failed. Please check the errors above.")
        sys.exit(1)

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Firebase Storage Setup Script for Lynx App
This script sets up Storage folders and adds placeholder images
"""

import firebase_admin
from firebase_admin import storage
import requests
from io import BytesIO

def setup_storage():
    """Set up Firebase Storage with folders and placeholder images"""
    try:
        # Initialize Firebase Admin SDK
        if not firebase_admin._apps:
            firebase_admin.initialize_app()
        
        # Get Storage bucket
        bucket = storage.bucket("lynx-waked.firebasestorage.app")
        print("✅ Storage bucket connected successfully")
        
        # Define folder structure and placeholder images
        storage_structure = {
            "public/categories/food-beverages": {
                "placeholder": "https://images.unsplash.com/photo-1504674900240-7747b97952ac?w=400&h=300&fit=crop",
                "description": "Food & Beverages category placeholder"
            },
            "public/categories/retail": {
                "placeholder": "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=300&fit=crop",
                "description": "Retail category placeholder"
            },
            "public/categories/health-beauty": {
                "placeholder": "https://images.unsplash.com/photo-1559591935-c6c6b9e3a94d?w=400&h=300&fit=crop",
                "description": "Health & Beauty category placeholder"
            },
            "public/categories/sports-outdoors": {
                "placeholder": "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=300&fit=crop",
                "description": "Sports & Outdoors category placeholder"
            },
            "public/categories/technology": {
                "placeholder": "https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=400&h=300&fit=crop",
                "description": "Technology category placeholder"
            },
            "public/categories/automotive": {
                "placeholder": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop",
                "description": "Automotive category placeholder"
            },
            "public/categories/home-garden": {
                "placeholder": "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop",
                "description": "Home & Garden category placeholder"
            },
            "public/categories/entertainment": {
                "placeholder": "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop",
                "description": "Entertainment category placeholder"
            },
            "public/coupons/mcdonalds": {
                "placeholder": "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400&h=300&fit=crop",
                "description": "McDonald's coupon placeholder"
            },
            "public/coupons/starbucks": {
                "placeholder": "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=300&fit=crop",
                "description": "Starbucks coupon placeholder"
            },
            "public/coupons/walmart": {
                "placeholder": "https://images.unsplash.com/photo-1607082349566-187342175e2f?w=400&h=300&fit=crop",
                "description": "Walmart coupon placeholder"
            },
            "public/coupons/target": {
                "placeholder": "https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop",
                "description": "Target coupon placeholder"
            },
            "public/coupons/apple": {
                "placeholder": "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400&h=300&fit=crop",
                "description": "Apple coupon placeholder"
            },
            "public/coupons/samsung": {
                "placeholder": "https://images.unsplash.com/photo-1610945415295-d609bb34245d?w=400&h=300&fit=crop",
                "description": "Samsung coupon placeholder"
            },
            "public/coupons/nike": {
                "placeholder": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop",
                "description": "Nike coupon placeholder"
            },
            "public/coupons/cvs": {
                "placeholder": "https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400&h=300&fit=crop",
                "description": "CVS coupon placeholder"
            },
            "public/coupons/autozone": {
                "placeholder": "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop",
                "description": "AutoZone coupon placeholder"
            },
            "public/coupons/home-depot": {
                "placeholder": "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop",
                "description": "Home Depot coupon placeholder"
            },
            "public/coupons/netflix": {
                "placeholder": "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop",
                "description": "Netflix coupon placeholder"
            },
            "users/profile": {
                "placeholder": "https://images.unsplash.com/photo-1535713875002-d1d0c3778df9?w=400&h=300&fit=crop",
                "description": "User profile placeholder"
            },
            "users/uploads": {
                "placeholder": "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop",
                "description": "User uploads placeholder"
            }
        }
        
        print(f"\n📁 Setting up {len(storage_structure)} Storage folders...")
        
        for folder_path, folder_info in storage_structure.items():
            try:
                # Create a placeholder file to establish the folder
                placeholder_blob = bucket.blob(f"{folder_path}/.placeholder")
                placeholder_blob.upload_from_string(
                    folder_info["description"], 
                    content_type="text/plain"
                )
                
                # Download and upload the actual placeholder image
                image_url = folder_info["placeholder"]
                image_name = f"{folder_path}/placeholder.jpg"
                
                print(f"   📥 Downloading image for: {folder_path}")
                response = requests.get(image_url)
                if response.status_code == 200:
                    # Upload the image
                    image_blob = bucket.blob(image_name)
                    image_blob.upload_from_string(
                        response.content,
                        content_type="image/jpeg"
                    )
                    
                    # Make the image publicly readable
                    image_blob.make_public()
                    
                    print(f"   ✅ Created folder and image: {folder_path}")
                else:
                    print(f"   ⚠️  Failed to download image for: {folder_path}")
                    
            except Exception as e:
                print(f"   ❌ Error setting up {folder_path}: {e}")
        
        print("\n✅ Storage setup completed!")
        
        # Verify the setup
        print("\n🔍 Verifying Storage setup...")
        blobs = list(bucket.list_blobs())
        folder_count = len([b for b in blobs if b.name.endswith('.placeholder')])
        image_count = len([b for b in blobs if b.name.endswith('.jpg')])
        
        print(f"   📁 Folders created: {folder_count}")
        print(f"   🖼️  Images uploaded: {image_count}")
        
        if folder_count >= 21 and image_count >= 21:
            print("✅ Storage verification successful!")
        else:
            print("⚠️  Storage verification incomplete")
        
        return True
        
    except Exception as e:
        print(f"❌ Storage setup failed: {e}")
        return False

if __name__ == "__main__":
    print("🚀 Firebase Storage Setup for Lynx App")
    print("=" * 50)
    
    success = setup_storage()
    
    if success:
        print("\n🎉 Storage setup completed successfully!")
        print("📱 Your app now has placeholder images in Storage!")
    else:
        print("\n❌ Storage setup failed. Please check the errors above.")

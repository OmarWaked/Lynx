#!/usr/bin/env python3
"""
Firebase Verification Script
This script checks what's actually in the Firestore database
"""

import firebase_admin
from firebase_admin import firestore

def verify_firebase_data():
    """Verify what data exists in Firebase"""
    try:
        # Initialize Firebase Admin SDK
        if not firebase_admin._apps:
            firebase_admin.initialize_app()
        
        # Get Firestore client
        db = firestore.client()
        
        print("🔍 Verifying Firebase Data...")
        print("=" * 40)
        
        # Check categories collection
        print("\n📁 Checking categories collection...")
        try:
            categories_ref = db.collection('categories')
            categories_docs = list(categories_ref.get())
            print(f"   Found {len(categories_docs)} category documents")
            
            for doc in categories_docs:
                data = doc.to_dict()
                print(f"   - {doc.id}: {data.get('name', 'No name')}")
                
        except Exception as e:
            print(f"   ❌ Error reading categories: {e}")
        
        # Check coupons collection
        print("\n📁 Checking coupons collection...")
        try:
            coupons_ref = db.collection('coupons')
            coupons_docs = list(coupons_ref.get())
            print(f"   Found {len(coupons_docs)} coupon documents")
            
            for doc in coupons_docs:
                data = doc.to_dict()
                print(f"   - {doc.id}: {data.get('name', 'No name')}")
                
        except Exception as e:
            print(f"   ❌ Error reading coupons: {e}")
        
        # Check if collections exist at all
        print("\n📊 Collection Summary:")
        try:
            # Try to list all collections (this might not work with gcloud auth)
            print("   Attempting to list all collections...")
            # This is a workaround to see if we can access the database
            test_ref = db.collection('test')
            test_doc = test_ref.document('verification')
            test_doc.set({'timestamp': firestore.SERVER_TIMESTAMP, 'test': True})
            print("   ✅ Write test successful - database is accessible")
            
            # Clean up test document
            test_doc.delete()
            print("   ✅ Delete test successful")
            
        except Exception as e:
            print(f"   ❌ Database access test failed: {e}")
        
        print("\n" + "=" * 40)
        print("🔍 Verification complete!")
        
    except Exception as e:
        print(f"❌ Verification failed: {e}")

if __name__ == "__main__":
    verify_firebase_data()

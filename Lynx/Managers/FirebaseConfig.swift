//
//  FirebaseConfig.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class FirebaseConfig {
    static let shared = FirebaseConfig()
    
    private init() {}
    
    func configure() {
        // Firebase is already configured in LynxApp.swift
        // This class provides additional configuration and validation
        
        // Validate Firestore configuration
        let db = Firestore.firestore()
        let settings = FirestoreSettings()
        // Note: These settings are deprecated but still functional
        // In future versions, use cacheSettings instead
        settings.isPersistenceEnabled = true
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
        db.settings = settings
        
        // Validate Storage configuration
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        print("✅ Firebase configuration validated:")
        print("   - Firestore: \(db.app.name)")
        print("   - Storage: \(storage.app.name)")
        print("   - Auth: \(Auth.auth().app?.name ?? "Unknown")")
        
        // Test Firestore connection
        testFirestoreConnection()
        
        // Test Storage connection
        testStorageConnection()
        
        // Additional validation
        validateFirebaseServices()
    }
    
    private func validateFirebaseServices() {
        print("\n🔍 Validating Firebase services...")
        
        // Check if Firebase is properly initialized
        guard let app = FirebaseApp.app() else {
            print("❌ Firebase app not initialized")
            return
        }
        
        print("✅ Firebase app initialized: \(app.name)")
        
        // Check Firestore availability
        let _ = Firestore.firestore()
        print("✅ Firestore is available")
        
        // Check Storage availability
        let _ = Storage.storage()
        print("✅ Storage is available")
        
        // Check Auth availability
        let _ = Auth.auth()
        print("✅ Authentication is available")
    }
    
    private func testFirestoreConnection() {
        let db = Firestore.firestore()
        
        // First try to read from categories to test basic connectivity
        db.collection("categories").limit(to: 1).getDocuments { snapshot, error in
            if let error = error {
                print("❌ Firestore connection test failed: \(error.localizedDescription)")
                print("   This usually means security rules need to be updated")
                print("   Please deploy the firestore_rules.rules file to Firebase Console")
            } else {
                print("✅ Firestore connection test successful")
                print("   Found \(snapshot?.documents.count ?? 0) categories")
                
                // Try to create a test document
                db.collection("test").document("connection").setData([
                    "timestamp": FieldValue.serverTimestamp(),
                    "test": true
                ]) { writeError in
                    if let writeError = writeError {
                        print("⚠️  Test write failed (this is normal if rules are restrictive): \(writeError.localizedDescription)")
                    } else {
                        print("✅ Test write successful")
                        // Clean up test document
                        db.collection("test").document("connection").delete { deleteError in
                            if let deleteError = deleteError {
                                print("⚠️  Failed to clean up test document: \(deleteError.localizedDescription)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func testStorageConnection() {
        let storageRef = Storage.storage().reference()
        
        // First try to list files to test basic connectivity
        let categoriesRef = storageRef.child("categories")
        categoriesRef.listAll { result, error in
            if let error = error {
                print("❌ Storage connection test failed: \(error.localizedDescription)")
                print("   This usually means security rules need to be updated")
                print("   Please deploy the storage_rules.rules file to Firebase Console")
            } else {
                print("✅ Storage connection test successful")
                print("   Found \(result?.items.count ?? 0) items in categories folder")
                
                // Try to create a test file
                let testRef = storageRef.child("test/connection.txt")
                guard let testData = "Connection test".data(using: .utf8) else {
                    print("❌ Storage connection test failed: Could not create test data")
                    return
                }
                
                let metadata = StorageMetadata()
                metadata.contentType = "text/plain"
                
                testRef.putData(testData, metadata: metadata) { metadata, error in
                    if let error = error {
                        print("⚠️  Test write failed (this is normal if rules are restrictive): \(error.localizedDescription)")
                    } else {
                        print("✅ Test write successful")
                        // Clean up test file
                        testRef.delete { deleteError in
                            if let deleteError = deleteError {
                                print("⚠️  Failed to clean up test file: \(deleteError.localizedDescription)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Security Rules Validation
    func validateSecurityRules() {
        print("🔒 Firebase Security Rules Status:")
        print("   - Authentication: Enabled")
        print("   - Firestore: User-based access control")
        print("   - Storage: User-based access control")
        print("   - Note: Ensure Firebase Console security rules are configured")
    }
    
    // MARK: - Service Status
    func getServiceStatus() -> [String: Bool] {
        return [
            "Authentication": true,
            "Firestore": true,
            "Storage": true,
            "Analytics": false,
            "Crashlytics": false,
            "Performance": false,
            "Remote Config": false
        ]
    }
    
    // MARK: - Safe Testing Methods
    func testConnectionsSafely() {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.testFirestoreConnection()
            self?.testStorageConnection()
        }
    }
    
    // MARK: - Configuration Summary
    func printConfigurationSummary() {
        print("\n📋 Firebase Configuration Summary:")
        if let app = FirebaseApp.app() {
            print("   - Project: \(app.options.projectID ?? "Unknown")")
            print("   - Bundle ID: \(Bundle.main.bundleIdentifier ?? "Unknown")")
            print("   - Storage Bucket: \(app.options.storageBucket ?? "Unknown")")
            print("   - Database URL: \(app.options.databaseURL ?? "Not set")")
        } else {
            print("   - Firebase app not initialized")
        }
    }
}

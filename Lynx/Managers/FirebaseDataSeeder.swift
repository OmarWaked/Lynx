//
//  FirebaseDataSeeder.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseDataSeeder: ObservableObject {
    private let db = Firestore.firestore()
    private let storageManager = StorageManager()
    
    // MARK: - Seed Categories
    func seedCategories() async {
        let categories = [
            Category(name: "Food & Beverages", imageURL: storageManager.generateDemoImageURL(for: "Food & Beverages")),
            Category(name: "Retail", imageURL: storageManager.generateDemoImageURL(for: "Retail")),
            Category(name: "Health & Beauty", imageURL: storageManager.generateDemoImageURL(for: "Health & Beauty")),
            Category(name: "Sports & Outdoors", imageURL: storageManager.generateDemoImageURL(for: "Sports & Outdoors")),
            Category(name: "Technology", imageURL: storageManager.generateDemoImageURL(for: "Technology")),
            Category(name: "Automotive", imageURL: storageManager.generateDemoImageURL(for: "Automotive")),
            Category(name: "Home & Garden", imageURL: storageManager.generateDemoImageURL(for: "Home & Garden")),
            Category(name: "Entertainment", imageURL: storageManager.generateDemoImageURL(for: "Entertainment"))
        ]
        
        for category in categories {
            do {
                try await db.collection("categories").document(category.name).setData(from: category)
                print("✅ Seeded category: \(category.name)")
            } catch {
                print("❌ Failed to seed category \(category.name): \(error)")
            }
        }
    }
    
    // MARK: - Seed Coupons
    func seedCoupons() async {
        let coupons = [
            // Food & Beverages
            Coupon(
                barcode: "1234567890123",
                brand: "McDonald's",
                category: "Food & Beverages",
                subcategory: "Fast Food",
                discount: "20%",
                expiration: "12/31/2024",
                imageURL: storageManager.generateDemoCouponImageURL(for: "McDonald's"),
                name: "20% Off Any Meal",
                terms: "Valid on any meal purchase. Cannot be combined with other offers.",
                discountType: true,
                companyName: "McDonald's Corporation",
                companyCUID: "MC001"
            ),
            Coupon(
                barcode: "1234567890124",
                brand: "Starbucks",
                category: "Food & Beverages",
                subcategory: "Coffee",
                discount: "15%",
                expiration: "11/30/2024",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Starbucks"),
                name: "15% Off Any Beverage",
                terms: "Valid on any beverage. Excludes food items.",
                discountType: true,
                companyName: "Starbucks Corporation",
                companyCUID: "SB001"
            ),
            
            // Retail
            Coupon(
                barcode: "1234567890125",
                brand: "Walmart",
                category: "Retail",
                subcategory: "General Merchandise",
                discount: "$10",
                expiration: "01/15/2025",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Walmart"),
                name: "$10 Off $50 Purchase",
                terms: "Valid on purchases of $50 or more. Excludes groceries.",
                discountType: false,
                companyName: "Walmart Inc.",
                companyCUID: "WM001"
            ),
            Coupon(
                barcode: "1234567890126",
                brand: "Target",
                category: "Retail",
                subcategory: "General Merchandise",
                discount: "25%",
                expiration: "02/28/2025",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Target"),
                name: "25% Off Home & Garden",
                terms: "Valid on home and garden items. Excludes electronics.",
                discountType: true,
                companyName: "Target Corporation",
                companyCUID: "TG001"
            ),
            
            // Technology
            Coupon(
                barcode: "1234567890127",
                brand: "Apple",
                category: "Technology",
                subcategory: "Electronics",
                discount: "$50",
                expiration: "03/31/2025",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Apple"),
                name: "$50 Off iPhone Purchase",
                terms: "Valid on iPhone purchases. Cannot be combined with other offers.",
                discountType: false,
                companyName: "Apple Inc.",
                companyCUID: "AP001"
            ),
            Coupon(
                barcode: "1234567890128",
                brand: "Samsung",
                category: "Technology",
                subcategory: "Electronics",
                discount: "30%",
                expiration: "04/15/2025",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Samsung"),
                name: "30% Off Galaxy Devices",
                terms: "Valid on Samsung Galaxy smartphones and tablets.",
                discountType: true,
                companyName: "Samsung Electronics",
                companyCUID: "SG001"
            ),
            
            // Sports & Outdoors
            Coupon(
                barcode: "1234567890129",
                brand: "Nike",
                category: "Sports & Outdoors",
                subcategory: "Athletic Wear",
                discount: "40%",
                expiration: "05/30/2025",
                imageURL: storageManager.generateDemoCouponImageURL(for: "Nike"),
                name: "40% Off Running Shoes",
                terms: "Valid on all running shoes. Excludes limited editions.",
                discountType: true,
                companyName: "Nike Inc.",
                companyCUID: "NK001"
            ),
            
            // Health & Beauty
            Coupon(
                barcode: "1234567890130",
                brand: "CVS",
                category: "Health & Beauty",
                subcategory: "Pharmacy",
                discount: "$5",
                expiration: "06/30/2025",
                imageURL: "https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=400&h=300&fit=crop",
                name: "$5 Off $25 Beauty Purchase",
                terms: "Valid on beauty products. Excludes prescriptions.",
                discountType: false,
                companyName: "CVS Health",
                companyCUID: "CV001"
            ),
            
            // Automotive
            Coupon(
                barcode: "1234567890131",
                brand: "AutoZone",
                category: "Automotive",
                subcategory: "Auto Parts",
                discount: "20%",
                expiration: "07/31/2025",
                imageURL: "https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=400&h=300&fit=crop",
                name: "20% Off Auto Parts",
                terms: "Valid on all auto parts. Excludes batteries and oil.",
                discountType: true,
                companyName: "AutoZone Inc.",
                companyCUID: "AZ001"
            ),
            
            // Home & Garden
            Coupon(
                barcode: "1234567890132",
                brand: "Home Depot",
                category: "Home & Garden",
                subcategory: "Hardware",
                discount: "$15",
                expiration: "08/31/2025",
                imageURL: "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop",
                name: "$15 Off $75 Purchase",
                terms: "Valid on purchases of $75 or more. Excludes appliances.",
                discountType: false,
                companyName: "Home Depot Inc.",
                companyCUID: "HD001"
            ),
            
            // Entertainment
            Coupon(
                barcode: "1234567890133",
                brand: "Netflix",
                category: "Entertainment",
                subcategory: "Streaming",
                discount: "2 Months Free",
                expiration: "09/30/2025",
                imageURL: "https://images.unsplash.com/photo-1489599835382-67450f1c3d8b?w=400&h=300&fit=crop",
                name: "2 Months Free Netflix",
                terms: "New subscribers only. Valid for standard plan.",
                discountType: false,
                companyName: "Netflix Inc.",
                companyCUID: "NF001"
            )
        ]
        
        for coupon in coupons {
            do {
                try await db.collection("coupons").document(coupon.barcode).setData(from: coupon)
                print("✅ Seeded coupon: \(coupon.name)")
            } catch {
                print("❌ Failed to seed coupon \(coupon.name): \(error)")
            }
        }
    }
    
    // MARK: - Seed All Data
    func seedAllData() async {
        print("🌱 Starting Firebase data seeding...")
        
        await seedCategories()
        await seedCoupons()
        
        print("✅ Firebase data seeding completed!")
    }
    
    // MARK: - Clear All Data (for testing)
    func clearAllData() async {
        print("🗑️ Clearing all Firebase data...")
        
        // Clear coupons
        let couponsSnapshot = try? await db.collection("coupons").getDocuments()
        for document in couponsSnapshot?.documents ?? [] {
            try? await document.reference.delete()
        }
        
        // Clear categories
        let categoriesSnapshot = try? await db.collection("categories").getDocuments()
        for document in categoriesSnapshot?.documents ?? [] {
            try? await document.reference.delete()
        }
        
        print("✅ All Firebase data cleared!")
    }
}

//
//  CouponManager.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

@MainActor
class CouponManager: ObservableObject {
    @Published var coupons: [Coupon] = []
    @Published var categories: [Category] = []
    @Published var bookmarkedItems: [BookmarkedItem] = []
    @Published var transactions: [Transaction] = []
    @Published var featuredCoupons: [Coupon] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let db = Firestore.firestore()
    private let storageManager = StorageManager()
    
    init() {
        Task {
            await fetchCategories()
            await fetchCoupons()
            await fetchBookmarkedItems()
            await fetchTransactions()
            
            // Seed demo data if needed
            await seedDemoDataIfNeeded()
        }
    }
    
    // MARK: - Categories
    func fetchCategories() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let snapshot = try await db.collection("categories").getDocuments()
            
            let documents = snapshot.documents
            
            print("✅ Found \(documents.count) categories")
            
            categories = try documents.compactMap { document in
                try document.data(as: Category.self)
            }
            
            print("✅ Successfully decoded \(categories.count) categories")
        } catch {
            print("❌ Failed to fetch categories: \(error.localizedDescription)")
            if error.localizedDescription.contains("Missing or insufficient permissions") {
                errorMessage = "Firebase permissions issue. Please check security rules."
                print("   🔒 This usually means Firestore security rules need to be updated")
                print("   📋 Deploy the firestore_rules.rules file to Firebase Console")
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    // MARK: - Coupons
    func fetchCoupons() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let snapshot = try await db.collection("coupons").getDocuments()
            
            let documents = snapshot.documents
            
            print("✅ Found \(documents.count) coupons")
            
            coupons = try documents.compactMap { document in
                try document.data(as: Coupon.self)
            }
            
            print("✅ Successfully decoded \(coupons.count) coupons")
            updateFeaturedCoupons()
        } catch {
            print("❌ Failed to fetch coupons: \(error.localizedDescription)")
            if error.localizedDescription.contains("Missing or insufficient permissions") {
                errorMessage = "Firebase permissions issue. Please check security rules."
                print("   🔒 This usually means Firestore security rules need to be updated")
                print("   📋 Deploy the firestore_rules.rules file to Firebase Console")
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func fetchCouponsByCategory(_ category: String) async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        print("🔍 Fetching coupons for category: '\(category)'")
        
        do {
            let snapshot = try await db.collection("coupons")
                .whereField("category", isEqualTo: category)
                .getDocuments()
            
            let documents = snapshot.documents
            
            print("✅ Found \(documents.count) coupons for category '\(category)'")
            
            let categoryCoupons = try documents.compactMap { document in
                try document.data(as: Coupon.self)
            }
            
            print("✅ Successfully decoded \(categoryCoupons.count) coupons for category '\(category)'")
            
            // Update the main coupons array with the filtered results
            coupons = categoryCoupons
            
        } catch {
            print("❌ Failed to fetch coupons for category '\(category)': \(error.localizedDescription)")
            if error.localizedDescription.contains("Missing or insufficient permissions") {
                errorMessage = "Firebase permissions issue. Please check security rules."
                print("   🔒 This usually means Firestore security rules need to be updated")
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    // MARK: - Get Coupons by Category (without affecting main array)
    func getCouponsByCategory(_ category: String) async throws -> [Coupon] {
        print("🔍 Getting coupons for category: '\(category)' (non-destructive)")
        
        let snapshot = try await db.collection("coupons")
            .whereField("category", isEqualTo: category)
            .getDocuments()
        
        let documents = snapshot.documents
        
        print("✅ Found \(documents.count) coupons for category '\(category)'")
        
        let categoryCoupons = try documents.compactMap { document in
            try document.data(as: Coupon.self)
        }
        
        print("✅ Successfully decoded \(categoryCoupons.count) coupons for category '\(category)'")
        return categoryCoupons
    }
    
    func searchCoupons(query: String) async {
        guard !query.isEmpty else {
            await fetchCoupons()
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            let snapshot = try await db.collection("coupons").getDocuments()
            
            let documents = snapshot.documents
            
            let allCoupons = try documents.compactMap { document in
                try document.data(as: Coupon.self)
            }
            
            // Filter by search query
            coupons = allCoupons.filter { coupon in
                coupon.name.localizedCaseInsensitiveContains(query) ||
                coupon.brand.localizedCaseInsensitiveContains(query) ||
                coupon.category.localizedCaseInsensitiveContains(query)
            }
        } catch {
            errorMessage = "Failed to decode coupons: \(error.localizedDescription)"
        }
    }
    
    private func updateFeaturedCoupons() {
        // Get first 5 coupons as featured
        featuredCoupons = Array(coupons.prefix(5))
    }
    
    // MARK: - Bookmarks
    func fetchBookmarkedItems() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await db.collection("users").document(userId)
                .collection("bookmarks")
                .getDocuments()
            
            let documents = snapshot.documents
            
            bookmarkedItems = try documents.compactMap { document in
                try document.data(as: BookmarkedItem.self)
            }
        } catch {
            errorMessage = "Failed to decode bookmarks: \(error.localizedDescription)"
        }
    }
    
    func toggleBookmark(for coupon: Coupon) async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let bookmarkRef = db.collection("users").document(userId)
            .collection("bookmarks").document(coupon.barcode)
        
        // Check if already bookmarked
        if bookmarkedItems.contains(where: { $0.barcode == coupon.barcode }) {
            // Remove bookmark
            do {
                try await bookmarkRef.delete()
                bookmarkedItems.removeAll { $0.barcode == coupon.barcode }
            } catch {
                errorMessage = error.localizedDescription
            }
        } else {
            // Add bookmark
            let bookmarkedItem = BookmarkedItem(
                barcode: coupon.barcode,
                brand: coupon.brand,
                category: coupon.category,
                subcategory: coupon.subcategory,
                discount: coupon.discount,
                expiration: coupon.expiration,
                imageURL: coupon.imageURL,
                name: coupon.name,
                terms: coupon.terms,
                discountType: coupon.discountType,
                dateBookmarked: Date()
            )
            
            do {
                try bookmarkRef.setData(from: bookmarkedItem)
                bookmarkedItems.append(bookmarkedItem)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func isBookmarked(_ coupon: Coupon) -> Bool {
        return bookmarkedItems.contains { $0.barcode == coupon.barcode }
    }
    
    // MARK: - Transactions
    func fetchTransactions() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await db.collection("users").document(userId)
                .collection("transactions")
                .order(by: "dateUsed", descending: true)
                .getDocuments()
            
            let documents = snapshot.documents
            
            transactions = try documents.compactMap { document in
                try document.data(as: Transaction.self)
            }
        } catch {
            errorMessage = "Failed to decode transactions: \(error.localizedDescription)"
        }
    }
    
    func addTransaction(couponId: String, storeName: String, amount: Double) async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let transaction = Transaction(
            couponId: couponId,
            dateUsed: Date(),
            storeName: storeName,
            amount: amount
        )
        
        let transactionRef = db.collection("users").document(userId)
            .collection("transactions").document()
        
        do {
            try transactionRef.setData(from: transaction)
            transactions.insert(transaction, at: 0)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // MARK: - Demo Data Seeding
    func seedDemoDataIfNeeded() async {
        // Check if categories exist
        let categoriesSnapshot = try? await db.collection("categories").getDocuments()
        if categoriesSnapshot?.documents.isEmpty ?? true {
            print("🌱 No categories found, seeding demo data...")
            let seeder = FirebaseDataSeeder()
            await seeder.seedAllData()
            
            // Refresh data after seeding
            await fetchCategories()
            await fetchCoupons()
        }
    }
}

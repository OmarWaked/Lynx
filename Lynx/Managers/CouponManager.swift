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
        fetchCategories()
        fetchCoupons()
        fetchBookmarkedItems()
        fetchTransactions()
        
        // Seed demo data if needed
        Task {
            await seedDemoDataIfNeeded()
        }
    }
    
    // MARK: - Categories
    func fetchCategories() {
        isLoading = true
        errorMessage = nil
        
        db.collection("categories").getDocuments { [weak self] snapshot, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    print("❌ Failed to fetch categories: \(error.localizedDescription)")
                    if error.localizedDescription.contains("Missing or insufficient permissions") {
                        self?.errorMessage = "Firebase permissions issue. Please check security rules."
                        print("   🔒 This usually means Firestore security rules need to be updated")
                        print("   📋 Deploy the firestore_rules.rules file to Firebase Console")
                    } else {
                        self?.errorMessage = error.localizedDescription
                    }
                    return
                }
                
                guard let documents = snapshot?.documents else { 
                    print("⚠️  No categories found")
                    return 
                }
                
                print("✅ Found \(documents.count) categories")
                do {
                    self?.categories = try documents.compactMap { document in
                        try document.data(as: Category.self)
                    }
                    print("✅ Successfully decoded \(self?.categories.count ?? 0) categories")
                } catch {
                    self?.errorMessage = "Failed to decode categories: \(error.localizedDescription)"
                    print("❌ Category decoding error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Coupons
    func fetchCoupons() {
        isLoading = true
        errorMessage = nil
        
        db.collection("coupons")
            .getDocuments { [weak self] snapshot, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        print("❌ Failed to fetch coupons: \(error.localizedDescription)")
                        if error.localizedDescription.contains("Missing or insufficient permissions") {
                            self?.errorMessage = "Firebase permissions issue. Please check security rules."
                            print("   🔒 This usually means Firestore security rules need to be updated")
                            print("   📋 Deploy the firestore_rules.rules file to Firebase Console")
                        } else {
                            self?.errorMessage = error.localizedDescription
                        }
                        return
                    }
                    
                    guard let documents = snapshot?.documents else { 
                        print("⚠️  No coupons found")
                        return 
                    }
                    
                    print("✅ Found \(documents.count) coupons")
                    do {
                        self?.coupons = try documents.compactMap { document in
                            try document.data(as: Coupon.self)
                        }
                        print("✅ Successfully decoded \(self?.coupons.count ?? 0) coupons")
                        self?.updateFeaturedCoupons()
                    } catch {
                        self?.errorMessage = "Failed to decode coupons: \(error.localizedDescription)"
                        print("❌ Coupon decoding error: \(error.localizedDescription)")
                    }
                }
            }
    }
    
    func fetchCouponsByCategory(_ category: String) {
        isLoading = true
        errorMessage = nil
        
        print("🔍 Fetching coupons for category: '\(category)'")
        
        db.collection("coupons")
            .whereField("category", isEqualTo: category)
            .getDocuments { [weak self] snapshot, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        print("❌ Error fetching coupons for category '\(category)': \(error.localizedDescription)")
                        if error.localizedDescription.contains("Missing or insufficient permissions") {
                            self?.errorMessage = "Firebase permissions issue. Please check security rules."
                            print("   🔒 This usually means Firestore security rules need to be updated")
                        } else {
                            self?.errorMessage = error.localizedDescription
                        }
                        return
                    }
                    
                    guard let documents = snapshot?.documents else { 
                        print("⚠️  No documents found for category '\(category)'")
                        self?.errorMessage = "No coupons found for this category"
                        return 
                    }
                    
                    print("✅ Found \(documents.count) coupons for category '\(category)'")
                    
                    do {
                        let categoryCoupons = try documents.compactMap { document in
                            try document.data(as: Coupon.self)
                        }
                        
                        print("✅ Successfully decoded \(categoryCoupons.count) coupons for category '\(category)'")
                        
                        // Update the main coupons array with the filtered results
                        self?.coupons = categoryCoupons
                        
                    } catch {
                        print("❌ Failed to decode coupons for category '\(category)': \(error.localizedDescription)")
                        self?.errorMessage = "Failed to decode coupons: \(error.localizedDescription)"
                    }
                }
            }
    }
    
    // MARK: - Get Coupons by Category (without affecting main array)
    func getCouponsByCategory(_ category: String, completion: @escaping ([Coupon], Error?) -> Void) {
        print("🔍 Getting coupons for category: '\(category)' (non-destructive)")
        
        db.collection("coupons")
            .whereField("category", isEqualTo: category)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("❌ Error getting coupons for category '\(category)': \(error.localizedDescription)")
                    completion([], error)
                    return
                }
                
                guard let documents = snapshot?.documents else { 
                    print("⚠️  No documents found for category '\(category)'")
                    completion([], nil)
                    return 
                }
                
                print("✅ Found \(documents.count) coupons for category '\(category)'")
                
                do {
                    let categoryCoupons = try documents.compactMap { document in
                        try document.data(as: Coupon.self)
                    }
                    
                    print("✅ Successfully decoded \(categoryCoupons.count) coupons for category '\(category)'")
                    completion(categoryCoupons, nil)
                    
                } catch {
                    print("❌ Failed to decode coupons for category '\(category)': \(error.localizedDescription)")
                    completion([], error)
                }
            }
    }
    
    func searchCoupons(query: String) {
        guard !query.isEmpty else {
            fetchCoupons()
            return
        }
        
        isLoading = true
        
        db.collection("coupons")
            .getDocuments { [weak self] snapshot, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        return
                    }
                    
                    guard let documents = snapshot?.documents else { return }
                    
                    do {
                        let allCoupons = try documents.compactMap { document in
                            try document.data(as: Coupon.self)
                        }
                        
                        // Filter by search query
                        self?.coupons = allCoupons.filter { coupon in
                            coupon.name.localizedCaseInsensitiveContains(query) ||
                            coupon.brand.localizedCaseInsensitiveContains(query) ||
                            coupon.category.localizedCaseInsensitiveContains(query)
                        }
                    } catch {
                        self?.errorMessage = "Failed to decode coupons: \(error.localizedDescription)"
                    }
                }
            }
    }
    
    private func updateFeaturedCoupons() {
        // Get first 5 coupons as featured
        featuredCoupons = Array(coupons.prefix(5))
    }
    
    // MARK: - Bookmarks
    func fetchBookmarkedItems() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userId)
            .collection("bookmarks")
            .getDocuments { [weak self] snapshot, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        return
                    }
                    
                    guard let documents = snapshot?.documents else { return }
                    
                    do {
                        self?.bookmarkedItems = try documents.compactMap { document in
                            try document.data(as: BookmarkedItem.self)
                        }
                    } catch {
                        self?.errorMessage = "Failed to decode bookmarks: \(error.localizedDescription)"
                    }
                }
            }
    }
    
    func toggleBookmark(for coupon: Coupon) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let bookmarkRef = db.collection("users").document(userId)
            .collection("bookmarks").document(coupon.barcode)
        
        // Check if already bookmarked
        if bookmarkedItems.contains(where: { $0.barcode == coupon.barcode }) {
            // Remove bookmark
            bookmarkRef.delete { [weak self] error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.errorMessage = error.localizedDescription
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.bookmarkedItems.removeAll { $0.barcode == coupon.barcode }
                    }
                }
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
                DispatchQueue.main.async {
                    self.bookmarkedItems.append(bookmarkedItem)
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func isBookmarked(_ coupon: Coupon) -> Bool {
        return bookmarkedItems.contains { $0.barcode == coupon.barcode }
    }
    
    // MARK: - Transactions
    func fetchTransactions() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userId)
            .collection("transactions")
            .order(by: "dateUsed", descending: true)
            .getDocuments { [weak self] snapshot, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self?.errorMessage = error.localizedDescription
                        return
                    }
                    
                    guard let documents = snapshot?.documents else { return }
                    
                    do {
                        self?.transactions = try documents.compactMap { document in
                            try document.data(as: Transaction.self)
                        }
                    } catch {
                        self?.errorMessage = "Failed to decode transactions: \(error.localizedDescription)"
                    }
                }
            }
    }
    
    func addTransaction(couponId: String, storeName: String, amount: Double) {
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
            DispatchQueue.main.async {
                self.transactions.insert(transaction, at: 0)
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
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
            await MainActor.run {
                self.fetchCategories()
                self.fetchCoupons()
            }
        }
    }
}

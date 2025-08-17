//
//  CategoryDetailView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    @EnvironmentObject var couponManager: CouponManager
    @Environment(\.presentationMode) var presentationMode
    @State private var filteredCoupons: [Coupon] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    VStack(spacing: 20) {
                        ProgressView()
                            .scaleEffect(1.5)
                        
                        Text("Loading coupons...")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                } else if let errorMessage = errorMessage {
                    VStack(spacing: 20) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 60))
                            .foregroundColor(.orange)
                        
                        Text("Error Loading Coupons")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(errorMessage)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Try Again") {
                            loadCouponsForCategory()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else if filteredCoupons.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "tag")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        
                        Text("No Coupons Found")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("There are no coupons available in the '\(category.name)' category at the moment.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Refresh") {
                            loadCouponsForCategory()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    VStack(spacing: 16) {
                        Text("\(filteredCoupons.count) coupons found")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 20)
                        
                        List(filteredCoupons) { coupon in
                            CouponCard(coupon: coupon)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle(category.name)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
            .refreshable {
                loadCouponsForCategory()
            }
            .onAppear {
                print("📱 CategoryDetailView appeared for category: \(category.name)")
                loadCouponsForCategory()
            }
        }
    }
    
    private func loadCouponsForCategory() {
        isLoading = true
        errorMessage = nil
        
        print("🔍 Loading coupons for category: '\(category.name)'")
        print("📊 Current coupons in manager: \(couponManager.coupons.count)")
        
        // First try to filter from existing coupons
        let existingFiltered = couponManager.coupons.filter { $0.category == category.name }
        
        if !existingFiltered.isEmpty {
            print("✅ Found \(existingFiltered.count) existing coupons for category '\(category.name)'")
            filteredCoupons = existingFiltered
            isLoading = false
            return
        }
        
        print("📡 No existing coupons found, fetching from Firebase...")
        
        // If no existing coupons, fetch from Firebase using non-destructive method
        Task {
            do {
                let coupons = try await couponManager.getCouponsByCategory(category.name)
                await MainActor.run {
                    if coupons.isEmpty {
                        print("⚠️ No coupons found for category '\(self.category.name)'")
                        self.errorMessage = "No coupons found for this category"
                    } else {
                        print("✅ Successfully loaded \(coupons.count) coupons for category '\(self.category.name)'")
                        self.filteredCoupons = coupons
                    }
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    print("❌ Error fetching coupons: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    
                    // Fallback: try to show any existing coupons that might match
                    let fallbackCoupons = self.couponManager.coupons.filter { $0.category == self.category.name }
                    if !fallbackCoupons.isEmpty {
                        print("🔄 Using fallback: found \(fallbackCoupons.count) coupons")
                        self.filteredCoupons = fallbackCoupons
                        self.errorMessage = nil
                    }
                    self.isLoading = false
                }
            }
        }
    }
}

#Preview {
    CategoryDetailView(category: Category(
        name: "Sports",
        imageURL: "https://example.com/sports.jpg"
    ))
    .environmentObject(CouponManager())
}

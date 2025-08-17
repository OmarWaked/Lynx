//
//  HomeView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var couponManager: CouponManager
    @State private var searchText = ""
    @State private var selectedCategory: Category?
    
    var body: some View {
        NavigationView {
            ZStack {
                // Modern background
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Modern Search Bar
                        SearchBar(text: $searchText, onSearch: {
                            if !searchText.isEmpty {
                                couponManager.searchCoupons(query: searchText)
                            } else {
                                couponManager.fetchCoupons()
                            }
                        })
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        // Featured Coupons Section
                        if !couponManager.featuredCoupons.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("Featured Deals")
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                    
                                    Spacer()
                                    
                                    Text("\(couponManager.featuredCoupons.count)")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(
                                            Capsule()
                                                .fill(Color(.systemGray6))
                                        )
                                }
                                .padding(.horizontal, 20)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 16) {
                                        ForEach(couponManager.featuredCoupons) { coupon in
                                            FeaturedCouponCard(coupon: coupon)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 8)
                                }
                            }
                        }
                        
                        // Categories Section
                        if !couponManager.categories.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("Categories")
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundStyle(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                    
                                    Spacer()
                                    
                                    Text("\(couponManager.categories.count)")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(
                                            Capsule()
                                                .fill(Color(.systemGray6))
                                        )
                                }
                                .padding(.horizontal, 20)
                                
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                                    ForEach(couponManager.categories) { category in
                                        CategoryCard(category: category) {
                                            print("🎯 Category tapped: \(category.name)")
                                            selectedCategory = category
                                            // Don't modify the main coupons array here
                                            // CategoryDetailView will handle its own data loading
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        } else {
                            VStack(spacing: 20) {
                                Image(systemName: "tag")
                                    .font(.system(size: 40))
                                    .foregroundColor(.secondary)
                                
                                Text("No Categories Available")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Button("Refresh Categories") {
                                    couponManager.fetchCategories()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            .padding()
                        }
                        
                        // All Coupons Section
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("All Deals")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundStyle(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                
                                Spacer()
                                
                                Text("\(couponManager.coupons.count)")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(
                                        Capsule()
                                            .fill(Color(.systemGray6))
                                    )
                            }
                            .padding(.horizontal, 20)
                            
                            LazyVStack(spacing: 16) {
                                ForEach(couponManager.coupons) { coupon in
                                    CouponCard(coupon: coupon)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        // Bottom spacing
                        Spacer(minLength: 100)
                    }
                    .padding(.vertical, 16)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                trailing: HStack(spacing: 16) {
                    Button(action: {
                        // TODO: Implement barcode scanner
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.1))
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "barcode.viewfinder")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Button(action: {
                        // TODO: Implement search
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.purple.opacity(0.1))
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.purple)
                        }
                    }
                }
            )
            .refreshable {
                couponManager.fetchCoupons()
                couponManager.fetchCategories()
            }
        }
        .sheet(item: $selectedCategory) { category in
            CategoryDetailView(category: category)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CouponManager())
    }
}

//
//  MainTabView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: selectedTab == 0 ? "house.fill" : "house")
                }
                .tag(0)
            
            TransactionView()
                .tabItem {
                    Label("Transactions", systemImage: selectedTab == 1 ? "cart.fill" : "cart")
                }
                .tag(1)
            
            BookmarkedView()
                .tabItem {
                    Label("Bookmarks", systemImage: selectedTab == 2 ? "bookmark.fill" : "bookmark")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: selectedTab == 3 ? "gear.circle.fill" : "gear.circle")
                }
                .tag(3)
        }
        .tint(.blue)
        .onAppear {
            configureTabBarAppearance()
        }
    }
    
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        
        // Normal state
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 12, weight: .medium)
        ]
        
        // Selected state
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 12, weight: .semibold)
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthenticationManager())
        .environmentObject(CouponManager())
}

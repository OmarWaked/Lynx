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
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .font(.system(size: 20, weight: .medium))
                        Text("Home")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
                .tag(0)
            
            TransactionView()
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == 1 ? "cart.fill" : "cart")
                            .font(.system(size: 20, weight: .medium))
                        Text("Transactions")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
                .tag(1)
            
            BookmarkedView()
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == 2 ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 20, weight: .medium))
                        Text("Bookmarks")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    VStack(spacing: 4) {
                        Image(systemName: selectedTab == 3 ? "gear.circle.fill" : "gear.circle")
                            .font(.system(size: 20, weight: .medium))
                        Text("Settings")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
                .tag(3)
        }
        .accentColor(.blue)
        .onAppear {
            // Customize tab bar appearance
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
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthenticationManager())
            .environmentObject(CouponManager())
    }
}

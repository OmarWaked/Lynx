//
//  LynxApp.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI
import Firebase

@main
struct LynxApp: App {
    @StateObject private var authManager = AuthenticationManager()
    @StateObject private var couponManager = CouponManager()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {
        FirebaseApp.configure()
        
        // Additional Firebase configuration and validation
        FirebaseConfig.shared.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
                .environmentObject(couponManager)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("DarkModeChanged"))) { _ in
                    // Force refresh of the color scheme
                    print("🔄 Refreshing app color scheme")
                }
        }
    }
}

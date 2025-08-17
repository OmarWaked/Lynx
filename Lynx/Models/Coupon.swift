//
//  Coupon.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import UIKit

struct Coupon: Identifiable, Codable {
    let id = UUID()
    let barcode: String
    let brand: String
    let category: String
    let subcategory: String
    let discount: String
    let expiration: String
    let imageURL: String
    let name: String
    let terms: String
    let discountType: Bool
    let companyName: String
    let companyCUID: String
    
    var isExpired: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let expirationDate = formatter.date(from: expiration) {
            return expirationDate < Date()
        }
        return false
    }
    
    var daysUntilExpiration: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let expirationDate = formatter.date(from: expiration) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: Date(), to: expirationDate)
            return components.day ?? 0
        }
        return 0
    }
}

struct Category: Identifiable, Codable {
    let id = UUID()
    let name: String
    let imageURL: String
}

struct BookmarkedItem: Identifiable, Codable {
    let id = UUID()
    let barcode: String
    let brand: String
    let category: String
    let subcategory: String
    let discount: String
    let expiration: String
    let imageURL: String
    let name: String
    let terms: String
    let discountType: Bool
    let dateBookmarked: Date
}

struct Transaction: Identifiable, Codable {
    let id = UUID()
    let couponId: String
    let dateUsed: Date
    let storeName: String
    let amount: Double
}

struct UserProfile: Codable {
    let uid: String
    let email: String
    let displayName: String?
    let photoURL: String?
    let preferences: UserPreferences
}

struct UserPreferences: Codable {
    var isDarkMode: Bool = false
    var notificationsEnabled: Bool = true
    var locationEnabled: Bool = true
}

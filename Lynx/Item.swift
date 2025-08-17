//
//  Item.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation

// This file is kept for compatibility but is not used in the new SwiftUI implementation
struct Item: Identifiable {
    let id = UUID()
    let timestamp: Date
}

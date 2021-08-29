//
//  Refrences.swift
//  C4ME
//
//  Created by Omar Waked on 12/27/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Alamofire

var font = "PingFangTC-Regular"
var fontBold = "PingFangTC-Semibold"
var standardFont = "PingFangTC-Regular"

var selectedCategory = String()

var categoriesArray = [String]()
let indexPath = IndexPath(row: Int(), section: Int())
let database = Firestore.firestore()
let settings = database.settings
var currentUserEmail = Auth.auth().currentUser?.email
var currentUserUUID = Auth.auth().currentUser?.uid
var currentUserName = String()
var reference: DocumentReference? = nil
var storageReference = Storage.storage().reference()
let userDefaults = UserDefaults.standard
var statusBarRef = UIApplication.shared.statusBarFrame
let codeGenerator = FCBBarCodeGenerator()
let currentDay = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .short)
let user = Auth.auth().currentUser
var settingsView = Bool()
var homeView = Bool()
var defaultImage = String()

var functions = Functions.functions()
var errorMessage = String()
var functionError = Bool()

//Coupon Data
var couponPassCompanyName = String()
var couponPassCUID = String()
var couponPassImage = UIImage()
var couponPassName = String()
var couponPassDiscount = String()
var couponPassBrand = String()
var couponPassExpiration = String()
var couponPassBarcode = String()
var couponPassCategory = String()
var couponPassSubcategory = String()
var couponPassTerms = String()
var couponPassDate = Date()
var couponPassDiscountType = Bool()

//Web view
var webLink = String()
var webViewLabel = String()

//Filter
var viewLabel = String()
var couponBrandArray = [String]()
var couponSubcategoryArray = [String]()
var promotedBrandArray = [String]()
var promotedSubcategoryArray = [String]()
var searchBrandArray = [String]()
var searchSubcategoryArray = [String]()

//Arrays
var promotedCouponArray = [trendingCoupons]()
var categoryArray = [getCategoryInfo]()
var couponArray = [getCouponData]()
var instoreCheckOutArray = [checkOutArrayInfo]()
var bookmarkedArray = [bookmarkedItemInfo]()
var purchaseHistoryArray = [purchaseHistory]()
var transactionHistoryArray = [purchaseHistoryDetails]()

//History Detail
var transactionStorePass: String!
var transactionDatePass: String!
var transactionTotalPass: String!
var transactionSavingsPass: String!
var transactionItemPass: [String]!
var transactionTypePass: String!
var transactionIDPass: String!

//COLORS
var StandardViewColor = UIColor(named: "color")!
var StandardContrastColor = UIColor(named: "colorContrast")!
var StandardTintColor = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)

//Navigation Controller

    //DARK MODE
let titleAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: font, size: 17)!]
let buttonAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: font, size: 17)!]
let largeTitleAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: font, size: 40)!]

    //LIGHT MODE
let titleAttributesWhite: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: font, size: 17)!]
let buttonAttributesWhite: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: font, size: 17)!]
let largeTitleAttributesWhite: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: font, size: 40)!]


//FILTER DATA
var selectedFilterBrandArray = [String]()
var selectedFilterItemArray = [String]()

//COLLECTION VIEW


//TABLE VIEW

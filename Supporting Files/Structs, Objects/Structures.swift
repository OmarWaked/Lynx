//
//  DataStructures.swift
//  C4ME
//
//  Created by Omar Waked on 1/4/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

struct getCouponData {
    var categoryName = [String]()
    var Coupons = [QuerySnapshot]()
    var Barcode: String!
    var Brand: String!
    var Category: String!
    var Discount: String!
    var Expiration: String!
    var Image: UIImage!
    var Name: String!
    var Terms: String!
    var Subcategory: String!
    var DiscountType: Bool
    var CompanyName: String!
    var CompanyCUID: String!
    
    init(Brand: String!, Name: String!, Category: String!,Subcategory: String!, Discount: String!, Image: UIImage!, Expires: String!, Barcode: String!, Terms: String!, DiscountType: Bool, CompanyName: String!, CompanyCUID: String!){
        self.Barcode = Barcode
        self.Brand = Brand
        self.Category = Category
        self.Subcategory = Subcategory
        self.Discount = Discount
        self.Expiration = Expires
        self.Image = Image
        self.Name = Name
        self.Terms = Terms
        self.DiscountType = DiscountType
        self.CompanyName = CompanyName
        self.CompanyCUID = CompanyCUID
    }
}

struct getCategoryInfo {
    var Name: String!
    var Image: UIImage!
    
    init(Category: String!, Image: UIImage!) {
        self.Name = Category
        self.Image = Image
    }
}

struct getAccountInfo {
    var cellImage: UIImage!
    var cellName: String!
    
    init(cellName: String!, cellImage: UIImage){
        self.cellImage = cellImage
        self.cellName = cellName
    }
}

struct bookmarkedItemInfo {
    var Barcode: String!
    var Brand: String!
    var Category: String!
    var Discount: String!
    var Expiration: String!
    var Image: UIImage!
    var Name: String!
    var Terms: String!
    var Subcategory: String!
    var DiscountType: Bool!
    
    init(Brand: String!, Name: String!, Category: String!,Subcategory: String!, Discount: String!, Image: UIImage!, Expires: String!, Barcode: String!, Terms: String!, DiscountType: Bool!){
        self.Barcode = Barcode
        self.Brand = Brand
        self.Category = Category
        self.Subcategory = Subcategory
        self.Discount = Discount
        self.Expiration = Expires
        self.Image = Image
        self.Name = Name
        self.Terms = Terms
        self.DiscountType = DiscountType
    }
}

struct saveLoyaltyCardInfo {
    var Store: String!
    var Number: String!
    var Image: UIImage!
    
    init(Number: String!, Store: String!, Image: UIImage!){
        self.Number = Number
        self.Store = Store
        self.Image = Image
    }
}

struct checkOutArrayInfo {
    var Number: String!
    var Brand: String!
    var Name: String!
    var Price: String!
    var Quantity: String!
    var Category: String!

    init(Brand: String!, Name: String!, Number: String!, Price: String!, Quantity: String!, Category: String!){
        self.Brand = Brand
        self.Name = Name
        self.Number = Number
        self.Price = Price
        self.Quantity = Quantity
        self.Category = Category
    }
}

struct trendingCoupons {
    var Barcode: String!
    var Brand: String!
    var Category: String!
    var Discount: String!
    var Expiration: String!
    var Image: UIImage!
    var Name: String!
    var Terms: String!
    var Subcategory: String!
    var DiscountType: Bool!
    
    init(Brand: String!, Name: String!, Category: String!,Subcategory: String!, Discount: String!, Image: UIImage!, Expires: String!, Barcode: String!, Terms: String!, DiscountType: Bool!){
        self.Barcode = Barcode
        self.Brand = Brand
        self.Category = Category
        self.Subcategory = Subcategory
        self.Discount = Discount
        self.Expiration = Expires
        self.Image = Image
        self.Name = Name
        self.Terms = Terms
        self.DiscountType = DiscountType
    }
}
    
struct findRelatedCoupons {
    var Barcode: String!
    var Brand: String!
    var Category: String!
    var Discount: String!
    var Expiration: String!
    var Image: UIImage!
    var Name: String!
    var Terms: String!
    var Subcategory: String!
    var DiscountType: Bool!
    
    init(Brand: String!, Name: String!, Category: String!,Subcategory: String!, Discount: String!, Image: UIImage!, Expires: String!, Barcode: String!, Terms: String!, DiscountType: Bool!){
        self.Barcode = Barcode
        self.Brand = Brand
        self.Category = Category
        self.Subcategory = Subcategory
        self.Discount = Discount
        self.Expiration = Expires
        self.Image = Image
        self.Name = Name
        self.Terms = Terms
        self.DiscountType = DiscountType
    }
}

struct purchaseHistory {
    var Store: String!
    var Date: String!
    var Instore: Bool
    var Location: String!
    var Total: String!
    var Saved: String!
    var Document: String!
    var Items: String!
    
    init(Document: String!, Store: String!, Date: String!, Instore: Bool, Location: String!, Total: String!, Saved: String!, Items: String!){
        self.Document = Document
        self.Store = Store
        self.Date = Date
        self.Instore = Instore
        self.Location = Location
        self.Total = Total
        self.Saved = Saved
        self.Items = Items
    }
}

struct purchaseHistoryDetails {
    var Barcode: String!
    var Brand: String!
    var Name: String!
    var Price: String!
    var Quantity: String!
    
    init(Barcode: String!, Brand: String!, Name: String!, Price: String!, Quantity: String!){
        self.Barcode = Barcode
        self.Brand = Brand
        self.Name = Name
        self.Price = Price
        self.Quantity = Quantity
    }
}

struct reportError {
    var ErrorType: [String] = []
    var Detail: String!
    var Barcode: String!
    var Brand: String!
    var Name: String!
    var Category: String!
    var Subcategory: String!
    var UserUUID: String!
    var UserEmail: String!
    
    init(Type: [String], Detail: String!,Barcode: String!,Brand: String!,Name: String!,Category: String!,Subcategory: String!,UserUUID: String!,UserEmail: String!){
        self.ErrorType = Type
        self.Detail = Detail
        self.Barcode = Barcode
        self.Brand = Brand
        self.Category = Category
        self.Subcategory = Subcategory
        self.UserUUID = UserUUID
        self.UserEmail = UserEmail
    }
}

struct applicableCoupons {
    var Barcode: String!
    var Category: String!
    var Discount: String!
    var DiscountType: Bool!
    
    init(Barcode: String!, Category: String!, Discount: String!, DiscountType: Bool!){
        self.Barcode = Barcode
        self.Category = Category
        self.Discount = Discount
        self.DiscountType = DiscountType
    }
    
}

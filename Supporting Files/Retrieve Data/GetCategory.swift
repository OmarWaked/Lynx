//
//  getCategoryData.swift
//  Lynx
//
//  Created by Omar Waked on 9/18/18.
//  Copyright © 2018 WAKED. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

var noCoupons = Bool()

func getCategoryData(){
    database.collection("Category").getDocuments { (snapshot, error) in
        if error != nil {
            print(error as Any)
        }else{
            for document in (snapshot?.documents)! {
                let Category = document.data()["Name"] as! String
                categoriesArray.append(Category)
                
                storageReference.child("_Category Images/\(Category).jpg").downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error?.localizedDescription as Any)
                    }else{
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                            let imageData = UIImage(data: data!)
                            DispatchQueue.main.async {
                                categoryArray.append(getCategoryInfo.init(Category: Category, Image: imageData))
                                categoryArray.sort(by:{$0.Name < $1.Name})
                                NotificationCenter.default.post(name: NSNotification.Name("reloadHomeData"), object: nil)
                            }
                        }).resume()
                    }
                })
            }
        }
    }
}

func getSubcategories(){
    database.collection("Category").document(selectedCategory).getDocument { (snapshot, error) in
        if let document = snapshot {
            if document.exists{
                let Subcategory = document.data()!["Subcategories"] as! [String]
                couponSubcategoryArray = Subcategory
            }else{
                print(error as Any)
            }
        }
    }
}

func getSelectedCategoryData(SelectedCategory: String, FilterBrand: Bool, FilterItem: Bool, FilterBrandData: String, FilterItemData: String){
    let databaseURL = database.collection("Category").document(SelectedCategory).collection("Coupons").whereField("Coupon.Category", isEqualTo: SelectedCategory)
    let defaultImage = UIImage(named: "Default Image")
    
    if FilterBrand == true && FilterItem == false{
        databaseURL.whereField("Coupon.Brand", isEqualTo: FilterBrandData).getDocuments { (snapshot, error) in
            if error != nil {
                print(error as Any)
            }else{
                for document in (snapshot?.documents)! {
                    let Company = document.data()["Company"] as! [String:Any]
                    let CompanyName = Company["Name"] as! String
                    let CompanyCUID = Company["CUID"] as! String
                    
                    let Coupon = document.data()["Coupon"] as! [String:Any]
                    let Category = Coupon["Category"] as! String
                    let Subcategory = Coupon["Subcategory"] as! String
                    let Discount = Coupon["Discount"] as! String
                    let Expiration = Coupon["Expiration"] as! String
                    let Barcode = Coupon["Barcode"] as! String
                    let Brand = Coupon["Brand"] as! String
                    let Terms = Coupon["Terms"] as! String
                    let DiscountType = Coupon["Discount Type %"] as! Bool
                    let Name = Coupon["Name"] as! String
                    var imageR = storageReference.child("")
                    
                    if SelectedCategory.description == "Store-Specific" {
                        imageR = storageReference.child("\(SelectedCategory)/\(Brand).jpg")
                    }else{
                        imageR = storageReference.child("\(SelectedCategory)/\(Barcode).jpg")
                    }
                    
                    imageR.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error?.localizedDescription as Any)
                            appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: defaultImage!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                        }else{
                            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                                if error != nil {
                                    print(error?.localizedDescription as Any)
                                }else{
                                    let imageData = UIImage(data: data!)
                                    appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                                }
                            }).resume()
                        }
                    })
                }
            }
        }
    }else if FilterItem == true && FilterBrand == false{
        databaseURL.whereField("Coupon.Subcategory", isEqualTo: FilterItemData).getDocuments { (snapshot, error) in
            if error != nil {
                print(error as Any)
            }else{
                for document in (snapshot?.documents)! {
                    let Company = document.data()["Company"] as! [String:Any]
                    let CompanyName = Company["Name"] as! String
                    let CompanyCUID = Company["CUID"] as! String
                    
                    let Coupon = document.data()["Coupon"] as! [String:Any]
                    let Category = Coupon["Category"] as! String
                    let Subcategory = Coupon["Subcategory"] as! String
                    let Discount = Coupon["Discount"] as! String
                    let Expiration = Coupon["Expiration"] as! String
                    let Barcode = Coupon["Barcode"] as! String
                    let Brand = Coupon["Brand"] as! String
                    let Terms = Coupon["Terms"] as! String
                    let DiscountType = Coupon["Discount Type %"] as! Bool
                    let Name = Coupon["Name"] as! String
                    var imageR = storageReference.child("")
                    
                    if SelectedCategory.description == "Store-Specific" {
                        imageR = storageReference.child("\(SelectedCategory)/\(Brand).jpg")
                    }else{
                        imageR = storageReference.child("\(SelectedCategory)/\(Barcode).jpg")
                    }
                    
                    imageR.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error?.localizedDescription as Any)
                            appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: defaultImage!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                        }else{
                            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                                if error != nil {
                                    print(error?.localizedDescription as Any)
                                }else{
                                    let imageData = UIImage(data: data!)
                                    appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                                }
                            }).resume()
                        }
                    })
                }
            }
        }
    }else if FilterItem == true && FilterBrand == true{
        databaseURL.whereField("Coupon.Brand", isEqualTo: FilterBrandData).whereField("Coupon.Subcategory", isEqualTo: FilterItemData).getDocuments { (snapshot, error) in
            if error != nil {
                print(error as Any)
            }else{
                for document in (snapshot?.documents)! {
                    let Company = document.data()["Company"] as! [String:Any]
                    let CompanyName = Company["Name"] as! String
                    let CompanyCUID = Company["CUID"] as! String
                    
                    let Coupon = document.data()["Coupon"] as! [String:Any]
                    let Category = Coupon["Category"] as! String
                    let Subcategory = Coupon["Subcategory"] as! String
                    let Discount = Coupon["Discount"] as! String
                    let Expiration = Coupon["Expiration"] as! String
                    let Barcode = Coupon["Barcode"] as! String
                    let Brand = Coupon["Brand"] as! String
                    let Terms = Coupon["Terms"] as! String
                    let DiscountType = Coupon["Discount Type %"] as! Bool
                    let Name = Coupon["Name"] as! String
                    var imageR = storageReference.child("")
                    
                    if SelectedCategory.description == "Store-Specific" {
                        imageR = storageReference.child("\(SelectedCategory)/\(Brand).jpg")
                    }else{
                        imageR = storageReference.child("\(SelectedCategory)/\(Barcode).jpg")
                    }
                    
                    imageR.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error?.localizedDescription as Any)
                            appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: defaultImage!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                        }else{
                            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                                if error != nil {
                                    print(error?.localizedDescription as Any)
                                }else{
                                    let imageData = UIImage(data: data!)
                                    appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                                }
                            }).resume()
                        }
                    })
                }
            }
        }
    }else{
        databaseURL.getDocuments { (snapshot, error) in
            if error != nil {
                print(error as Any)
            }else{
                if snapshot?.count == 0 {
                    noCoupons = true
                    NotificationCenter.default.post(name: NSNotification.Name("reloadRelatedCoupons"), object: nil)
                }else{
                    for document in (snapshot?.documents)! {
                        noCoupons = false
                        let Company = document.data()["Company"] as! [String:Any]
                        let CompanyName = Company["Name"] as! String
                        let CompanyCUID = Company["CUID"] as! String
                        
                        let Coupon = document.data()["Coupon"] as! [String:Any]
                        let Category = Coupon["Category"] as! String
                        let Subcategory = Coupon["Subcategory"] as! String
                        let Discount = Coupon["Discount"] as! String
                        let Expiration = Coupon["Expiration"] as! String
                        let Barcode = Coupon["Barcode"] as! String
                        let Brand = Coupon["Brand"] as! String
                        let Terms = Coupon["Terms"] as! String
                        let DiscountType = Coupon["Discount Type %"] as! Bool
                        let Name = Coupon["Name"] as! String
                        var imageR = storageReference.child("")
                        
                        if SelectedCategory == "Store-Specific" {
                            imageR = storageReference.child("\(SelectedCategory)/\(Brand).jpg")
                        }else{
                            imageR = storageReference.child("\(SelectedCategory)/\(Barcode).jpg")
                        }
                        
                        imageR.downloadURL(completion: { (url, error) in
                            if error != nil {
                                print(error?.localizedDescription as Any)
                                appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: defaultImage!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                            }else{
                                URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                                    if error != nil {
                                        print(error?.localizedDescription as Any)
                                    }else{
                                        let imageData = UIImage(data: data!)
                                        appendToCouponArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
                                    }
                                }).resume()
                            }
                        })
                    }
                }
            }
        }
    }
}


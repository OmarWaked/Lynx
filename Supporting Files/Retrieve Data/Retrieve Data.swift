//
//  Retrieve Data.swift
//  C4ME
//
//  Created by Omar Waked on 7/13/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

func appendToCouponArray(Brand: String, Name: String, Category: String, Subcategory: String, Discount: String, Image: UIImage, Expires: String, Barcode: String, Terms: String, DiscountType: Bool, CompanyName: String, CompanyCUID: String){
    let checkDate = Date(fromString: Expires, format: DateFormatType.isoDate)!
    DispatchQueue.main.async {
        if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == false{
            if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture) {
                couponArray.append(getCouponData.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: Image, Expires: Expires, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID))
                couponBrandArray.append(Brand)
                NotificationCenter.default.post(name: NSNotification.Name("reloadCouponArray"), object: nil)
            }
        }else{
            couponArray.append(getCouponData.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: Image, Expires: Expires, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID))
            couponBrandArray.append(Brand)
            NotificationCenter.default.post(name: NSNotification.Name("reloadCouponArray"), object: nil)
        }
    }
}

func getRelatedCouponData(SelectedCategory: String, SelectedSubcategory: String){
    database.collection("Category").document(SelectedCategory).collection("Coupons").whereField("Coupon.Subcategory", isEqualTo: SelectedSubcategory).limit(to: 4).getDocuments { (snapshot, error) in
        if error != nil {
            print(error as Any)
        }else{
            for document in (snapshot?.documents)! {
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
                let checkDate = Date(fromString: Expiration, format: DateFormatType.isoDate)!
                
                storageReference.child("\(couponPassCategory)/\(Barcode).jpg").downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error?.localizedDescription as Any)
                    }else{
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                            if error != nil {
                                print(error?.localizedDescription as Any)
                            }else{
                                let imageData = UIImage(data: data!)
                                DispatchQueue.main.async {
                                    if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == true {
                                        relatedCouponArray.append(findRelatedCoupons.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType))
                                        if let i = (relatedCouponArray.index {$0.Brand == Brand && $0.Name == Name && $0.Category == Category && $0.Subcategory == Subcategory && $0.Discount == Discount && $0.Expiration == Expiration && $0.Terms == Terms && $0.Barcode == couponPassBarcode}) {
                                            relatedCouponArray.remove(at: i)
                                        }
                                    }else{
                                        if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
                                            relatedCouponArray.append(findRelatedCoupons.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType))
                                            if let i = (relatedCouponArray.index {$0.Brand == Brand && $0.Name == Name && $0.Category == Category && $0.Subcategory == Subcategory && $0.Discount == Discount && $0.Expiration == Expiration && $0.Terms == Terms && $0.Barcode == couponPassBarcode}) {
                                                relatedCouponArray.remove(at: i)
                                            }
                                        }
                                    }
                                    NotificationCenter.default.post(name: NSNotification.Name("reloadRelatedCoupons"), object: nil)
                                }
                            }
                        }).resume()
                    }
                })
            }
        }
    }
}

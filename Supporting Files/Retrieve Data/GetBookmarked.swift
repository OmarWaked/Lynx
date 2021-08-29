//
//  getBookmarkedData.swift
//  Lynx
//
//  Created by Omar Waked on 9/18/18.
//  Copyright © 2018 WAKED. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

func getBookmarkData(){
    database.collection("Users").document(currentUserUUID!).collection("Bookmarks").addSnapshotListener({ (querySnapshot, error) in
        guard let snapshot = querySnapshot else {
            print("Error fetching snapshots: \(error!)")
            return
        }
        snapshot.documentChanges.forEach { event in
            let Coupon = event.document.data()["Coupon"] as! [String:Any]
            let Barcode = Coupon["Barcode"] as! String
            let Category = Coupon["Category"] as! String
            let Subcategory = Coupon["Subcategory"] as! String

            if (event.type == .added) {
                getBookmarkItems(Category: Category, Subcategory: Subcategory, Barcode: Barcode)
            }
            
            if (event.type == .modified){
                if let i = (bookmarkedArray.index {$0.Category == Category && $0.Subcategory == Subcategory && $0.Barcode == Barcode}) {
                    bookmarkedArray.remove(at: i)
                    getBookmarkItems(Category: Category, Subcategory: Subcategory, Barcode: Barcode)
                }
            }
            
            if (event.type == .removed){
                if let i = (bookmarkedArray.index {$0.Category == Category && $0.Subcategory == Subcategory && $0.Barcode == Barcode}) {
                    bookmarkedArray.remove(at: i)
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("reloadBookmarkedArray"), object: nil)
        }
    })
}



func getBookmarkItems(Category: String, Subcategory: String, Barcode: String){
    database.collection("Category").document(Category).collection("Coupons").whereField("Coupon.Subcategory", isEqualTo: Subcategory).whereField("Coupon.Barcode", isEqualTo: Barcode).getDocuments { (snapshot, error) in
        if error != nil {
            print(error as Any)
        }else{
            for document in (snapshot?.documents)! {
                let Coupon = document.data()["Coupon"] as! [String:Any]
                let Discount = Coupon["Discount"] as! String
                let Expiration = Coupon["Expiration"] as! String
                let Brand = Coupon["Brand"] as! String
                let Terms = Coupon["Terms"] as! String
                let DiscountType = Coupon["Discount Type %"] as! Bool
                let Name = Coupon["Name"] as! String
                let checkDate = Date(fromString: Expiration, format: DateFormatType.isoDate)!
                
                storageReference.child("\(Category)/\(Barcode).jpg").downloadURL(completion: { (url, error) in
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
                                        bookmarkedArray.append(bookmarkedItemInfo.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType))
                                    }else{
                                        if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
                                             bookmarkedArray.append(bookmarkedItemInfo.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType))
                                        }
                                    }
                                    NotificationCenter.default.post(name: NSNotification.Name("reloadBookmarkedArray"), object: nil)
                                }
                            }
                        }).resume()
                    }
                })
            }
        }
    }
}


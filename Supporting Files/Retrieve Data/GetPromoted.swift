//
//  GetPromotedData.swift
//  Lynx
//
//  Created by Omar Waked on 9/18/18.
//  Copyright © 2018 WAKED. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

func getPromotedData(){
    database.collection("Promoted").addSnapshotListener({ (querySnapshot, error) in
        guard let snapshot = querySnapshot else {
            print("Error fetching snapshots: \(error!)")
            return
        }
        snapshot.documentChanges.forEach { event in
            let Name = event.document.data()["Item Name"] as! String
            let Category = event.document.data()["Item Category"] as! String
            let Subcategory = event.document.data()["Item Subcategory"] as! String
            let Discount = event.document.data()["Item Discount"] as! String
            let Expiration = event.document.data()["Item Expiration"] as! String
            let Barcode = event.document.data()["Item Barcode"] as! String
            let Brand = event.document.data()["Item Brand"] as! String
            let Terms = event.document.data()["Item Terms"] as! String
            let DiscountType = event.document.data()["Item Discount Type %"] as? Bool
            
            if (event.type == .added) {
                storageReference.child("_Promoted/\(Barcode).jpg").downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error?.localizedDescription as Any)
                    }else{
                        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                            if error != nil {
                                print(error?.localizedDescription as Any)
                            }else{
                                let imageData = UIImage(data: data!)
                                DispatchQueue.main.async {
                                    promotedCouponArray.append(trendingCoupons(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType))
                                    promotedBrandArray.append(Brand)
                                    promotedSubcategoryArray.append(Subcategory)
                                }
                            }
                        }).resume()
                    }
                })
            }
            
            if (event.type == .modified){
                if let i = (promotedCouponArray.index {$0.Brand == Brand && $0.Name == Name && $0.Category == Category && $0.Subcategory == Subcategory && $0.Barcode == Barcode}) {
                    promotedCouponArray[i].Discount = Discount
                    promotedCouponArray[i].DiscountType = DiscountType
                    promotedCouponArray[i].Expiration = Expiration
                    promotedCouponArray[i].Terms = Terms
                    promotedCouponArray[i].Barcode = Barcode
                }
            }
            
            if (event.type == .removed){
                if let i = (promotedCouponArray.index {$0.Brand == Brand && $0.Name == Name && $0.Category == Category && $0.Subcategory == Subcategory || $0.Discount != Discount || $0.Expiration != Expiration || $0.Terms != Terms || $0.Barcode != Barcode}) {
                    promotedCouponArray.remove(at: i)
                    promotedBrandArray.remove(at: i)
                    promotedSubcategoryArray.remove(at: i)
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name("reloadHomeData"), object: nil)
        }
    })
}

//
//  HomeScreenExtension.swift
//  C4ME
//
//  Created by Omar Waked on 6/18/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import BarcodeScanner

extension HomeScreen: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
//    
//    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
//        print("Barcode Data: \(code)")
//        print("Symbology Type: \(type)")
//        
//        for category in categoriesArray {
//            database.collection("Category").document(category).collection("Coupons").document(code).getDocument { (snapshot, error) in
//                if let document = snapshot {
//                    let Coupon = document.data()!["Coupon"] as! [String: Any]
//                    let databaseItemCode = Coupon["Barcode"] as? String
//                    if document.exists && databaseItemCode == code {
//                        
//                        couponPassBrand = Coupon["Brand"] as! String
//                        couponPassName = Coupon["Name"] as! String
//                        couponPassDiscount = Coupon["Discount"] as! String
//                        couponPassExpiration = Coupon["Expiration"] as! String
//                        couponPassCategory = Coupon["Category"] as! String
//                        couponPassSubcategory = Coupon["Subcategory"] as! String
//                        couponPassDiscountType = Coupon["Discount Type %"] as! Bool
//                        couponPassTerms = Coupon["Terms"] as! String
//                        couponPassBarcode = code
//                        
//                        getRelatedCouponData(SelectedCategory: couponPassCategory, SelectedSubcategory: couponPassSubcategory)
//                        
//                        var imageR = storageReference.child("")
//                        
//                        if couponPassCategory == "Store-Specific" {
//                            imageR = storageReference.child("\(couponPassCategory)/\(couponPassBrand).jpg")
//                        }else{
//                            imageR = storageReference.child("\(couponPassCategory)/\(couponPassBarcode).jpg")
//                        }
//                        
//                        imageR.downloadURL(completion: { (url, error) in
//                            if error != nil {
//                                print(error?.localizedDescription as Any)
//                            }else{
//                                URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//                                    let imageData = UIImage(data: data!)
//                                    DispatchQueue.main.async {
//                                        couponPassImage = imageData!
//                                        NotificationCenter.default.post(name: NSNotification.Name("reloadRelatedCoupons"), object: nil)
//                                    }
//                                }).resume()
//                            }
//                            controller.show(CouponInfo(), sender: self)
//                        })
//                    }else{
//                        controller.resetWithError()
//                    }
//                }
//            }
//        }
//        /*
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//            controller.resetWithError()
//        }
//        */
//    }
//
//    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
//        print(error)
//        controller.resetWithError()
//    }
//    
//    @objc func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//
//
//    func snapToNearestCell(_ collectionView: UICollectionView) {
//        for i in 0..<featuredCollectionView.numberOfItems(inSection: 0) {
//            let itemWithSpaceWidth = featuredLayout.itemSize.width + featuredLayout.minimumLineSpacing
//            let itemWidth = featuredLayout.itemSize.width
//            if featuredCollectionView.contentOffset.x <= CGFloat(i) * itemWithSpaceWidth + itemWidth / 2 {
//                let indexPath = IndexPath(item: i, section: 0)
//                featuredCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//                break
//            }
//        }
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        snapToNearestCell(scrollView as! UICollectionView)
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        snapToNearestCell(scrollView as! UICollectionView)
//    }

}

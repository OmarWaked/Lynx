//
//  SearchDatabase.swift
//  C4ME
//
//  Created by Omar Waked on 8/27/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit
import Firebase

typealias CompletionHandler = (_ success:Bool) -> Void

extension transactionView {
    
    @objc func startTransaction(){
        UIView.animate(withDuration: 0.4, animations: {
            self.setupTransaction()
        })
    }
    
    func completeTransaction() {
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.pushViewController(CompletedTransactionView(), animated: false)
        }
    }
    
    func detachListener() {
        let listener = database.collection("Users").document(currentUserUUID!).collection("Transactions").addSnapshotListener { querySnapshot, error in
            if error != nil{
                print(error as Any)
            }
        }
        listener.remove()
    }
    
    func updateCart(){
        
/*
        functions.httpsCallable("searchForTransaction").call(["UUID": currentUserUUID!, "EMAIL": currentUserEmail, "NAME": currentUserName]) { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    functionError = true
                    let message = error.localizedDescription
                    errorMessage = "\(message)"
                }
                functionError = true
                let alert = createAlert(Title: errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
                self.present(alert, animated: false, completion: nil)
            }else{
                functionError = false
                let Status = (result?.data as? [String: Any])?["Active"] as? Bool
                let Type = (result?.data as? [String: Any])?["Type"] as? Bool
                let Store = (result?.data as? [String: Any])?["Store"] as? String
                let TDate = (result?.data as? [String: Any])?["TDate"] as? String
                
                let alert = createAlert(Title: "Active: \(Status!), \nType: \(Type!), \nStore: \(Store!), \nDate:\(TDate!)", Message: "", Style: .alert, ButtonTitle: "Ok")
                self.present(alert, animated: false, completion: nil)
            }
        }
 */
         database.collection("Users").document(currentUserUUID!).collection("Transactions").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { event in
                let Active = event.document.data()["Active"] as? Bool
                let Type = event.document.data()["Instore"] as? Bool
                let Store = event.document.data()["Store"] as? String
                let TDate = event.document.data()["Date"] as? String
                
                if (Active == true) {
                    print("New Transaction at \(Store!) - (Instore location:\(Type!)) on \(TDate!)")
                    self.searchCart(Document: event.document.documentID)
                    self.DocumentID = event.document.documentID
                    self.startTransaction()
                }
                
                if (event.type == .modified && Active == false){
                    print("Transaction at \(Store!) - (Instore location:\(Type!)) on \(TDate!) is no longer active or has been finalized")
                    let updatedData = ["Total": "\(self.Total)","Saved": "\(self.Savings)"]
                    database.collection("Users").document(currentUserUUID!).collection("Transactions").document(event.document.documentID).setData(updatedData, merge: true)
                    self.completeTransaction()
                    self.DocumentID = " "
                    instoreCheckOutArray.removeAll()
                    transactionHistoryArray.removeAll()
                    getTransactionHistoryData()
                }
                NotificationCenter.default.post(name: NSNotification.Name("reloadTransactionView"), object: nil)
            }
        }
 
    }
    
    func searchCart(Document: String){
        database.collection("Users").document(currentUserUUID!).collection("Transactions").document(Document).collection("Cart").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { event in
                let Brand = event.document.data()["Brand"] as? String
                let Category = event.document.data()["Category"] as? String
                let Name = event.document.data()["Name"] as? String
                let Number = event.document.data()["Barcode"] as? String
                let Price = event.document.data()["Price"] as? String
                let Quantity = event.document.data()["Quantity"] as? String
                
                if (event.type == .added) {
                    print("New item: \(Brand!) - \(Name!)")
                    instoreCheckOutArray.append(checkOutArrayInfo(Brand: Brand, Name: Name, Number: Number, Price: Price, Quantity: Quantity, Category: Category))
                    self.Total += (Double(Price!)! * Double(Quantity!)!)
                    self.searchForCoupons(Barcode: Number!, ItemPrice: Price!)
                }
                
                if (event.type == .modified) {
                    print("Modified item: \(Brand!) - \(Name!)")
                    if let i = (instoreCheckOutArray.index {$0.Number == Number && $0.Brand == Brand && $0.Category == Category && $0.Name == Name || $0.Price != Price || $0.Quantity != Quantity}) {
                        instoreCheckOutArray[i].Price = Price
                        instoreCheckOutArray[i].Quantity = Quantity
                        self.Total -= (Double(instoreCheckOutArray[i].Price)! * Double(instoreCheckOutArray[i].Quantity)!)
                    }else if let x = (instoreCheckOutArray.index {$0.Number != Number && $0.Brand == Brand && $0.Category == Category && $0.Name == Name}) {
                        instoreCheckOutArray[x].Number = Number
                        self.Total -= (Double(instoreCheckOutArray[x].Price)! * Double(instoreCheckOutArray[x].Quantity)!)
                        //UPDATE SAVINGS DATA FOR ITEM
                    }
                    self.searchForCoupons(Barcode: Number!, ItemPrice: Price!)
                }
                
                if (event.type == .removed) {
                    print("Removed item: \(Brand!) - \(Name!)")
                    if let i = (instoreCheckOutArray.index { $0.Number == Number && $0.Brand == Brand && $0.Category == Category && $0.Quantity == Quantity && $0.Name == Name}) {
                        instoreCheckOutArray.remove(at: i)
                    }
                }
                NotificationCenter.default.post(name: NSNotification.Name("reloadTransactionView"), object: nil)
            }
        }
    }
    
    func searchForCoupons(Barcode: String, ItemPrice: String){
        for category in categoriesArray {
            database.collection("Category").document(category).collection("Coupons").whereField("Coupon.Barcode", isEqualTo: Barcode).getDocuments { (snapshot, error) in
                if error != nil {
                    print(error as Any)
                }else{
                    for document in (snapshot?.documents)! {
                        let Coupon = document.data()["Coupon"] as! [String: Any]
                        let Barcode = Coupon["Barcode"] as! String
                        let Category = Coupon["Category"] as! String
                        let Discount = Coupon["Discount"] as! String
                        let DiscountType = Coupon["Discount Type %"] as! Bool
                        self.applicableCoupon.append(applicableCoupons.init(Barcode: Barcode, Category: Category, Discount: Discount, DiscountType: DiscountType))
                    }
                    NotificationCenter.default.post(name: NSNotification.Name("reloadTransactionView"), object: nil)
                }
            }
        }
    }
    
    
    func getUserData(){
        database.collection("Users").whereField("Email", isEqualTo: currentUserEmail!).getDocuments { (snapshot, error) in
            if error != nil {
                print("ERROR: \(error as Any)")
            }else{
                for document in (snapshot?.documents)! {
                    if let MemberUUID = document.data()["UUID"] as? String {
                        self.userScanImage.image = codeGenerator.barcode(code: MemberUUID, type: .qrcode, size: CGSize(width: 120, height:120))
                        self.memberNumberLabel.text = MemberUUID
                        self.userIDLabel.text = MemberUUID
                    }
                    if let MemberName = document.data()["Name"] as? String {
                        self.usernameLabel.text = MemberName
                    }else{
                        self.usernameLabel.text = "Username"
                    }
                }
            }
        }
    }
}


/*
 //UPDATE SAVINGS CODE (CREATE FUNCTION)
 if applicableCoupon[x].DiscountType == "$"{
 self.Savings -= (Double(instoreCheckOutArray[x].Price)! - Double(applicableCoupon[indexPath.row].Discount)!)
 }else{
 self.Savings -= (Double(instoreCheckOutArray[x].Price)! - (Double(instoreCheckOutArray[x].Price)! * ((Double(applicableCoupon[indexPath.row].Discount)! * 0.01))))
 }
 */




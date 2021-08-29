//
//  getTransactionHistoryData.swift
//  Lynx
//
//  Created by Omar Waked on 9/18/18.
//  Copyright © 2018 WAKED. All rights reserved.
//

import Foundation
import Firebase
import AFDateHelper

func getTransactionHistoryData(){
    database.collection("Users").document(currentUserUUID!).collection("Transactions").getDocuments { (snapshot, error) in
        if error != nil {
            print(error as Any)
        }else{
            for document in (snapshot?.documents)! {
                let Date = document.data()["Date"] as! String
                let Store = document.data()["Store"] as! String
                let Type = document.data()["Instore"] as! Bool
                let Total = document.data()["Total"] as! String
                let Saved = document.data()["Saved"] as! String
                let DocumentID = document.documentID
                var Location = String()
                let Items = document.data()["Items"] as! String
                
                if Type == false{
                    Location = "Online"
                }else{
                    Location = "Instore"
                }
                
                purchaseHistoryArray.append(purchaseHistory(Document: DocumentID, Store: Store, Date: Date, Instore: Type, Location: Location, Total: Total, Saved: Saved, Items: Items))
                NotificationCenter.default.post(name: NSNotification.Name("reloadHistoryDetailed"), object: nil)
            }
        }
    }
}

func getTransactionDetials(Document: String){
    let appliedCoupons = [String]()
    database.collection("Users").document(currentUserUUID!).collection("Transactions").document(Document).getDocument { (snapshot, error) in
        if let document = snapshot {
            if document.exists{
                let Coupons = document.data()!["Coupons"] as! [String]
                print(Coupons)
            }
        }
    }
    
    database.collection("Users").document(currentUserUUID!).collection("Transactions").document(Document).collection("Cart").getDocuments { (snapshot, error) in
        if error != nil {
            print(error as Any)
        }else{
            for document in (snapshot?.documents)! {
                let Brand = document.data()["Brand"] as! String
                let Barcode = document.data()["Barcode"] as! String
                let Name = document.data()["Name"] as! String
                let Price = document.data()["Price"] as! String
                let Quantity = document.data()["Quantity"] as! String
                
                transactionHistoryArray.append(purchaseHistoryDetails(Barcode: Barcode, Brand: Brand, Name: Name, Price: Price, Quantity: Quantity))
                NotificationCenter.default.post(name: NSNotification.Name("reloadHistoryDetailed"), object: nil)
            }
        }
    }
}

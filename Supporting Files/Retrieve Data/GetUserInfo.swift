//
//  GetUserInfo.swift
//  Lynx
//
//  Created by Omar Waked on 9/19/18.
//  Copyright © 2018 WAKED. All rights reserved.
//

import Foundation
import Firebase

func getUserData(){
    if Auth.auth().currentUser != nil && Auth.auth().currentUser?.isEmailVerified == true && (Auth.auth().currentUser?.uid == currentUserUUID! && Auth.auth().currentUser?.email == currentUserEmail) {
        database.collection("Users").whereField("UUID", isEqualTo: currentUserUUID!).getDocuments { (snapshot, error) in
            if error != nil{
                print(error as Any)
            }else{
                for document in (snapshot?.documents)! {
                    currentUserName = document.data()["Name"] as! String
                }
            }
        }
    }
}

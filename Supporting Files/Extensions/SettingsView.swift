//
//  SettingsViewExtension.swift
//  C4ME
//
//  Created by Omar Waked on 6/18/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import MessageUI
import UIKit

extension SettingsView: MFMailComposeViewControllerDelegate {
//    func emailSupport() {
//        let database = Firestore.firestore()
//        let currentUserEmail = Auth.auth().currentUser?.email
//        let composeVC = MFMailComposeViewController()
//        let model = UIDevice.current.model
//        let systemVersion = UIDevice.current.systemVersion
//        database.collection("User").whereField("Email", isEqualTo: currentUserEmail!).getDocuments { (snapshot, error) in
//            if error != nil {
//                let alertController = UIAlertController(title: error?.localizedDescription, message: "", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//            }else{
//                for document in (snapshot?.documents)! {
//                    if let MemberUUID = document.data()["UUID"] as? String {
//                        composeVC.mailComposeDelegate = self
//                        composeVC.setToRecipients(["wakedapps@gmail.com"])
//                        composeVC.setSubject("Support Request")
//                        composeVC.setMessageBody("</br></br></br></br> User Email: \(currentUserEmail!) </br> Member ID: \(MemberUUID) </br> System Version: \(systemVersion) </br> Device: \(model) ", isHTML: true)
//                        self.present(composeVC, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
//    }
//    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//    
//    
//    func FAQ(){
//        webLink = "https://wakedapps.com/FAQ.html"
//        webViewLabel = "FAQ"
//        openWebView()
//    }
//    
//    func privacyPolicy(){
//        webLink = "https://wakedapps.com/Privacy_policy.html"
//        webViewLabel = "Privacy Policy"
//        openWebView()
//    }
//    
//    func terms(){
//        webLink = "https://wakedapps.com/Terms.html"
//        webViewLabel = "Terms"
//        openWebView()
//    }
//    
//    func supportView(){
//        webLink = "https://wakedapps.com/C4Me_support.html"
//        webViewLabel = "Support Request"
//        openWebView()
//    }
//    
//    func accountSettings(){
//        self.navigationController?.pushViewController(AccountViewController(), animated: false)
//        self.tabBarController?.tabBar.isHidden = true
//    }
//
//    func editPreferences(){
//        self.navigationController?.pushViewController(PreferencesViewController(), animated: false)
//        self.tabBarController?.tabBar.isHidden = true
//    }
//    
//    func openWebView(){
//        let webView = UINavigationController(rootViewController: webViewScreen())
//        self.navigationController?.present(webView, animated: false, completion: nil)
//    }
    
}

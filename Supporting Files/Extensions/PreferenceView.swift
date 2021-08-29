//
//  PreferenceViewExtension.swift
//  C4ME
//
//  Created by Omar Waked on 6/18/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit

extension PreferencesViewController{
//    
//    @objc func toggleNightMode(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "NIGHTMODE")
//            NightNight.theme = .night
//            UIApplication.shared.statusBarStyle = .lightContent
//            UITabBar.appearance().barTintColor = UIColor.black
//            UITabBar.appearance().tintColor = UIColor.white
//            if UIApplication.shared.supportsAlternateIcons {
//                 UIApplication.shared.setAlternateIconName(nil)
//            }
//            guard let currentView = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.view,
//                let superview = currentView.superview else { return }
//            currentView.removeFromSuperview()
//            superview.addSubview(currentView)
//        }else{
//            userDefaults.set(false, forKey: "NIGHTMODE")
//            NightNight.theme = .normal
//            UIApplication.shared.statusBarStyle = .default
//            UITabBar.appearance().barTintColor = UIColor.white
//            UITabBar.appearance().tintColor = UIColor.black
//            if UIApplication.shared.supportsAlternateIcons {
//                UIApplication.shared.setAlternateIconName("AlternateIcon") { error in
//                    if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//            guard let currentView = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.view,
//                let superview = currentView.superview else { return }
//            currentView.removeFromSuperview()
//            superview.addSubview(currentView)
//        }
//        
//    }
//
//    
//    @objc func toggleAllNotifications(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "NOTIFICATIONS")
//            UIApplication.shared.registerForRemoteNotifications()
//        }else{
//            userDefaults.set(false, forKey: "NOTIFICATIONS")
//            UIApplication.shared.unregisterForRemoteNotifications()
//        }
//    }
//    
//    @objc func recieveEmailUpdates(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "EMAILUPDATES")
//        }else{
//            userDefaults.set(false, forKey: "EMAILUPDATES")
//        }
//    }
//    
//    @objc func displayExpiredCoupons(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "SHOWEXPIREDCOUPONS")
//        }else{
//            userDefaults.set(false, forKey: "SHOWEXPIREDCOUPONS")
//        }
//    }
//    
//    @objc func applyBestDeal(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "APPLYBESTDEAL")
//        }else{
//            userDefaults.set(false, forKey: "APPLYBESTDEAL")
//        }
//    }
//    
//    @objc func suggestCoupons(sender: UISwitch){
//        if sender.isOn == true {
//            userDefaults.set(true, forKey: "SUGGESTCOUPONS")
//        }else{
//            userDefaults.set(false, forKey: "SUGGESTCOUPONS")
//        }
//    }
//    
}

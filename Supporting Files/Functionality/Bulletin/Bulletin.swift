/**
 *  BulletinBoard
 *  Copyright (c) 2017 - present Alexis Aubry. Licensed under the MIT license.
 */

import UIKit
import BLTNBoard
import SafariServices
import NightNight
import Firebase

enum BulletinDataSource {

    static func makeItemInfoPage() -> BLTNPageItem {
        let page = FeedbackPageBLTNItem(title: brandDetail)
        page.descriptionText = "\(itemDetail) \n\(priceDetail) \n\(quantityDetail)"
        page.requiresCloseButton = true
        page.isDismissable = true
        
        return page
    }
    
    static func makeIntroPage() -> FeedbackPageBLTNItem {
        let page = FeedbackPageBLTNItem(title: "Welcome to \nLynx.")
        page.image = UIImage(named: "Logo")
        page.descriptionText = "Saving money. Effortlessly."
        page.actionButtonTitle = "Configure"
        page.isDismissable = false
        
        page.actionHandler = { item in
            item.manager?.displayNextItem()
        }
        
        page.next = makeApperancePage()
        
        return page
    }
    
    static func makeApperancePage() -> BLTNPageItem {
        let page = FeedbackPageBLTNItem(title: "Select Mode")
        page.descriptionText = "Select your preferred theme.\nYou can change all the following preferrenses later in the preferences tab."
        page.requiresCloseButton = false
        page.isDismissable = false
        page.actionButtonTitle = "Dark Mode"
        page.alternativeButtonTitle = "Light Mode"
        
        page.actionHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(true, forKey: "NIGHTMODE")
            NightNight.theme = .night
            if UIApplication.shared.supportsAlternateIcons {
                UIApplication.shared.setAlternateIconName(nil)
            }
            UIApplication.shared.statusBarStyle = .lightContent
            NotificationCenter.default.post(name: NSNotification.Name("reloadStartView"), object: nil)
        }
        
        page.alternativeHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(false, forKey: "NIGHTMODE")
            NightNight.theme = .normal
            if UIApplication.shared.supportsAlternateIcons {
               UIApplication.shared.setAlternateIconName("AlternateIcon")
            }
            UIApplication.shared.statusBarStyle = .default
            NotificationCenter.default.post(name: NSNotification.Name("reloadStartView"), object: nil)
        }
        
        page.next = makeExpirationPage()
        
        return page
    }

    static func makeExpirationPage() -> BLTNPageItem {
        let page = FeedbackPageBLTNItem(title: "Expiration")
        page.descriptionText = "Show coupons that are expired."
        page.image = UIImage(named: "Expiration")
        page.requiresCloseButton = false
        page.isDismissable = false
        page.actionButtonTitle = "Show"
        page.alternativeButtonTitle = "Hide"
        
        page.actionHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(true, forKey: "SHOWEXPIREDCOUPONS")
        }
        
        page.alternativeHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(false, forKey: "SHOWEXPIREDCOUPONS")
        }
        
        page.next = makeDealPage()
        
        return page
    }
    
    static func makeDealPage() -> BLTNPageItem {
        let page = FeedbackPageBLTNItem(title: "Deal")
        page.descriptionText = "Apply best deal combination."
        page.image = UIImage(named: "Deal")
        page.requiresCloseButton = false
        page.isDismissable = false
        page.actionButtonTitle = "Enable"
        page.alternativeButtonTitle = "Not now"
        
        page.actionHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(true, forKey: "APPLYBESTDEAL")
        }
        
        page.alternativeHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(false, forKey: "APPLYBESTDEAL")
        }
        
        page.next = makeNotitificationsPage()
        
        return page
    }
    
    static func makeNotitificationsPage() -> FeedbackPageBLTNItem {
        let page = FeedbackPageBLTNItem(title: "Push Notifications")
        page.image = UIImage(named: "Notification")
        page.descriptionText = "Receive notifications when a new feature is realesed or relevant coupons are added."
        page.actionButtonTitle = "Enable"
        page.alternativeButtonTitle = "Not now"
        page.isDismissable = false
        
        page.actionHandler = { item in
            PermissionsManager.shared.requestLocalNotifications()
            item.manager?.displayNextItem()
            userDefaults.set(true, forKey: "NOTIFICATIONS")
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        page.alternativeHandler = { item in
            item.manager?.displayNextItem()
            userDefaults.set(false, forKey: "NOTIFICATIONS")
            UIApplication.shared.unregisterForRemoteNotifications()
        }
        
        page.next = makeLocationPage()
        
        return page
        
    }
    
    static func makeLocationPage() -> FeedbackPageBLTNItem {
        let page = FeedbackPageBLTNItem(title: "Customize Feed")
        page.image = UIImage(named: "Location")
        page.descriptionText = "Display coupons relevent to you and exclude those that don't apply in your location."
        page.actionButtonTitle = "Enable"
        page.alternativeButtonTitle = "Not now"
        page.isDismissable = false
        
        page.actionHandler = { item in
            PermissionsManager.shared.requestWhenInUseLocation()
            item.manager?.displayNextItem()
        }
        
        page.alternativeHandler = { item in
            item.manager?.displayNextItem()
        }
        
        page.next = makeCompletionPage()
        
        return page
        
    }
    
    
    static func makeCompletionPage() -> BLTNPageItem {
        let page = BLTNPageItem(title: "Setup Completed")
        page.image = UIImage(named: "Completion")
        page.appearance.actionButtonColor = UIColor.green
        page.appearance.imageViewTintColor = UIColor.green
        page.appearance.actionButtonTitleColor = .white
        page.descriptionText = "Lynx is ready for you to use."
        page.actionButtonTitle = "Get started"
        page.isDismissable = true
        
        page.actionHandler = { item in
            item.manager?.dismissBulletin(animated: true)
        }
        
        return page
    }
    
    
    static func makeEmailPage() -> TextFieldBulletinPage {
        let page = TextFieldBulletinPage(title: "Enter an Email")
        page.isDismissable = true
        page.requiresCloseButton = true
        page.descriptionText = "Enter the email address you wish to recieve a copy of your transaction history."
        page.actionButtonTitle = "Send"

        
        page.textInputHandler = { (item, text) in
            if functionError == true {
                let errorPage = self.makeErrorPage()
                page.manager?.push(item: errorPage)
            }else{
                let completionPage = self.makeSentPage(userName: text)
                item.manager?.push(item: completionPage)
            }
        }
        
        return page
    }

    static func makeSentPage(userName: String?) -> BLTNPageItem {
        let page = BLTNPageItem(title: "Sent")
        page.image = UIImage(named: "Completion")
        page.appearance.actionButtonColor = UIColor.green
        page.appearance.actionButtonTitleColor = .white
        page.descriptionText = "An email will be sent to \(userName!) with a copy of your transaction history."
        page.actionButtonTitle = "Finish"
        page.isDismissable = true
        page.requiresCloseButton = false
        
        page.actionHandler = { item in
            item.manager?.dismissBulletin(animated: true)
        }
        
        return page
    }
    
    static func makeErrorPage() -> BLTNPageItem {
        let page = BLTNPageItem(title: "Error")
        page.image = UIImage(named: "Error")
        page.appearance.actionButtonColor = UIColor.red
        page.appearance.actionButtonTitleColor = .white
        page.descriptionText = errorMessage
        page.actionButtonTitle = "Close"
        page.isDismissable = true
        page.requiresCloseButton = false
        
        page.actionHandler = { item in
            item.manager?.dismissBulletin(animated: true)
        }
        
        return page
    }
}


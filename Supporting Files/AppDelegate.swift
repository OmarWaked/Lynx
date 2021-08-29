//
//  AppDelegate.swift
//  C4ME
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import Fabric
import Crashlytics
import iRate
import Siren
import AVFoundation
import Alamofire
import UserNotifications
import NightNight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        FirebaseApp.configure()
        delegateFunctions()
        settings.areTimestampsInSnapshotsEnabled = true
        database.settings = settings
        return true
    }
    
    
    @objc func tokenRefreshNotification(notification: NSNotification) {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        if userDefaults.bool(forKey: "NIGHTMODE") == true {
            NightNight.theme = NightNight.Theme.night
            UIApplication.shared.statusBarStyle = .lightContent
        }else{
            NightNight.theme = NightNight.Theme.normal
            UIApplication.shared.statusBarStyle = .default
        }
    }

}

extension AppDelegate {
    
    func delegateFunctions(){
        setupRating()
        forceAppUpdate()
        checkConnection()
    }
    
    func setupRating(){
        iRate.sharedInstance().daysUntilPrompt = 5
        iRate.sharedInstance().usesUntilPrompt = 25
        iRate.sharedInstance().previewMode = false
        iRate.sharedInstance().appStoreID = 1299541303
        iRate.sharedInstance().applicationBundleID = "Waked.C4ME"
        iRate.sharedInstance().onlyPromptIfLatestVersion = false
        iRate.sharedInstance().useSKStoreReviewControllerIfAvailable = false
        iRate.sharedInstance().promptForNewVersionIfUserRated = true
        iRate.sharedInstance().remindPeriod = 5
        iRate.sharedInstance().remindButtonLabel = "Remind Me Later"
    }
    
    func forceAppUpdate(){
        let siren = Siren.shared
        siren.checkVersion(checkType: .immediately)
        siren.alertType = .force
        siren.debugEnabled = true
    }
    
    func checkConnection(){
        DispatchQueue.main.async {
            if Connectivity.isConnectedToInternet {
                let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
                if launchedBefore{
                    if Auth.auth().currentUser != nil && Auth.auth().currentUser?.isEmailVerified == true && (Auth.auth().currentUser?.uid == currentUserUUID! && Auth.auth().currentUser?.email == currentUserEmail) {
                        self.window = UIWindow(frame: UIScreen.main.bounds)
                        self.window?.makeKeyAndVisible()
                        self.window!.rootViewController = TabBarViewController()
                        getBookmarkData()
                        getTransactionHistoryData()
                    }else{
                        let navigationController = UINavigationController(rootViewController: startView())
                        let window = UIWindow(frame: UIScreen.main.bounds)
                        window.rootViewController = navigationController
                        window.makeKeyAndVisible()
                        self.window = window
                    }
                    getPromotedData()
                    getCategoryData()
                }else{
                    print("First launch, setting UserDefault.")
                    userDefaults.set(true, forKey: "launchedBefore")
                    let navigationController = UINavigationController(rootViewController: startView())
                    let window = UIWindow(frame: UIScreen.main.bounds)
                    window.rootViewController = navigationController
                    window.makeKeyAndVisible()
                    self.window = window
                    getPromotedData()
                    getCategoryData()
                } 
            }else{
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.makeKeyAndVisible()
                self.window?.rootViewController = ConnectivityViewController()
            }
        }
    }
        
    
}

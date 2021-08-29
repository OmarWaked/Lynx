//
//  TabBarViewController.swift
//  C4ME
//
//  Created by Omar Waked on 6/27/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
        checkConnection()
        self.view.reloadInputViews()
        setNeedsFocusUpdate()
    }

    func initializeControllers(){
        let homeTab = HomeScreen()
        let transactionTab = transactionView()
        let bookmarkTab = BookmarkedView()
        let settingsTab = SettingsView()
        
        homeTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        transactionTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "transaction"), tag: 1)
        bookmarkTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "bookmark"), tag: 2)
        settingsTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "settings"), tag: 3)
        
        homeTab.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        transactionTab.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        bookmarkTab.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        settingsTab.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let views = [homeTab,transactionTab,bookmarkTab,settingsTab]
        setViewControllers(views, animated: false)
        
        let vc1 = UINavigationController(rootViewController: homeTab)
        let vc2 = UINavigationController(rootViewController: transactionTab)
        let vc3 = UINavigationController(rootViewController: bookmarkTab)
        let vc4 = UINavigationController(rootViewController: settingsTab)
        viewControllers = [vc1,vc2,vc3,vc4]
        
        UITabBar.appearance().tintColor = StandardContrastColor
        UITabBar.appearance().barTintColor = StandardViewColor
    }
 
}

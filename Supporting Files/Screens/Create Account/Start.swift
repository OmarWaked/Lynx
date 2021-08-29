//
//  StartView.swift
//  C4ME
//
//  Created by Omar Waked on 6/25/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import BLTNBoard


class startView: UIViewController {
//
//    let loginButton = createButton(Title: "Log In", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(login))
//    let createAccountButton = createButton(Title: "Sign Up", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(signup))
//    var currentBackground = (name: "Dimmed", style: BLTNBackgroundViewStyle.dimmed)
//    let backgroundStyles = BackgroundStyles()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadStartView(notification:)), name: NSNotification.Name(rawValue: "reloadStartView"), object: nil)
//        createScreenLayout()
//        if userDefaults.bool(forKey: "launchedBefore") == false {
//            showBulletin()
//        }
//    }
//
//    lazy var bulletinManager: BLTNItemManager = {
//        let page = BulletinDataSource.makeIntroPage()
//        return BLTNItemManager(rootItem: page)
//    }()
//
//    func showBulletin(){
//        self.bulletinManager.showBulletin(above: self)
//        bulletinManager.allowsSwipeInteraction = false
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//        view.setNeedsFocusUpdate()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        if NightNight.theme == .night {
//            self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributesWhite
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributesWhite
//            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(buttonAttributesWhite, for: UIControl.State())
//            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(buttonAttributesWhite, for: UIControl.State())
//        }else{
//            self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
//            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
//            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
//        }
//    }
//
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationItem.title = "Lynx"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.view.backgroundColor = .clear
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        view.addSubview(createAccountButton)
//        view.addSubview(loginButton)
//
//        createAccountButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        createAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        createAccountButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        createAccountButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//
//        loginButton.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -20).isActive = true
//        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        loginButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        loginButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//    }
//
//    @objc func login(){
//        self.navigationController?.pushViewController(LoginAccount(), animated: false)
//    }
//
//    @objc func signup(){
//        self.navigationController?.pushViewController(CreateAccount(), animated: false)
//    }
//
//    @objc func reloadStartView(notification: NSNotification) {
//        self.view.reloadInputViews()
//        self.updateViewConstraints()
//        setNeedsFocusUpdate()
//
//        if NightNight.theme == .night {
//            self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributesWhite
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributesWhite
//            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(buttonAttributesWhite, for: UIControl.State())
//            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(buttonAttributesWhite, for: UIControl.State())
//        }else{
//            self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
//            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
//            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
//        }
//    }
}

//
//  CompletedTransactionView.swift
//  C4ME
//
//  Created by Omar Waked on 8/31/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class CompletedTransactionView: UIViewController {
//    
//    let confimationLabel = createLabel(LabelText: "Transaction has been finalized. You can now view your cart items and other data under your account settings.", TextColor: StandardContrastColor, FontName: font, FontSize: 25, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createViewLayout()
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
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        self.view.needsUpdateConstraints()
//        checkConnection()
//    }
//    
//    func createViewLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        self.navigationItem.title = "Completed"
//        self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "Finish", Target: self, Action: #selector(self.closeView))
//        self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: " ", Target: nil, Action: nil)
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        view.addSubview(confimationLabel)
//        
//        confimationLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
//        confimationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        confimationLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//    }
//    
//    @objc func closeView(){
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.navigationController?.pushViewController(transactionView(), animated: false)
//            self.tabBarController?.tabBar.isHidden = false
//        })
//    }
//    
    
}

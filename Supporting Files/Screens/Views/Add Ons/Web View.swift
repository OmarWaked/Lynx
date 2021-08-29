//
//  webView.swift
//  C4ME
//
//  Created by Omar Waked on 6/18/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit

class webViewScreen: UIViewController, UIWebViewDelegate{
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createScreenLayout()
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
//        checkConnection()
//    }
//
//    func createScreenLayout(){
//        self.navigationItem.title = webViewLabel
//        self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView(gesture:)))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        let webView: UIWebView = {
//            let view = UIWebView()
//            view.scrollView.contentInset = UIEdgeInsets.zero
//            view.mixedBackgroundColor = StandardViewColor
//            let url = NSURL(string: webLink)! as URL
//            view.loadRequest(URLRequest(url: url))
//            view.delegate = self
//            return view
//        }()
//
//        webView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (UITabBar.appearance().frame.height + statusBarRef.height))
//        view.addSubview(webView)
//    }
//
//    @objc func openWebsite(){
//        let url = NSURL(string: webLink)!
//        UIApplication.shared.open(url as URL, options:convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
//    }
//
//    @objc func closeView(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.tabBarController?.tabBar.isHidden = false
//            self.dismiss(animated: false, completion: nil)
//        })
//    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}

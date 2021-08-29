//
//  OnlineInfoView.swift
//  C4ME
//
//  Created by Omar Waked on 7/6/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit

class OnlineInfoView: UIViewController {

//    var pageControlRef = UIPageControl()
//    let stepNumber = createLabel(LabelText: "Step 1:", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 25, TextAlignment: .left, TextBreak: .byClipping, NumberOfLines: 1)
//    let stepExplination = createLabel(LabelText: "Finalize your shopping. Make sure you have everything in your cart.", TextColor: StandardContrastColor, FontName: font, FontSize: 25, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createScreenLayout()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//        swipeGesture()
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
//
//        self.navigationItem.title = "Online How-to"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        let pageControl: UIPageControl = {
//            let control = UIPageControl()
//            control.numberOfPages = 3
//            control.currentPage = 0
//            control.tintColor = UIColor.lightGray
//            control.pageIndicatorTintColor = UIColor.gray
//            control.mixedCurrentPageIndicatorTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//            control.addTarget(self, action: #selector(self.nextView(gesture:)), for: UIControl.Event.valueChanged)
//            return control
//        }()
//        
//        let topBarHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0) + 5
//        
//        pageControl.frame = CGRect(x: 50, y: view.frame.maxY - topBarHeight - 50, width: self.view.frame.width - 100, height: pageControl.intrinsicContentSize.height)
//        
//        view.addSubview(pageControl)
//        view.addSubview(stepNumber)
//        view.addSubview(stepExplination)
//
//        pageControlRef = pageControl
//        
//        stepNumber.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
//        stepNumber.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
//        
//        stepExplination.bottomAnchor.constraint(equalTo: self.pageControlRef.topAnchor, constant: -20).isActive = true
//        stepExplination.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
//        stepExplination.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//    }
//    
//    func swipeGesture(){
//        let gestureNext = UISwipeGestureRecognizer(target: self, action: #selector(nextView(gesture:)))
//        let gesturePrevious = UISwipeGestureRecognizer(target: self, action: #selector(previousView(gesture:)))
//        gestureNext.direction = UISwipeGestureRecognizer.Direction.left
//        gesturePrevious.direction = UISwipeGestureRecognizer.Direction.right
//        view.addGestureRecognizer(gestureNext)
//        view.addGestureRecognizer(gesturePrevious)
//    }
//    
//    @objc func nextView(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.10, animations: {
//            if self.pageControlRef.currentPage == 0 {
//                self.pageControlRef.currentPage = 1
//                self.stepNumber.text = "Step 2:"
//                self.stepExplination.text = "Enter your member ID into the pomo code field of the website."
///*              if self.view.subviews.contains(self.chartRef){
//                  removefromsuperview
//                }
//                self.view.addSubview(self.tableViewRef)
// */
//            }else if self.pageControlRef.currentPage == 1 {
//                self.pageControlRef.currentPage = 2
//                self.stepNumber.text = "Step 3:"
//                self.stepExplination.text = "The app will notifity you once it has completed applying all possible savings."
//            }
//        })
//    }
//    
//    @objc func previousView(gesture: UISwipeGestureRecognizer) {
//        if pageControlRef.currentPage == 0 {
//            closeView()
//        }else if pageControlRef.currentPage == 1 {
//            UIView.animate(withDuration: 0.10, animations: {
//                self.pageControlRef.currentPage = 0
//                self.stepNumber.text = "Step 1:"
//                self.stepExplination.text = "Finalize your shopping. Make sure you have everything in your cart."
//            })
//        }else if pageControlRef.currentPage == 2 {
//            UIView.animate(withDuration: 0.10, animations: {
//                self.pageControlRef.currentPage = 1
//                self.stepNumber.text = "Step 2:"
//                self.stepExplination.text = "Enter your member ID into the pomo code field of the website."
//            })
//        }
//    }
//
//    @objc func closeView() {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.dismiss(animated: false, completion: nil)
//        })
//    }
//    
//    
}


//
//  filterResults.swift
//  C4ME
//
//  Created by Omar Waked on 6/17/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class filterDataResults: UIViewController, UIScrollViewDelegate {
//    
//    var segmentRef = UISegmentedControl()
//    var buttonBar = UIView()
//    var bar = UIView()
//    var navigationBarRef = UINavigationBar()
//    var settingsView = UIView()
//    var TableViewSort: UITableView!
//    var itemsInSectionsSort = [["Recently Added","Populatrity","Best Value","Price Low to High","Price High to Low"]]
//    var sectionsSort = [[""]]
//    var spacerViewRef = UIView()
//    
//    override func viewDidLoad() {
//        super.loadView()
//        createScreenLayout()
//        NotificationCenter.default.addObserver(self, selector: #selector(closeFilterView(notification:)), name: NSNotification.Name(rawValue: "closeFilterView"), object: nil)
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
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
//        self.view.reloadInputViews()
//    }
//    
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//
//        self.navigationItem.title = viewLabel
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.resetItems))
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.closeFilterView(notification:)))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        let segmentControl: UISegmentedControl = {
//            let segment = UISegmentedControl(items: ["Sort","Filter"])
//            segment.translatesAutoresizingMaskIntoConstraints = true
//            segment.backgroundColor = UIColor.clear
//            segment.tintColor = UIColor.clear
//            segment.selectedSegmentIndex = 0
//            segment.addTarget(self, action: #selector(self.changeSettings(sender:)), for: .valueChanged)
//            return segment
//        }()
//        
//        segmentControl.frame = CGRect(x: 10, y: 0, width: view.frame.width - 20, height: 30)
//        buttonBar.translatesAutoresizingMaskIntoConstraints = true
//        buttonBar.frame = CGRect(x: view.frame.minX, y: segmentControl.frame.maxY + 5, width: view.frame.width/2, height: 3)
//        buttonBar.mixedBackgroundColor = StandardContrastColor
//        bar.translatesAutoresizingMaskIntoConstraints = true
//        bar.mixedBackgroundColor = MixedColor(normal: UIColor.lightGray, night: UIColor.darkGray)
//        bar.frame = CGRect(x: view.frame.minX, y: segmentControl.frame.maxY + 5, width: view.frame.width, height: 3)
//        settingsView.frame = CGRect(x: 0, y: buttonBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (buttonBar.frame.height + statusBarRef.height - UITabBar.appearance().frame.height))
//        
//        if userDefaults.bool(forKey: "NIGHTMODE") == true {
//            segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font, size: 20)!,NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: UIControl.State.normal)
//            segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font, size: 20)!,NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
//        }else{
//            segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font, size: 20)!,NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: UIControl.State.normal)
//            segmentControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: font, size: 20)!,NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
//        }
//        
//        view.addSubview(segmentControl)
//        view.addSubview(bar)
//        view.addSubview(buttonBar)
//        view.addSubview(settingsView)
//        sortSettings()
//    }
//
//    @objc func changeSettings(sender: UISegmentedControl) {
//        UIView.animate(withDuration: 0.3) {
//            self.buttonBar.frame.origin.x = (self.view.frame.width / CGFloat(sender.numberOfSegments)) * CGFloat(sender.selectedSegmentIndex)
//        }
//        switch sender.selectedSegmentIndex {
//            case 1:
//                filterSettings()
//            default:
//                sortSettings()
//        }
//    }
//    
//    func sortSettings(){
//        let view = Sort()
//        self.addChild(view)
//        view.view.frame = CGRect(x: 0, y: buttonBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (buttonBar.frame.height + navigationBarRef.frame.height + statusBarRef.height - UITabBar.appearance().frame.height))
//         self.view.addSubview(view.view)
//        view.didMove(toParent: self)
//    }
//    
//    func filterSettings(){
//        let view = Filter()
//        self.addChild(view)
//        view.view.frame = CGRect(x: 0, y: buttonBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - (buttonBar.frame.height + navigationBarRef.frame.height + statusBarRef.height - UITabBar.appearance().frame.height))
//        self.view.addSubview(view.view)
//        view.didMove(toParent: self)
//    }
//    
//    @objc func closeFilterView(notification: NSNotification) {
//        UIView.animate(withDuration: 0.10) {
//            self.dismiss(animated: false, completion: nil)
//            self.view.alpha = 0
//        }
//    }
//    
//    @objc func resetItems(){
//        selectedFilterItemArray.removeAll()
//        selectedFilterBrandArray.removeAll()
//        couponArray.removeAll()
//        getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: false, FilterItem: false, FilterBrandData: "", FilterItemData: "")
//        NotificationCenter.default.post(name: NSNotification.Name("sortReset"), object: nil)
//        NotificationCenter.default.post(name: NSNotification.Name("filterReset"), object: nil)
//        NotificationCenter.default.post(name: NSNotification.Name("closeFilterView"), object: nil)
//    }
//    
}

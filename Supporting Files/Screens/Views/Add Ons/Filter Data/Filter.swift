//
//  Filter.swift
//  C4ME
//
//  Created by Omar Waked on 6/25/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import AFDateHelper

class Filter: UIViewController, UITableViewDataSource, UITableViewDelegate{
//    
//    var itemsInSections = [["Brand","Item"]]
//    var sections = [[""]]
//    var brandArray = [String]()
//    var itemKindArray = [String]()
//    var expirationArray = [String]()
//    var brandView = BrandFilter()
//    var filterView = ItemFilter()
//    let applyButton = createButton(Title: "Apply", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(apply))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(scrollView)
//        initializeView()
//        NotificationCenter.default.addObserver(self, selector: #selector(resetFilter(notification:)), name: NSNotification.Name(rawValue: "filterReset"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(closeBrandFilterView(notification:)), name: NSNotification.Name(rawValue: "closeBrandFilter"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(closeItemFilterView(notification:)), name: NSNotification.Name(rawValue: "closeItemFilter"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView(notification:)), name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        scrollView.needsUpdateConstraints()
//        self.reloadInputViews()
//    }
//    
//    func initializeView(){
//        view.mixedBackgroundColor = StandardViewColor
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scrollView.showsVerticalScrollIndicator = false
//
//        loadData()
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        tableView.frame = CGRect(x: 0, y: 10, width: self.view.frame.width, height: 180)
//        
//        scrollView.addSubview(tableView)
//        scrollView.addSubview(applyButton)
//        
//        applyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        applyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        applyButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        applyButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//        var contentRect = CGRect.zero
//        for view in scrollView.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//        scrollView.contentSize.width = self.view.frame.width
//        scrollView.contentSize.height = contentRect.size.height 
//    }
//    
//    let tableView: UITableView = {
//        let tableview = UITableView()
//        let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
//        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "filterCell")
//        tableview.isScrollEnabled = false
//        tableview.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//        tableview.separatorColor = UIColor.clear
//        tableview.indicatorStyle = UIScrollView.IndicatorStyle.black
//        tableview.allowsSelection = true
//        tableview.allowsMultipleSelection = true
//        tableview.contentMode = UIView.ContentMode.scaleAspectFit
//        tableview.rowHeight = 60
//        tableview.contentInset = adjustForTabbarInsets
//        tableview.scrollIndicatorInsets = adjustForTabbarInsets
//        tableview.mixedBackgroundColor = StandardViewColor
//        return tableview
//    }()
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemsInSections[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath as IndexPath)
//        cell.textLabel?.font = UIFont(name: font, size: 17)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.text = self.itemsInSections[indexPath.section][indexPath.row]
//        cell.textLabel?.textAlignment = NSTextAlignment.left
//        cell.textLabel?.mixedTextColor = StandardContrastColor
//        cell.accessoryView?.mixedTintColor = StandardContrastColor
//        cell.mixedTintColor = StandardContrastColor
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.accessoryType = .disclosureIndicator
//        
//        if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count > 0 {
//            if itemsInSections[indexPath.section][indexPath.row] == "Brand"{
//                selectCell(Cell: cell, isSelected: true, Filter: true)
//            }
//            if itemsInSections[indexPath.section][indexPath.row] == "Item"{
//                selectCell(Cell: cell, isSelected: true, Filter: true)
//            }
//        }else if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count == 0 {
//            if itemsInSections[indexPath.section][indexPath.row] == "Brand"{
//                selectCell(Cell: cell, isSelected: true, Filter: true)
//            }
//        }else if selectedFilterBrandArray.count == 0 && selectedFilterItemArray.count > 0{
//            if itemsInSections[indexPath.section][indexPath.row] == "Item"{
//                selectCell(Cell: cell, isSelected: true, Filter: true)
//            }
//        }
//        
//        if selectedFilterItemArray.isEmpty {
//            if itemsInSections[indexPath.section][indexPath.row] == "Item"{
//                selectCell(Cell: cell, isSelected: false, Filter: true)
//            }
//        }
//        
//        if selectedFilterBrandArray.isEmpty {
//            if itemsInSections[indexPath.section][indexPath.row] == "Brand"{
//                selectCell(Cell: cell, isSelected: false, Filter: true)
//            }
//        }
//        
//        
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if itemsInSections[indexPath.section][indexPath.row] == "Brand"{
//            brandFilter()
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Item"{
//            itemFilter()
//        }
//    }
//
//
//    func brandFilter(){
//        brandView.view.frame = UIScreen.main.bounds
//        UIApplication.shared.keyWindow!.addSubview(brandView.view)
//    }
//    
//    func itemFilter(){
//        filterView.view.frame = UIScreen.main.bounds
//        UIApplication.shared.keyWindow!.addSubview(filterView.view)
//    }
//    
//    @objc func closeBrandFilterView(notification: NSNotification) {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.brandView.view.removeFromSuperview()
//        })
//    }
//    
//    @objc func closeItemFilterView(notification: NSNotification) {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.filterView.view.removeFromSuperview()
//        })
//    }
//
//    
//    @objc func apply(){
//        if viewLabel == "Search"{
//            if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count > 0{
//                for (brand,item) in zip(selectedFilterBrandArray,selectedFilterItemArray) {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: true, FilterItem: true, FilterBrandData: brand, FilterItemData: item)
//                }
//            }else if selectedFilterBrandArray.count == 0 && selectedFilterItemArray.count > 0{
//                for item in selectedFilterItemArray {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: false, FilterItem: true, FilterBrandData: "", FilterItemData: item)
//                }
//            }else if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count == 0{
//                for brand in selectedFilterBrandArray {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: true, FilterItem: false, FilterBrandData: brand, FilterItemData: "")
//                }
//            }
//        }else{
//            if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count > 0{
//                for (brand,item) in zip(selectedFilterBrandArray,selectedFilterItemArray) {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: true, FilterItem: true, FilterBrandData: brand, FilterItemData: item)
//                }
//            }else if selectedFilterBrandArray.count == 0 && selectedFilterItemArray.count > 0{
//                for item in selectedFilterItemArray {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: false, FilterItem: true, FilterBrandData: "", FilterItemData: item)
//                }
//            }else if selectedFilterBrandArray.count > 0 && selectedFilterItemArray.count == 0{
//                for brand in selectedFilterBrandArray {
//                    getSelectedCategoryData(SelectedCategory: selectedCategory, FilterBrand: true, FilterItem: false, FilterBrandData: brand, FilterItemData: "")
//                }
//            }
//            couponArray.removeAll()
//            print(couponArray.count)
//        }
//        NotificationCenter.default.post(name: NSNotification.Name("closeFilterView"), object: nil)
//    }
//    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.mixedBackgroundColor = StandardViewColor
//        return view
//    }()
//
//}
//
//extension Filter {
//    func loadData(){
//        if viewLabel == "Search" {
//            for category in categoriesArray {
//                database.collection("Category").document(category).collection("Coupons").getDocuments { (snapshot, error) in
//                    if error != nil {
//                        print(error as Any)
//                    }else{
//                        for document in (snapshot?.documents)! {
//                            let Expiration = document.data()["Item Expiration"] as! String
//                            let Brand = document.data()["Item Brand"] as! String
//                            let SubCategory = document.data()["Item Subcategory"] as! String
//                            let checkDate = Date(fromString: Expiration, format: DateFormatType.isoDate)!
//                            
//                            DispatchQueue.main.async {
//                                if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == true {
//                                    self.brandArray.append(Brand)
//                                    self.itemKindArray.append(SubCategory)
//                                    self.expirationArray.append(Expiration)
//                                }else{
//                                    if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
//                                        self.brandArray.append(Brand)
//                                        self.itemKindArray.append(SubCategory)
//                                        self.expirationArray.append(Expiration)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }else{
//            database.collection("Category").document(selectedCategory).collection("Coupons").whereField("Item Category", isEqualTo: selectedCategory).getDocuments { (snapshot, error) in
//                if error != nil {
//                    print(error as Any)
//                }else{
//                    for document in (snapshot?.documents)! {
//                        let Expiration = document.data()["Item Expiration"] as! String
//                        let Brand = document.data()["Item Brand"] as! String
//                        let SubCategory = document.data()["Item Subcategory"] as! String
//                        let checkDate = Date(fromString: Expiration, format: DateFormatType.isoDate)!
//                        
//                        DispatchQueue.main.async {
//                            if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == true {
//                                self.brandArray.append(Brand)
//                                self.itemKindArray.append(SubCategory)
//                                self.expirationArray.append(Expiration)
//                            }else{
//                                if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
//                                    self.brandArray.append(Brand)
//                                    self.itemKindArray.append(SubCategory)
//                                    self.expirationArray.append(Expiration)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    @objc func resetFilter(notification: NSNotification) {
//        tableView.cellForRow(at: indexPath)?.isSelected = false
//    }
//    
//    @objc func reloadTableView(notification: NSNotification){
//        tableView.reloadInputViews()
//        tableView.reloadData()
//        tableView.setNeedsUpdateConstraints()
//    }
//    
}


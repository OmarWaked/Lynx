//
//  Sort.swift
//  C4ME
//
//  Created by Omar Waked on 6/25/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit

class Sort: UIViewController, UITableViewDelegate, UITableViewDataSource{
//    
//    var itemsInSections = [["Populatrity","Recently Added","Brand Alphabetically (A-Z)","Brand Alphabetically (Z-A)","Item Alphabetically (A-Z)","Item Alphabetically (Z-A)"]]
//    var sections = [[""]]
//    var tableViewRef = UITableView()
//    let applyButton = createButton(Title: "Apply", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(apply))
//    var cellSelected = Int()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initializeView()
//        NotificationCenter.default.addObserver(self, selector: #selector(resetSort(notification:)), name: NSNotification.Name(rawValue: "sortReset"), object: nil)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        self.reloadInputViews()
//    }
//    
//    func initializeView(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        let tableView: UITableView = {
//            let tableview = UITableView()
//            let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
//            tableview.register(UITableViewCell.self, forCellReuseIdentifier: "sortCell")
//            tableview.dataSource = self
//            tableview.delegate = self
//            tableview.isScrollEnabled = false
//            tableview.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//            tableview.separatorColor = UIColor.clear
//            tableview.indicatorStyle = UIScrollView.IndicatorStyle.black
//            tableview.allowsSelection = true
//            tableview.allowsMultipleSelection = false
//            tableview.contentMode = .scaleAspectFit
//            tableview.rowHeight = 60
//            tableview.contentInset = adjustForTabbarInsets
//            tableview.scrollIndicatorInsets = adjustForTabbarInsets
//            tableview.mixedBackgroundColor = StandardViewColor
//            return tableview
//        }()
//        
//        
//
//        tableView.frame = CGRect(x: 0, y: 10, width: self.view.frame.width, height: 360)
//        
//        self.view.addSubview(tableView)
//        self.view.addSubview(applyButton)
//        tableViewRef = tableView
//        
//        applyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        applyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        applyButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        applyButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//    }
//    
//    @objc func apply() {
//        if cellSelected > 0 {
//            if viewLabel == "Search"{
//                NotificationCenter.default.post(name: NSNotification.Name("reloadSearchArray"), object: nil)
//            }else{
//                NotificationCenter.default.post(name: NSNotification.Name("reloadCouponArray"), object: nil)
//            }
//            NotificationCenter.default.post(name: NSNotification.Name("closeFilterView"), object: nil)
//        }else{
//            let alert = createAlert(Title: "You must select at least one option to continue.", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: false, completion: nil)
//        }
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemsInSections[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sortCell", for: indexPath as IndexPath)
//        cell.textLabel?.font = UIFont(name: font, size: 17.0)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.text = self.itemsInSections[indexPath.section][indexPath.row]
//        cell.textLabel?.textAlignment = NSTextAlignment.left
//        cell.textLabel?.mixedTextColor = StandardContrastColor
//        cell.accessoryView?.mixedTintColor = StandardContrastColor
//        cell.mixedTintColor = StandardContrastColor
//        cell.mixedBackgroundColor = StandardViewColor
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cellSelected += 1
//        if itemsInSections[indexPath.section][indexPath.row] == "Brand Alphabetically (A-Z)"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$0.Brand < $1.Brand})
//            }else{
//                couponArray.sort(by:{$0.Brand < $1.Brand})
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Brand Alphabetically (Z-A)"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$1.Brand < $0.Brand})
//            }else{
//                couponArray.sort(by:{$1.Brand < $0.Brand})
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Recently Added"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$0.Expiration < $1.Expiration})
//            }else{
//                couponArray.sort(by:{$0.Expiration < $1.Expiration})
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Populatrity"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$0.Brand < $1.Brand})
//            }else{
//                couponArray.sort(by:{$0.Brand < $1.Brand})
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Item Alphabetically (A-Z)"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$0.Name < $1.Name})
//            }else{
//                couponArray.sort(by:{$0.Name < $1.Name})
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Item Alphabetically (Z-A)"{
//            if viewLabel == "Search" {
//                filteredData.sort(by:{$1.Name < $0.Name})
//            }else{
//                couponArray.sort(by:{$1.Name < $0.Name})
//            }
//        }
//        
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = StandardViewColor
//            selectCell(Cell: cell, isSelected: true, Filter: true)
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        if cellSelected > 0 {
//            cellSelected -= 1
//        }
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            selectCell(Cell: cell, isSelected: false, Filter: false)
//        }
//        return
//    }
//    
//    @objc func resetSort(notification: NSNotification) {
//        tableViewRef.cellForRow(at: indexPath)?.isSelected = false
//    }
    
}

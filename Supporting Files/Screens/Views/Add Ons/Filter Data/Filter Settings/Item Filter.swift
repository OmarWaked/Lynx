//
//  ItemFilter.swift
//  C4ME
//
//  Created by Omar Waked on 7/10/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class ItemFilter: UIViewController, UITableViewDelegate, UITableViewDataSource{
//
//    var tableViewRef = UITableView()
//    var itemDictionary = [String: [String]]()
//    var itemSectionTitles = [String]()
//    var items = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initializeView()
//
//        if viewLabel == "Search" {
//            searchSubcategoryArray.removeDuplicates()
//            self.items = searchSubcategoryArray
//        }else{
//            couponSubcategoryArray.removeDuplicates()
//            self.items = couponSubcategoryArray
//        }
//
//        for item in self.items {
//            let itemKey = String(item.prefix(1))
//            if var itemValues = self.itemDictionary[itemKey] {
//                itemValues.append(item)
//                self.itemDictionary[itemKey] = itemValues
//            }else{
//                self.itemDictionary[itemKey] = [item]
//            }
//        }
//
//        self.itemSectionTitles = [String](itemDictionary.keys)
//        self.itemSectionTitles = itemSectionTitles.sorted(by: { $0 < $1 })
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//    }
//
//    func initializeView(){
//        view.mixedBackgroundColor = StandardViewColor
//
//        let navigationBar: UINavigationBar = {
//            let navBar = UINavigationBar()
//            let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//            let applyButton = UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.apply))
//            navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//            navBar.shadowImage = UIImage()
//            navigationItem.title = "Filter Items"
//            navigationItem.leftBarButtonItem = backButton
//            navigationItem.rightBarButtonItem = applyButton
//            navBar.setItems([navigationItem], animated: true)
//            navBar.mixedBackgroundColor = StandardViewColor
//            navBar.mixedBarStyle = MixedBarStyle(normal: .default, night: .black)
//            navBar.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//            navBar.mixedTitleTextAttributes = [NNForegroundColorAttributeName: MixedColor(normal: UIColor.black, night: UIColor.white)]
//            return navBar
//        }()
//
//        let tableView: UITableView = {
//            let tableview = UITableView()
//            let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 20, right: 0)
//            tableview.register(UITableViewCell.self, forCellReuseIdentifier: "itemFilter")
//            tableview.dataSource = self
//            tableview.delegate = self
//            tableview.isScrollEnabled = true
//            tableview.separatorColor = UIColor.lightGray
//            tableview.indicatorStyle = UIScrollView.IndicatorStyle.black
//            tableview.allowsMultipleSelection = true
//            tableview.contentMode = UIView.ContentMode.scaleAspectFit
//            tableview.rowHeight = 50
//            tableview.contentInset = adjustForTabbarInsets
//            tableview.scrollIndicatorInsets = adjustForTabbarInsets
//            tableview.mixedBackgroundColor = StandardViewColor
//            return tableview
//        }()
//
//        if userDefaults.bool(forKey: "NIGHTMODE") == true{
//            tableView.sectionIndexColor = UIColor.white
//            tableView.sectionIndexBackgroundColor = UIColor.clear
//        }else{
//            tableView.sectionIndexColor = UIColor.black
//            tableView.sectionIndexBackgroundColor = UIColor.clear
//        }
//
//        navigationBar.frame = CGRect(x: 0, y: statusBarRef.maxY, width: self.view.frame.width, height: 44)
//        tableView.frame = CGRect(x: 0, y: navigationBar.frame.maxY + 10, width: view.frame.width, height: view.frame.height - navigationBar.frame.height - statusBarRef.height)
//
//        view.addSubview(navigationBar)
//        view.addSubview(tableView)
//        tableViewRef = tableView
//
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return itemSectionTitles.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let itemKey = itemSectionTitles[section]
//        if let itemValues = itemDictionary[itemKey] {
//            return itemValues.count
//        }
//        return 0
//    }
//
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return itemSectionTitles
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.mixedBackgroundColor = StandardViewColor
//        headerView.addBorderBottom(size: 1.5, color: UIColor.gray)
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width, height: 25))
//        headerLabel.font = UIFont(name: font, size: 20)
//        headerLabel.mixedTextColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        headerLabel.text = self.tableView(tableViewRef, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return itemSectionTitles[section]
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        let separatorView = UIView(frame: CGRect(x: 15, y: footerView.frame.height, width: tableView.frame.width - 30, height: 1))
//        separatorView.backgroundColor = UIColor.clear
//        footerView.addSubview(separatorView)
//        return footerView
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "itemFilter", for: indexPath)
//        cell.textLabel?.font = UIFont(name: font, size: 17)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.mixedTextColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.accessoryView?.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.textLabel?.textAlignment = NSTextAlignment.left
//        cell.mixedBackgroundColor = StandardViewColor
//
//        let itemKey = itemSectionTitles[indexPath.section]
//        if let itemValues = itemDictionary[itemKey] {
//            cell.textLabel?.text = itemValues[indexPath.row]
//        }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        selectedFilterItemArray.append((cell?.textLabel?.text)!)
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = StandardViewColor
//            selectCell(Cell: cell, isSelected: true, Filter: false)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        selectedFilterItemArray.remove(at: indexPath.row)
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            selectCell(Cell: cell, isSelected: false, Filter: false)
//        }
//        return
//    }
//
//    @objc func apply(){
//        selectedFilterItemArray.removeDuplicates()
//        print(selectedFilterItemArray)
//        if viewLabel == "Search" {
//            filteredData.removeAll()
//        }else{
//            couponArray.removeAll()
//        }
//        closeView()
//    }
//
//    @objc func closeView() {
//        NotificationCenter.default.post(name: NSNotification.Name("reloadTableView"), object: nil)
//        NotificationCenter.default.post(name: NSNotification.Name("closeItemFilter"), object: nil)
//    }

}

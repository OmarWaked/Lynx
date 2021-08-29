//
//  PreferencesViewController.swift
//  C4ME
//
//  Created by Omar Waked on 4/7/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var generalNotificationsSwitch = UISwitch(frame: CGRect.zero)
//    var newsletterSubscriptionSwitch = UISwitch(frame: CGRect.zero)
//    var showExpiredCouponsSwitch = UISwitch(frame: CGRect.zero)
//    var applyBestDealSwitch = UISwitch(frame: CGRect.zero)
//    var nightModeSwitch = UISwitch(frame: CGRect.zero)
//    let tableView = createTableView(Cell: UITableViewCell.self, CellIdentifier: "preferenceCell", Scroll: false, Select: false, RowHeight: 50, SeperatorColor: .clear)
//    
//    var itemsInSections = [["Show expired coupons","Apply best deal combination"],["Recieve notifications"],["Night Mode"]]
//    var sections = [["Settings"],["Notifications"],["Display Appearance"]]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createViewLayout()
//        swipeGesture()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        checkForSwitchValue()
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
//    func createViewLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        self.navigationItem.title = "Preferences"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        tableView.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 49)
//        
//        view.addSubview(tableView)
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return itemsInSections.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemsInSections[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.size.width, height: 0))
//        headerLabel.font = UIFont(name: fontBold, size: 20)
//        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//        headerLabel.mixedTextColor = StandardContrastColor
//        headerView.mixedBackgroundColor = StandardViewColor
//        
//        return headerView
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
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(sections[section][indexPath.row])"
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "preferenceCell", for: indexPath as IndexPath)
//        cell.textLabel?.font = UIFont(name: font, size: 18)
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.textLabel?.mixedTextColor = StandardContrastColor
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
//        cell.textLabel!.text = self.itemsInSections[indexPath.section][indexPath.row]
//        
//        if itemsInSections[indexPath.section][indexPath.row] == "Night Mode"{
//            cell.accessoryView = nightModeSwitch
//            nightModeSwitch.addTarget(self, action: #selector(self.toggleNightMode), for: UIControl.Event.valueChanged)
//            //FORCE APP TO RELOAD ALL VIEWS TO APPLY THE CHANGE
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Recieve notifications"{
//            cell.accessoryView = generalNotificationsSwitch
//            generalNotificationsSwitch.addTarget(self, action: #selector(self.toggleAllNotifications), for: UIControl.Event.valueChanged)
//            
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Get new updates and features"{
//             cell.accessoryView = newsletterSubscriptionSwitch
//             newsletterSubscriptionSwitch.addTarget(self, action: #selector(self.recieveEmailUpdates), for: UIControl.Event.valueChanged)
//            
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Show expired coupons"{
//             cell.accessoryView = showExpiredCouponsSwitch
//             showExpiredCouponsSwitch.addTarget(self, action: #selector(self.displayExpiredCoupons), for: UIControl.Event.valueChanged)
//            
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Apply best deal combination"{
//            cell.accessoryView = applyBestDealSwitch
//            applyBestDealSwitch.addTarget(self, action: #selector(self.applyBestDeal), for: UIControl.Event.valueChanged)
//        }
//        
//        return cell
//    }
//
//    func checkForSwitchValue(){
//        if userDefaults.bool(forKey: "NIGHTMODE") == true{
//            nightModeSwitch.isOn = true
//        }else{
//            nightModeSwitch.isOn = false
//        }
//        if userDefaults.bool(forKey: "NOTIFICATIONS") == true{
//            generalNotificationsSwitch.isOn = true
//        }else{
//            generalNotificationsSwitch.isOn = false
//        }
//        if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == true{
//            showExpiredCouponsSwitch.isOn = true
//        }else{
//            showExpiredCouponsSwitch.isOn = false
//        }
//        if userDefaults.bool(forKey: "APPLYBESTDEAL") == true{
//            applyBestDealSwitch.isOn = true
//        }else{
//            applyBestDealSwitch.isOn = false
//        }
//        
//    }
//    
//    func swipeGesture(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeView))
//        gesture.direction = .right
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func closeView() {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.tabBarController?.tabBar.isHidden = false
//            self.navigationController?.pushViewController(SettingsView(), animated: false)
//        })
//    }

    
}

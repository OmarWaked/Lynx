//
//  UserMenuScreen.swift
//  C4ME
//
//  Created by Omar Waked on 10/25/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import Lottie
import LocalAuthentication

class SettingsView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = createTableView(Cell: UITableViewCell.self, CellIdentifier: "settingsCell", Scroll: true, Select: true, RowHeight: 50, SeperatorColor: .clear)
    var itemsInSections = [["Account Settings"],["Preferences"],["Help Center","Report a Problem"],["FAQ","Privacy Policy","Terms"]]
    var sections = [["Account"],["Settings"],["Support"],["About"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
        checkConnection()
    }
    
    func createViewLayout(){
        view.backgroundColor = StandardViewColor
        setupNavigationBar(LargeText: true, Title: "Settings", SystemImageR: false, ImageR: false, ImageTitleR: "", TargetR: nil, ActionR: nil, SystemImageL: false, ImageL: false, ImageTitleL: "", TargetL: nil, ActionL: nil)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: self.view.frame.height - (UITabBar.appearance().frame.height + (navigationController?.navigationBar.frame.height)!))
        
        view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return itemsInSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInSections[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = StandardViewColor
        let headerLabel = UILabel(frame: CGRect(x: 15, y: -1, width: tableView.frame.width, height: 25))
        headerLabel.font = UIFont(name: fontBold, size: 20)
        headerLabel.textColor = StandardContrastColor
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let separatorView = UIView(frame: CGRect(x: 15, y: footerView.frame.height, width: tableView.frame.width - 30, height: 0.25))
        separatorView.backgroundColor = UIColor.clear
        footerView.addSubview(separatorView)
        return footerView
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section][indexPath.row])"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath as IndexPath)
        cell.textLabel?.font = UIFont(name: font, size: 18)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.textLabel!.text = self.itemsInSections[indexPath.section][indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.backgroundColor = StandardViewColor
        cell.textLabel?.textColor = StandardContrastColor
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if itemsInSections[indexPath.section][indexPath.row] == "Account Settings"{
            accountSettings()
        }else if itemsInSections[indexPath.section][indexPath.row] == "Preferences"{
            editPreferences()
        }else if itemsInSections[indexPath.section][indexPath.row] == "Help Center"{
            supportView()
        }else if itemsInSections[indexPath.section][indexPath.row] == "FAQ"{
            FAQ()
        }else if itemsInSections[indexPath.section][indexPath.row] == "Report a Problem"{
            emailSupport()
        }else if itemsInSections[indexPath.section][indexPath.row] == "Privacy Policy"{
            privacyPolicy()
        }else if itemsInSections[indexPath.section][indexPath.row] == "Terms"{
            terms()
        }
    }
    
}


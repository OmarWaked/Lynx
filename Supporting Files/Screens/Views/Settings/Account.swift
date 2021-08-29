//
//  AccountViewController.swift
//  C4ME
//
//  Created by Omar Waked on 4/7/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import Lottie
import BLTNBoard

class AccountViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
//
//    var itemsInSections = [["Current Email","Member ID"],["Change Email"],["Change Password"],["History","Save Copy of Data"]]
//    var sections = [["Info"],["Email"],["Password"],["Purchases"]]
//    var contentRect = CGRect.zero
//    let tableView = createTableView(Cell: accountCell.self, CellIdentifier: "accountCell", Scroll: false, Select: true, RowHeight: 50, SeperatorColor: .clear)
//    let logoutButton = createButton(Title: "Log Out", FontName: font, FontSize: 23, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(signOutAction))
//    let deleteAccountButton = createButton(Title: "Delete Account", FontName: fontBold, FontSize: 15, FontColor: MixedColor(normal: .red, night: .red), BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(terminate))
//    
//    let backgroundStyles = BackgroundStyles()
//    var currentBackground = (name: "Dimmed", style: BLTNBackgroundViewStyle.dimmed)
//    
//    override func viewDidLoad() {
//        view.addSubview(scrollView)
//        super.viewDidLoad()
//        swipeGesture()
//        createViewLayout()
//    }
//    
//    lazy var bulletinManager: BLTNItemManager = {
//        let page = BulletinDataSource.makeEmailPage()
//        return BLTNItemManager(rootItem: page)
//    }()
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        scrollView.needsUpdateConstraints()
//        checkConnection()
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
//    func createViewLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scrollView.showsVerticalScrollIndicator = false
//        
//        self.navigationItem.title = "Account"
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
//        tableView.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 505)
//        
//        scrollView.addSubview(tableView)
//        scrollView.addSubview(logoutButton)
//        scrollView.addSubview(deleteAccountButton)
//        
//        logoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 80).isActive = true
//        logoutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        logoutButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50).isActive = true
//        logoutButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 50)/5.5).isActive = true
//        
//        deleteAccountButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 10).isActive = true
//        deleteAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        deleteAccountButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50).isActive = true
//        deleteAccountButton.heightAnchor.constraint(equalToConstant: deleteAccountButton.intrinsicContentSize.height).isActive = true
//        
//        for view in scrollView.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//        
//        scrollView.contentSize.width = self.view.frame.width
//        scrollView.contentSize.height = contentRect.size.height + 40
//        scrollView.bottomAnchor.constraint(equalTo: deleteAccountButton.bottomAnchor, constant: 20).isActive = true
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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as! accountCell
//        cell.textLabel?.font = UIFont(name: font, size: 18)
//        cell.textLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel!.text = self.itemsInSections[indexPath.section][indexPath.row]
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.textLabel?.mixedTextColor = StandardContrastColor
//        cell.mixedTintColor = StandardContrastColor
//        
//        if itemsInSections[indexPath.section][indexPath.row] == "Current Email"{
//            if currentUserEmail?.isEmpty == false {
//                cell.textLabel?.text = "Email: \(currentUserEmail!)"
//            }else{
//                signOutAction()
//                let alert = createAlert(Title: "Error", Message: "Please sign in again.", Style: .alert, ButtonTitle: "Ok")
//                self.present(alert, animated: true, completion: nil)
//            }
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Member ID"{
//            cell.textLabel?.text = "Member ID: \n\(currentUserUUID!)"
//            cell.textLabel?.textAlignment = NSTextAlignment.left
//            cell.textLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
//            cell.textLabel?.numberOfLines = 0
//            cell.textLabel?.adjustsFontSizeToFitWidth = true
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Change Email"{
//            cell.accessoryType = .disclosureIndicator
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Change Password"{
//            cell.accessoryType = .disclosureIndicator
//        }else if itemsInSections[indexPath.section][indexPath.row] == "History"{
//            cell.accessoryType = .disclosureIndicator
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Save Copy of Data"{
//            cell.accessoryType = .disclosureIndicator
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if itemsInSections[indexPath.section][indexPath.row] == "Change Email"{
//            email()
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Change Password"{
//            password()
//        }else if itemsInSections[indexPath.section][indexPath.row] == "Save Copy of Data"{
//            showBulletin()
//        }else if itemsInSections[indexPath.section][indexPath.row] == "History"{
//            viewTransactionData()
//        }
//        return
//    }
//    
//    func showBulletin(){
//        bulletinManager.allowsSwipeInteraction = false
//        self.bulletinManager.showBulletin(above: self)
//    }
//    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.mixedBackgroundColor = StandardViewColor
//        return view
//    }()
//    
//    func swipeGesture(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeView))
//        gesture.direction = .right
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func email(){
//        let view = UINavigationController(rootViewController: ChangeEmailView())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    @objc func password(){
//        let view = UINavigationController(rootViewController: ChangePasswordView())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//
//    @objc func viewTransactionData(){
//        self.navigationController?.pushViewController(transactionHistoryView(), animated: false)
//        self.tabBarController?.tabBar.isHidden = true
//    }
//    
//    @objc func terminate(){
//        let view = UINavigationController(rootViewController: TerminateAccountView())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    @objc func signOutAction() {
//        try! Auth.auth().signOut()
//        self.navigationController?.pushViewController(startView(), animated: false)
//        currentUserName = ""
//        currentUserUUID = ""
//        currentUserEmail = ""
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
//    
//    
}

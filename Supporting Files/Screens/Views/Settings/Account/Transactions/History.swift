//
//  transactionHistoryView.swift
//  C4ME
//
//  Created by Omar Waked on 6/22/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class transactionHistoryView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
//    
//    var cellIdentifier = "purchaseHistoryCell"
//    var searchBar = UISearchBar()
//    var filteredHistoryData: [purchaseHistory] = []
//    let tableView = createTableView(Cell: purchaseHistoryCell.self, CellIdentifier: "purchaseHistoryCell", Scroll: true, Select: true, RowHeight: 120, SeperatorColor: .lightGray)
//    let placeholderLabel = createLabel(LabelText: "Once a transaction has been finalized, it will be listed here.", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 20, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createViewLayout()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.reloadInputViews()
//        tableView.reloadData()
//        tableView.reloadInputViews()
//        
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
//        tableView.setNeedsUpdateConstraints()
//        checkConnection()
//        if purchaseHistoryArray.count > 0 {
//            self.view.addSubview(tableView)
//            if self.view.subviews.contains(placeholderLabel){
//                placeholderLabel.removeFromSuperview()
//            }
//        }else{
//            view.addSubview(placeholderLabel)
//        }
//        
//        if NightNight.theme == .night {
//            let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] as [NSAttributedString.Key : Any]
//            self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
//        }else{
//            let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black] as [NSAttributedString.Key : Any]
//            self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
//            self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
//        }
//        
//    }
//
//    func createViewLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        self.navigationItem.title = "Transaction History"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "searchNav"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.searchHistory))
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 55)
//
//        view.addSubview(placeholderLabel)
//        placeholderLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
//        placeholderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        placeholderLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
//    }
//    
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return purchaseHistoryArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        footerView.mixedBackgroundColor = StandardViewColor
//        return footerView
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseHistoryCell") as! purchaseHistoryCell
//        
//        cell.accessoryView? = UIView(frame: CGRect(x: cell.frame.maxX - 20, y: cell.frame.minY + 1, width: 10, height: 10))
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//        if purchaseHistoryArray[indexPath.row].Instore == true{
//            purchaseHistoryArray[indexPath.row].Location = "Instore"
//        }else{
//            purchaseHistoryArray[indexPath.row].Location = "Online"
//        }
//        cell.store = "Store:  \(purchaseHistoryArray[indexPath.row].Store!) - \(purchaseHistoryArray[indexPath.row].Location!)"
//        cell.date = purchaseHistoryArray[indexPath.row].Date
//        cell.total = "Total: \(convertToCurrency(value: Double(purchaseHistoryArray[indexPath.row].Total)!))"
//        cell.savings = "Savings: \(convertToCurrency(value: Double(purchaseHistoryArray[indexPath.row].Saved)!))"
//        cell.document = purchaseHistoryArray[indexPath.row].Document
//        purchaseHistoryArray.sort(by:{$1.Date < $0.Date})
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        transactionIDPass = purchaseHistoryArray[indexPath.row].Document
//        transactionStorePass = purchaseHistoryArray[indexPath.row].Store
//        transactionDatePass = purchaseHistoryArray[indexPath.row].Date
//        transactionTotalPass = convertToCurrency(value: Double(purchaseHistoryArray[indexPath.row].Total)!)
//        transactionSavingsPass = convertToCurrency(value: Double(purchaseHistoryArray[indexPath.row].Saved)!)
//    
//        if purchaseHistoryArray[indexPath.row].Instore == true{
//            transactionTypePass = "Instore"
//        }else{
//            transactionTypePass = "Online"
//        }
//        
//        self.moveToHistoryInfo()
//    }
//    
//    @objc func searchHistory() {
//        self.tableView.alpha = 0.3
//        self.tableView.allowsSelection = false
//        searchBar.showsCancelButton = true
//        searchBar.delegate = self
//        searchBar.placeholder = "Enter Name Or Barcode"
//        self.navigationItem.largeTitleDisplayMode = .never
//        self.navigationItem.titleView = searchBar
//        self.navigationItem.rightBarButtonItems = []
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
//            cancelButton.isEnabled = true
//        }
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        if searchBar.text?.isEmpty == false {
//            //filteredHistoryData = purchaseHistoryArray.filter{$0.Store.contains(searchBar.text!) || $0.Store.lowercased().contains(searchBar.text!) || $0.Items.contains(searchBar.text!) || $0.Items.map {$0.lowercased()}.contains(searchBar.text!)}
//            if filteredHistoryData.count < 1 {
//                
//            }
//        }else{
//            filteredHistoryData = purchaseHistoryArray
//            return
//        }
//        navigationBarItems()
//        reloadView()
//    }
//    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        if searchBar.text?.isEmpty == true {
//            filteredHistoryData = purchaseHistoryArray
//            searchBarCancelButtonClicked(searchBar)
//        }
//        reloadView()
//    }
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.searchBar.resignFirstResponder()
//        navigationBarItems()
//        reloadView()
//        filteredHistoryData = purchaseHistoryArray
//    }
//    
//    func navigationBarItems(){
//        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        let searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(self.searchHistory))
//        self.navigationItem.title = "Transaction History"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.rightBarButtonItem = searchButton
//        self.navigationItem.leftBarButtonItem = backButton
//        self.navigationItem.titleView = nil
//    }
//    
//    func reloadView(){
//        self.tableView.allowsSelection = true
//        self.tableView.reloadData()
//        self.tableView.alpha = 1
//    }
//
//    @objc func moveToHistoryInfo(){
//        let navController = UINavigationController(rootViewController: HistoryDetailView())
//        self.navigationController?.present(navController, animated: false, completion: nil)
//    }
//
//    @objc func closeView() {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.navigationController?.pushViewController(AccountViewController(), animated: false)
//            self.tabBarController?.tabBar.isHidden = false
//        })
//    }
//    
}




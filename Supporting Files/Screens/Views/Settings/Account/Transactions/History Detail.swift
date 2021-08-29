//
//  HistoryDetailView.swift
//  C4ME
//
//  Created by Omar Waked on 7/11/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class HistoryDetailView: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    let tableView = createTableView(Cell: transactionDetailedHistoryCell.self, CellIdentifier: "historyDetailCell", Scroll: true, Select: false, RowHeight: 70, SeperatorColor: .lightGray)
//
//    var sections = [["Details"],["Cart"]]
//
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView(notification:)), name: NSNotification.Name(rawValue: "reloadHistoryDetailed"), object: nil)
//        super.viewDidLoad()
//        initializeView()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//        self.view.reloadInputViews()
//        tableView.reloadData()
//        tableView.reloadInputViews()
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
//        getTransactionDetials(Document: transactionIDPass)
//    }
//    
//    func initializeView(){
//        view.mixedBackgroundColor = StandardViewColor
//
//        self.navigationItem.title = transactionStorePass
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = CGRect(x: 0, y: 10, width: self.view.frame.width, height: self.view.frame.height)
//        view.addSubview(tableView)
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.mixedBackgroundColor = StandardViewColor
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: -1, width: tableView.frame.width, height: 25))
//        headerLabel.font = UIFont(name: fontBold, size: 20)
//        headerLabel.mixedTextColor = StandardContrastColor
//        headerLabel.text = "Cart"
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        footerView.mixedBackgroundColor = StandardViewColor
//        return footerView
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return transactionHistoryArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "historyDetailCell", for: indexPath) as! transactionDetailedHistoryCell
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.accessoryView?.mixedTintColor = StandardContrastColor
//        cell.mixedTintColor = StandardContrastColor
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.textLabel?.mixedTextColor = StandardContrastColor
//    
//        cell.brand = transactionHistoryArray[indexPath.row].Brand
//        cell.price = convertToCurrency(value: Double(transactionHistoryArray[indexPath.row].Price)! * Double(transactionHistoryArray[indexPath.row].Quantity)!)
//        cell.item = transactionHistoryArray[indexPath.row].Name
//        cell.quantity = "\(transactionHistoryArray[indexPath.row].Quantity!)x"
//        cell.barcode = transactionHistoryArray[indexPath.row].Barcode
//    /*
//        if transactionHistoryArray[indexPath.row].Savings == "0" {
//            cell.savings = "No Savings"
//            cell.savingsLabel.mixedTextColor = StandardContrastColor
//        }else{
//            cell.savings = convertToCurrency(value: Double(transactionHistoryArray[indexPath.row].Savings)!)
//            cell.savingsLabel.mixedTextColor = StandardTintColor
//        }
//    */
//        return cell
//        //IF ITEM BARCODE == TRANSACTION COUPON ARRAY THEN MAKE IT A CHECKMARK NEXT TO ITEM
//    }
//    
//    func swipeGesture(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(closeView(gesture:)))
//        gesture.direction = .right
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func closeView(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.dismiss(animated: false, completion: nil)
//            transactionHistoryArray.removeAll()
//        })
//    }
//    
//    @objc func reloadTableView(notification: NSNotification) {
//        self.tableView.reloadData()
//        self.tableView.reloadInputViews()
//        self.tableView.setNeedsUpdateConstraints()
//        self.reloadInputViews()
//        self.view.needsUpdateConstraints()
//    }

}

//
//  Instore.swift
//  C4ME
//
//  Created by Omar Waked on 6/19/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import AFDateHelper
import BLTNBoard

var itemDetail = String()
var brandDetail = String()
var priceDetail = String()
var quantityDetail = String()

class transactionView: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    var cellIdentifier = "InstoreCell"
//    var applicableCoupon = [applicableCoupons]()
//    var Total = Double()
//    var Savings = Double()
//    var DocumentID = String()
//    
//    let tableView = createTableView(Cell: transactionCell.self, CellIdentifier: "InstoreCell", Scroll: false, Select: false, RowHeight: 300, SeperatorColor: .clear)
//    let usernameLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let typeLabel = createLabel(LabelText: "Instore", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let memberNumberLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 16, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let userIDButton = createButton(Title: "Show ID Number", FontName: font, FontSize: 16, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(showIDNumber))
//    let userIDLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 17, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let copyButton = createButton(Title: "Copy Address", FontName: font, FontSize: 16, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(copyAddress))
//    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let priceLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let quantityLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 18, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    let backgroundStyles = BackgroundStyles()
//    var currentBackground = (name: "Dimmed", style: BLTNBackgroundViewStyle.dimmed)
//    
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadTransactionView(notification:)), name: NSNotification.Name(rawValue: "reloadTransactionView"), object: nil)
//        super.viewDidLoad()
//        createViewLayout()
//        updateCart()
//        swipeGesture()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        getUserData()
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
//        
//        if instoreCheckOutArray.count > 0 {
//            self.userDataView.removeFromSuperview()
//            self.memberNumberLabel.removeFromSuperview()
//        }
//        
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//        self.tableView.reloadData()
//        self.tableView.reloadInputViews()
//        self.tableView.setNeedsUpdateConstraints()
//        self.view.needsUpdateConstraints()
//        
//        if instoreCheckOutArray.count > 0 {
//            setupTransaction()
//        }else{
//            userDataView.updateConstraints()
//        }
//        if (indexPath.row >= tableView.numberOfRows(inSection: indexPath.section) - 3){
//            tableView.separatorColor = UIColor.clear
//        }
//        
//    }
//    
//    func createViewLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//
//        self.navigationItem.title = "Check Out"
//        self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
//        self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.backgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.barTintColor = StandardViewColor
//        self.navigationController?.navigationBar.tintColor = StandardContrastColor
//        
//        tableView.dataSource = self
//        tableView.delegate = self
//        userIDLabel.isHidden = true
//        copyButton.isHidden = true
//        
//        view.addSubview(userDataView)
//        view.addSubview(tableView)
//        
//        userDataView.addSubview(usernameLabel)
//        userDataView.addSubview(typeLabel)
//        userDataView.addSubview(userScanImage)
//        userDataView.addSubview(userIDLabel)
//        userDataView.addSubview(userIDButton)
//        userDataView.addSubview(copyButton)
//        
//        if instoreCheckOutArray.count == 0 {
//            userDataView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25).isActive = true
//            userDataView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            userDataView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 30).isActive = true
//            userDataView.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 30)/1.65).isActive = true
//            
//            typeLabel.topAnchor.constraint(equalTo: userDataView.topAnchor, constant: 10).isActive = true
//            typeLabel.rightAnchor.constraint(equalTo: userDataView.rightAnchor, constant: -15).isActive = true
//            
//            usernameLabel.topAnchor.constraint(equalTo: userDataView.topAnchor, constant: 10).isActive = true
//            usernameLabel.leftAnchor.constraint(equalTo: userDataView.leftAnchor, constant: 15).isActive = true
//            
//            userScanImage.centerYAnchor.constraint(equalTo: userDataView.centerYAnchor, constant: -5).isActive = true
//            userScanImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            
//            userIDLabel.centerYAnchor.constraint(equalTo: userDataView.centerYAnchor).isActive = true
//            userIDLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            
//            if userDataView.subviews.contains(userIDButton){
//                userIDButton.bottomAnchor.constraint(equalTo: userDataView.bottomAnchor, constant: -10).isActive = true
//                userIDButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            }
//            copyButton.bottomAnchor.constraint(equalTo: userDataView.bottomAnchor, constant: -10).isActive = true
//            copyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        }
//    }
//    
//    let userDataView: UIView = {
//        let dataView = UIView()
//        dataView.layer.cornerRadius = 15
//        dataView.layer.borderWidth = 2
//        dataView.layer.mixedBorderColor = StandardContrastColor
//        dataView.mixedBackgroundColor = StandardViewColor
//        dataView.translatesAutoresizingMaskIntoConstraints = false
//        return dataView
//    }()
// 
//    let userScanImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if instoreCheckOutArray.count > 0 {
//            return instoreCheckOutArray.count
//        }else{
//            return 1
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.size.width, height: 25))
//        headerLabel.font = UIFont(name: fontBold, size: 20)
//        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.backgroundColor = StandardViewColor
//        headerLabel.textColor = StandardContrastColor
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if instoreCheckOutArray.count > 0 {
//            return currentDay
//        }else{
//            return " "
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! transactionCell
//        cell.textLabel?.font = UIFont(name: font, size: 18)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
//        cell.textLabel?.numberOfLines = 0
//        cell.backgroundColor = StandardViewColor
//        cell.textLabel?.textColor = StandardContrastColor
//        cell.accessoryView?.tintColor = StandardContrastColor
//        cell.mixedTintColor = StandardContrastColor
//
//        if instoreCheckOutArray.count > 0 {
//            tableView.allowsSelection = true
//            
//            cell.brand = instoreCheckOutArray[indexPath.row].Brand
//            cell.item = instoreCheckOutArray[indexPath.row].Name
//            cell.price = convertToCurrency(value: Double(instoreCheckOutArray[indexPath.row].Price)! * Double(instoreCheckOutArray[indexPath.row].Quantity)!)
//            cell.quantity = "\(instoreCheckOutArray[indexPath.row].Quantity!)x"
//            cell.number = instoreCheckOutArray[indexPath.row].Number
//            cell.brandLabel.textColor = StandardContrastColor
//            
//            if applicableCoupon.contains(where: {$0.Barcode == cell.number!}){
//
//                if applicableCoupon[indexPath.row].DiscountType == true {
//                    let saved = ((Double(applicableCoupon[indexPath.row].Discount!)! * 0.01)) * (Double(instoreCheckOutArray[indexPath.row].Quantity))!
//                    cell.savings = "-\(saved)%"
//                    self.Savings += saved
//                }else{
//                    cell.savings = "-\(convertToCurrency(value: Double(applicableCoupon[indexPath.row].Discount!)! * (Double(instoreCheckOutArray[indexPath.row].Quantity))!))"
//                    self.Savings += (Double(applicableCoupon[indexPath.row].Discount!)! * (Double(instoreCheckOutArray[indexPath.row].Quantity))!)
//                }
//                
//            }else{
//                cell.savings = ""
//            }
//            
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        if instoreCheckOutArray.count > 0 {
//            let separatorView = UIView(frame: CGRect(x: 0, y: footerView.frame.height, width: tableView.frame.width, height: 90))
//            separatorView.backgroundColor = StandardContrastColor
//            let totalLabel = createLabel(LabelText: "Total: \(convertToCurrency(value: Total))", TextColor: StandardViewColor, FontName: fontBold, FontSize: 20, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 1)
//            let savingsLabel = createLabel(LabelText: "Saved: \(convertToCurrency(value: Savings))", TextColor: StandardViewColor, FontName: fontBold, FontSize: 20, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 1)
//            
//            separatorView.addSubview(totalLabel)
//            separatorView.addSubview(savingsLabel)
//            
//            totalLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 15).isActive = true
//            totalLabel.widthAnchor.constraint(equalToConstant: separatorView.frame.width - 20).isActive = true
//            totalLabel.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor).isActive = true
//            savingsLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
//            savingsLabel.widthAnchor.constraint(equalToConstant: separatorView.frame.width - 20).isActive = true
//            savingsLabel.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor).isActive = true
//            
//            footerView.addSubview(separatorView)
//        }
//        return footerView
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! transactionCell
//        itemLabel.text = "Item: \(cell.item!)"
//        brandLabel.text = "Brand: \(cell.brand!)"
//        priceLabel.text = "Price: \(cell.price!)"
//        quantityLabel.text = "Quantity: \(cell.quantity!)"
//        
//        itemDetail = cell.item!
//        brandDetail = cell.brand!
//        priceDetail = "Price: \(cell.price!)"
//        quantityDetail = "Quantity: \(cell.quantity!)"
//        showBulletin()
//    }
//    
//    lazy var bulletinManager: BLTNItemManager = {
//        let page = BulletinDataSource.makeItemInfoPage()
//        return BLTNItemManager(rootItem: page)
//    }()
//
//    func showBulletin(){
//        bulletinManager.allowsSwipeInteraction = false
//        self.bulletinManager.showBulletin(above: self)
//    }
//    
//    @objc func copyAddress(){
//        UIPasteboard.general.string = userIDLabel.text!
//        let alert = createAlert(Title: "Copied", Message: "Your User ID has been copied to your clipboard.", Style: .alert, ButtonTitle: "Ok")
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    @objc func showIDNumber(){
//        userIDButton.removeFromSuperview()
//        userDataView.addSubview(memberNumberLabel)
//        memberNumberLabel.bottomAnchor.constraint(equalTo: userDataView.bottomAnchor, constant: -10).isActive = true
//        memberNumberLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//    }
//
//    @objc func closeView(){
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.navigationController?.pushViewController(transactionView(), animated: false)
//            self.tabBarController?.tabBar.isHidden = false
//        })
//    }
//
//    @objc func reloadTransactionView(notification: NSNotification) {
//        self.tableView.reloadData()
//        self.tableView.reloadInputViews()
//        self.tableView.setNeedsUpdateConstraints()
//        self.tableView.tableFooterView?.reloadInputViews()
//        self.reloadInputViews()
//        self.view.needsUpdateConstraints()
//    }
//    
//    func setupTransaction(){
//        UIView.animate(withDuration: 0.3, animations: {
//            self.navigationItem.title = "Cart"
//            self.userDataView.frame = CGRect(x: 15, y: -1000, width: self.view.frame.width - 30, height: (self.view.frame.width - 30)/1.8)
//            self.tableView.frame = CGRect(x: 0, y: 15, width: self.view.frame.width, height: self.view.frame.height + 40)
//            self.navigationController?.navigationBar.prefersLargeTitles = false
//        }) { (false) in
//            self.userDataView.removeFromSuperview()
//            self.tableView.reloadData()
//            self.tableView.reloadInputViews()
//            self.tableView.setNeedsUpdateConstraints()
//            self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//            self.tableView.separatorColor = UIColor.lightGray
//            self.tableView.isScrollEnabled = true
//            self.tableView.rowHeight = 70
//            self.tableView.indicatorStyle = UIScrollView.IndicatorStyle.black
//            self.view.reloadInputViews()
//        }
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
//            if self.typeLabel.text == "Instore"{
//                self.typeLabel.text = "Online"
//                self.userScanImage.isHidden = true
//                self.userIDLabel.isHidden = false
//                self.copyButton.isHidden = false
//                self.userIDButton.isHidden = true
//                self.memberNumberLabel.isHidden = true
//            }
//        })
//    }
//    
//    @objc func previousView(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.10, animations: {
//            if self.typeLabel.text == "Online"{
//                self.typeLabel.text = "Instore"
//                self.userScanImage.isHidden = false
//                self.userIDLabel.isHidden = true
//                self.copyButton.isHidden = true
//                self.userIDButton.isHidden = false
//                self.memberNumberLabel.isHidden = false
//            }
//        })
//    }
//    
    
}



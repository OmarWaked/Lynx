//
//  newCoupons.swift
//  C4ME
//
//  Created by Omar Waked on 12/21/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage
import AFDateHelper

class newCoupons: UIViewController, UIGestureRecognizerDelegate, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    var collectionView: UICollectionView!
//    var sortButton = UIBarButtonItem()
//    var filterButton = UIBarButtonItem()
//    var filteredData: [getCouponData] = []
//    let searchBar = UISearchBar()
//    var cellIdentifier = "CouponCell"
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    let placeholderLabel = createLabel(LabelText: "There are currently no coupons available for the \(selectedCategory) category.", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 20, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadCouponList(notification:)), name: NSNotification.Name(rawValue: "reloadCouponArray"), object: nil)
//        couponArray.removeAll()
//        super.viewDidLoad()
//        createScreenLayout()
//        createCollectionView()
//        swipeGesture()
//        getSubcategories()
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
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//        self.collectionView.reloadData()
//        self.collectionView.reloadInputViews()
//        self.collectionView.updateConstraintsIfNeeded()
//    }
//    
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        self.navigationItem.title = selectedCategory
//        let searchButton = UIBarButtonItem(image: UIImage(named: "searchNav"), style: .plain, target: self, action: #selector(self.searchAction))
//        let settingButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(self.filterResults))
//        self.navigationItem.rightBarButtonItems = [searchButton,settingButton]
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//    }
//    
//    func createCollectionView(){
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
//        layout.itemSize = CGSize(width: self.view.bounds.width/2, height: 245)
//        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 50
//        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (UITabBar.appearance().frame.height + (navigationController?.navigationBar.frame.height)!)), collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(couponCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        collectionView.mixedBackgroundColor = StandardViewColor
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.allowsMultipleSelection = false
//        collectionView.allowsSelection = true
//        self.view.addSubview(collectionView)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if searchBar.text?.isEmpty == false{
//            return filteredData.count
//        }else{
//            return couponArray.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! couponCell
//        if couponArray[indexPath.row].DiscountType == true {
//            cell.discountLabel.text = "\(couponArray[indexPath.row].Discount!)% Off"
//        }else{
//            cell.discountLabel.text = "\(convertToCurrency(value: Double(couponArray[indexPath.row].Discount)!)) Off"
//        }
//        
//        cell.imageView.image = couponArray[indexPath.row].Image
//        cell.itemLabel.text = couponArray[indexPath.row].Name
//        cell.brandLabel.text = couponArray[indexPath.row].Brand
//        cell.imageView.frame = CGRect(x: layout.sectionInset.left, y: 0, width: layout.itemSize.width, height: 210)
//        cell.itemLabel.frame = CGRect(x: layout.sectionInset.left, y: cell.imageView.frame.maxY + 5, width: layout.itemSize.width, height: cell.itemLabel.intrinsicContentSize.height)
//        cell.brandLabel.frame = CGRect(x: layout.sectionInset.left, y: cell.itemLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.brandLabel.intrinsicContentSize.height)
//        cell.discountLabel.frame = CGRect(x: layout.sectionInset.left, y: cell.brandLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.discountLabel.intrinsicContentSize.height + 5)
//        
//        let checkDate = Date(fromString: couponArray[indexPath.row].Expiration, format: DateFormatType.isoDate)!
//        if checkDate.compare(.isToday)||checkDate.compare(.isInTheFuture){
//            cell.discountLabel.mixedTextColor = StandardContrastColor
//        }else{
//            cell.discountLabel.textColor = UIColor.red
//        }
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        getRelatedCouponData(SelectedCategory: couponArray[indexPath.row].Category, SelectedSubcategory: couponArray[indexPath.row].Subcategory)
//        couponPassImage = couponArray[indexPath.row].Image
//        couponPassName = couponArray[indexPath.row].Name
//        couponPassBrand = couponArray[indexPath.row].Brand
//        couponPassDiscount = couponArray[indexPath.row].Discount
//        couponPassBarcode = couponArray[indexPath.row].Barcode
//        couponPassCategory = couponArray[indexPath.row].Category
//        couponPassExpiration = couponArray[indexPath.row].Expiration
//        couponPassTerms = couponArray[indexPath.row].Terms
//        couponPassDate = Date(fromString: couponArray[indexPath.row].Expiration, format: DateFormatType.isoDate)!
//        couponPassSubcategory = couponArray[indexPath.row].Subcategory
//        couponPassDiscountType = couponArray[indexPath.row].DiscountType
//        couponPassCompanyName = couponArray[indexPath.row].CompanyName
//        couponPassCUID = couponArray[indexPath.row].CompanyCUID
//        self.showCouponInfo()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? couponCell {
//                cell.alpha = 0.15
//                cell.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            }
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? couponCell {
//                cell.alpha = 1
//                cell.contentView.backgroundColor = UIColor.clear
//            }
//        }
//    }
//    
//    @objc func searchAction() {
//        self.collectionView.alpha = 0.3
//        self.collectionView.allowsSelection = false
//        searchBar.showsCancelButton = true
//        searchBar.delegate = self
//        searchBar.placeholder = "Enter Name Or Barcode"
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
//            filteredData = couponArray.filter{$0.Brand.contains(searchBar.text!) || $0.Brand.lowercased().contains(searchBar.text!) || $0.Name.contains(searchBar.text!) || $0.Name.lowercased().contains(searchBar.text!) || $0.Barcode.contains(searchBar.text!) || $0.Name.contains(searchBar.text!)}
//            if filteredData.count < 1 {
//                //Alert user saying no coupons with the current filtered conditions
//            }
//        }else{
//            filteredData = couponArray
//            return
//        }
//        navigationBarItems()
//        reloadView()
//    }
//    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        if searchBar.text?.isEmpty == true {
//            filteredData = couponArray
//            searchBarCancelButtonClicked(searchBar)
//        }
//        reloadView()
//    }
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.searchBar.resignFirstResponder()
//        navigationBarItems()
//        reloadView()
//        filteredData = couponArray
//    }
//    
//    func navigationBarItems(){
//        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        let searchButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(self.searchAction))
//        let settingButton = UIBarButtonItem(image: UIImage(named: "filter"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.filterResults))
//        self.navigationItem.title = selectedCategory
//        self.navigationItem.rightBarButtonItems = [searchButton,settingButton]
//        self.navigationItem.leftBarButtonItem = backButton
//        self.navigationItem.titleView = nil
//    }
//    
//    func reloadView(){
//        self.collectionView.allowsSelection = true
//        self.collectionView.reloadData()
//        self.collectionView.alpha = 1
//    }
//    
//    func showCouponInfo(){
//        let view = UINavigationController(rootViewController: CouponInfo())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    func swipeGesture(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(closeView(gesture:)))
//        gesture.direction = .right
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func filterResults(){
//        viewLabel = "\(selectedCategory) (\(couponArray.count))"
//        let view = UINavigationController(rootViewController: filterDataResults())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    @objc func closeView(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.dismiss(animated: false, completion: {
//                selectedFilterBrandArray.removeAll()
//                selectedFilterItemArray.removeAll()
//                self.reloadInfo()
//            })
//        })
//    }
//    
//    @objc func reloadCouponList(notification: NSNotification) {
//        self.collectionView.reloadData()
//        self.collectionView.reloadInputViews()
//        self.collectionView.updateConstraintsIfNeeded()
//     
//        if noCoupons == true {
//            print("no coupons")
//            self.view.addSubview(self.placeholderLabel)
//            self.placeholderLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
//            self.placeholderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            self.placeholderLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
//        }else{
//            if view.subviews.contains(placeholderLabel){
//                placeholderLabel.removeFromSuperview()
//            }
//        }
//    }
//    
//    func reloadInfo(){
//        couponArray.removeAll()
//        couponBrandArray.removeAll()
//        couponSubcategoryArray.removeAll()
//        collectionView.reloadData()
//        collectionView.reloadInputViews()
//    }
//    
//    
}

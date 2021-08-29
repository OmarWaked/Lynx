//
//  SearchViewController.swift
//  C4ME
//
//  Created by Omar Waked on 4/7/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Lottie
import Firebase
import AFDateHelper

var searchArray = [getCouponData]()
var filteredData: [getCouponData] = []

class SearchViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating{
//    
//    var collectionView: UICollectionView!
//    var cellIdentifier = "searchCell"
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    let searchBar = UISearchController(searchResultsController: nil)
//    let placeholderLabel = createLabel(LabelText: " ", TextColor: StandardContrastColor, FontName: font, FontSize: 25, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadSearchView(notification:)), name: NSNotification.Name(rawValue: "reloadSearchArray"), object: nil)
//        super.viewDidLoad()
//        self.reloadInputViews()
//        createScreenLayout()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//
//        if userDefaults.bool(forKey: "NIGHTMODE") == true{
//            searchBar.searchBar.keyboardAppearance = UIKeyboardAppearance.dark
//        }else{
//            searchBar.searchBar.keyboardAppearance = UIKeyboardAppearance.light
//        }
//        
//        for view in searchBar.searchBar.subviews {
//            for subview in view.subviews {
//                if subview is UITextField {
//                    let textField: UITextField = subview as! UITextField
//                    textField.mixedBackgroundColor = StandardViewColor
//                    textField.mixedTextColor = StandardContrastColor
//                    textField.layer.mixedBorderColor = StandardContrastColor
//                }
//            }
//        }
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
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        self.navigationItem.title = "Search"
//        self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
//        self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: true, Title: "back", Target: self, Action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        self.navigationItem.searchController = searchBar
//        
//        searchBar.searchBar.placeholder = "Search a item, brand or barcode"
//        searchBar.searchResultsUpdater = self
//        definesPresentationContext = true
//        
//        self.navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
//        self.navigationItem.hidesSearchBarWhenScrolling = false
//        
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
//        layout.itemSize = CGSize(width: self.view.bounds.width/2, height: 245)
//        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 50
//        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (navigationController?.navigationBar.frame.height)!),collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(searchCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        collectionView.mixedBackgroundColor = StandardViewColor
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.allowsMultipleSelection = false
//        collectionView.allowsSelection = true
//
//        view.addSubview(collectionView)
//    }
//    
//    func reloadView(){
//        collectionView.allowsSelection = true
//        collectionView.reloadData()
//        collectionView.isHidden = false
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if filteredData.count > 0 {
//            return filteredData.count
//        }else{
//            return 0
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! searchCell
//        let checkDate = Date(fromString: filteredData[indexPath.row].Expiration, format: DateFormatType.isoDate)!
//        cell.imageView.image = filteredData[indexPath.row].Image
//        cell.itemLabel.text = filteredData[indexPath.row].Name
//        cell.brandLabel.text = filteredData[indexPath.row].Brand
//        if filteredData[indexPath.row].DiscountType == true {
//            cell.discountLabel.text = "\(filteredData[indexPath.row].Discount!)% Off"
//        }else{
//            cell.discountLabel.text = "\(convertToCurrency(value: Double(filteredData[indexPath.row].Discount)!)) Off"
//        }
//        cell.imageView.frame = CGRect(x: 0, y: 0, width: layout.itemSize.width, height: 210)
//        cell.itemLabel.frame = CGRect(x: 0, y: cell.imageView.frame.maxY + 5, width: layout.itemSize.width, height: cell.itemLabel.intrinsicContentSize.height)
//        cell.brandLabel.frame = CGRect(x: 0, y: cell.itemLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.brandLabel.intrinsicContentSize.height)
//        cell.discountLabel.frame = CGRect(x: 0, y: cell.brandLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.discountLabel.intrinsicContentSize.height + 5)
//        if checkDate.compare(.isToday)||checkDate.compare(.isInTheFuture){
//            cell.discountLabel.mixedTextColor = StandardContrastColor
//        }else{
//            cell.discountLabel.textColor = UIColor.red
//        }
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? searchCell {
//            let barcode = filteredData[indexPath.row].Barcode
//            let brand = filteredData[indexPath.row].Brand
//            couponPassBrand = brand!
//            couponPassName = cell.itemLabel.text!
//            couponPassImage = cell.imageView.image!
//            couponPassDiscount = filteredData[indexPath.row].Discount
//            couponPassExpiration = filteredData[indexPath.row].Expiration
//            couponPassBarcode = "\(barcode!)"
//            couponPassCategory = filteredData[indexPath.row].Category
//            couponPassTerms = filteredData[indexPath.row].Terms
//            couponPassSubcategory = filteredData[indexPath.row].Subcategory
//            couponPassDiscountType = filteredData[indexPath.row].DiscountType
//            self.showCouponInfo()
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? searchCell {
//                cell.alpha = 0.15
//                cell.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            }
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? searchCell {
//                cell.alpha = 1
//                cell.contentView.backgroundColor = UIColor.clear
//            }
//        }
//    }
//    
//    @objc func filterResults(){
//        viewLabel = "Search"
//        let view = UINavigationController(rootViewController: filterDataResults())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    func showCouponInfo(){
//        let view = UINavigationController(rootViewController: CouponInfo())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    @objc func reloadSearchView(notification: NSNotification) {
//        self.view.reloadInputViews()
//        self.collectionView.reloadData()
//        self.collectionView.reloadInputViews()
//        
//        if view.subviews.contains(placeholderLabel){
//            placeholderLabel.removeFromSuperview()
//        }
//    }
//    
//    /*
//     if searchBar.text?.isEmpty == false {
//     filteredData.removeAll()
//     filteredData = searchArray.filter{$0.Name.contains(searchBar.text!) || $0.Barcode.contains(searchBar.text!) || $0.Brand.contains(searchBar.text!) || $0.Brand.lowercased().contains(searchBar.text!) || $0.Brand.uppercased().contains(searchBar.text!) || $0.Name.lowercased().contains(searchBar.text!) || $0.Name.uppercased().contains(searchBar.text!)}
//     self.navigationController?.navigationBar.prefersLargeTitles = true
//     let filterButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(self.filterResults))
//     self.navigationItem.rightBarButtonItem = filterButton
//     self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//     reloadView()
//     self.navigationItem.hidesSearchBarWhenScrolling = true
//     self.navigationItem.title = searchBar.text!
//     
//     if filteredData.count <= 0{
//     placeholderLabel.text = "No coupons found for \(searchBar.text!)"
//     self.view.addSubview(placeholderLabel)
//     placeholderLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
//     placeholderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//     placeholderLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
//     }
//     }else{
//     self.navigationItem.title = "Search"
//     if view.subviews.contains(placeholderLabel){
//     placeholderLabel.removeFromSuperview()
//     }
//     }
//     */
//    
//    func updateSearchResults(for searchController: UISearchController) {
//        if searchBar.searchBar.text?.isEmpty == false {
//            searchDatabase()
//            filteredData.removeAll()
//            filterData(SearchFeild: searchBar.searchBar.text!)
//            self.navigationController?.navigationBar.prefersLargeTitles = true
//            let filterButton = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(self.filterResults))
//            self.navigationItem.rightBarButtonItem = filterButton
//            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//            self.navigationItem.hidesSearchBarWhenScrolling = true
//            self.navigationItem.title = searchBar.searchBar.text!
//            
//            if filteredData.count <= 0{
//                placeholderLabel.text = "No coupons found for \(searchBar.searchBar.text!)"
//                self.view.addSubview(placeholderLabel)
//                placeholderLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
//                placeholderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//                placeholderLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
//            }
//            reloadView()
//        }else{
//            self.navigationItem.title = "Search"
//            if view.subviews.contains(placeholderLabel){
//                placeholderLabel.removeFromSuperview()
//            }
//        }
//    }
//    
//    func filterData(SearchFeild: String){
//        filteredData = searchArray.filter{$0.Name.contains(SearchFeild) || $0.Barcode.contains(SearchFeild) || $0.Brand.contains(SearchFeild) || $0.Brand.lowercased().contains(SearchFeild) || $0.Brand.uppercased().contains(SearchFeild) || $0.Name.lowercased().contains(SearchFeild) || $0.Name.uppercased().contains(SearchFeild)}
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        searchBar.searchBar.endEditing(true)
//        self.view.endEditing(true)
//        self.navigationItem.title = searchBar.searchBar.text!
//        searchBar.viewWillDisappear(true)
//    }
//    
//    func searchDatabase(){
//        for category in categoriesArray {
//            database.collection("Category").document(category).collection("Coupons").getDocuments { (snapshot, error) in
//                if error != nil {
//                    print(error as Any)
//                }else{
//                    for document in (snapshot?.documents)! {
//                        let Company = document.data()["Company"] as! [String:Any]
//                        let CompanyName = Company["Name"] as! String
//                        let CompanyCUID = Company["CUID"] as! String
//                        
//                        let Coupon = document.data()["Coupon"] as! [String:Any]
//                        let Barcode = Coupon["Barcode"] as! String
//                        let Brand = Coupon["Brand"] as! String
//                        let Category = Coupon["Category"] as! String
//                        let Discount = Coupon["Discount"] as! String
//                        let DiscountType = Coupon["Discount Type %"] as! Bool
//                        let Expiration = Coupon["Expiration"] as! String
//                        let Name = Coupon["Name"] as! String
//                        let Subcategory = Coupon["Subcategory"] as! String
//                        let Terms = Coupon["Terms"] as! String
//                        
//                        var imageRef = storageReference.child("")
//                        
//                        if Category == "Store-Specific" {
//                            imageRef = storageReference.child("\(Category)/\(Brand).jpg")
//                        }else{
//                            imageRef = storageReference.child("\(Category)/\(Barcode).jpg")
//                        }
//                        
//                        imageRef.downloadURL(completion: { (url, error) in
//                            if error != nil {
//                                print(error?.localizedDescription as Any)
//                                let imageData = UIImage(named: "Default Image")
//                                self.appendToSearchArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
//                            }else{
//                                URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//                                    let imageData = UIImage(data: data!)
//                                    self.appendToSearchArray(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: imageData!, Expires: Expiration, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID)
//                                }).resume()
//                            }
//                        })
//                    }
//                }
//            }
//        }
//    }
//
//    func appendToSearchArray(Brand: String, Name: String, Category: String, Subcategory: String, Discount: String, Image: UIImage, Expires: String, Barcode: String, Terms: String, DiscountType: Bool, CompanyName: String, CompanyCUID: String!){
//        let checkDate = Date(fromString: Expires, format: DateFormatType.isoDate)!
//        DispatchQueue.main.async {
//            if userDefaults.bool(forKey: "SHOWEXPIREDCOUPONS") == true {
//                searchArray.append(getCouponData.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: Image, Expires: Expires, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID))
//                searchBrandArray.append(Brand)
//                searchSubcategoryArray.append(Subcategory)
//                NotificationCenter.default.post(name: NSNotification.Name("reloadSearchView"), object: nil)
//            }else{
//                if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
//                    searchArray.append(getCouponData.init(Brand: Brand, Name: Name, Category: Category, Subcategory: Subcategory, Discount: Discount, Image: Image, Expires: Expires, Barcode: Barcode, Terms: Terms, DiscountType: DiscountType, CompanyName: CompanyName, CompanyCUID: CompanyCUID))
//                    searchBrandArray.append(Brand)
//                    searchSubcategoryArray.append(Subcategory)
//                    NotificationCenter.default.post(name: NSNotification.Name("reloadSearchView"), object: nil)
//                }
//            }
//        }
//    }
//    
//    
//    @objc func closeView(){
//        self.navigationController?.pushViewController(HomeScreen(), animated: false)
//        self.tabBarController?.tabBar.isHidden = true
//    }
}



//
//  HomeScreen.swift
//  C4ME
//
//  Created by Omar Waked on 10/23/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import BarcodeScanner
import CoreLocation
import AFDateHelper
import FirebasePerformance

class HomeScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
//
//    var collectionView: UICollectionView!
//    var featuredCollectionView: UICollectionView!
//    var cellIdentifier = "HomeCellIdentifier"
//    var featuredCellIdentifier = "FeaturedCellIndentifier"
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    var featuredLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    var contentRect = CGRect.zero
//    let featuredView = createView()
//
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadHomeData(notification:)), name: NSNotification.Name(rawValue: "reloadHomeData"), object: nil)
//        super.viewDidLoad()
//        view.addSubview(scrollView)
//        checkVerification()
//        createScreenLayout()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        self.view.reloadInputViews()
//        collectionView.reloadInputViews()
//        collectionView.reloadData()
//        featuredCollectionView.reloadData()
//        featuredCollectionView.reloadInputViews()
//
//        func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let verticalIndicator = featuredCollectionView.subviews.last as? UIImageView
//            verticalIndicator?.backgroundColor = StandardContrastColor
//        }
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
//
//        self.navigationItem.title = "Home"
//        let searchButton = createBarButtonItem(Image: true, Title: "searchNav", Target: self, Action: #selector(self.searchDatabase))
//        let scanButton = createBarButtonItem(Image: true, Title: "scan", Target: self, Action: #selector(self.ScanItemButton))
//        self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
//        self.navigationItem.rightBarButtonItems = [scanButton,searchButton]
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.backgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.tintColor = StandardViewColor
//        self.navigationController?.navigationBar.tintColor = StandardContrastColor
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        featuredLayout = featuredCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//    }
//
//    func createScreenLayout(){
//        view.backgroundColor = StandardViewColor
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scrollView.showsVerticalScrollIndicator = false
//
//        trendingLabel.frame = CGRect(x: 15, y: 20, width: trendingLabel.intrinsicContentSize.width, height: trendingLabel.intrinsicContentSize.height)
//        featuredView.frame = CGRect(x: 15, y: trendingLabel.frame.maxY + 10, width: self.view.frame.width - 30, height: 300)
//
//        featuredLayout.itemSize = CGSize(width: self.view.frame.width - 30, height: 290)
//        featuredLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
//        featuredCollectionView = UICollectionView(frame: CGRect(x: 0, y: 5, width: featuredLayout.itemSize.width, height: featuredLayout.itemSize.height), collectionViewLayout: featuredLayout)
//        featuredCollectionView.dataSource = self
//        featuredCollectionView.delegate = self
//        featuredCollectionView.showsHorizontalScrollIndicator = true
//        featuredCollectionView.register(featuredCell.self, forCellWithReuseIdentifier: featuredCellIdentifier)
//        featuredCollectionView.backgroundColor = StandardViewColor
//
//        categoryLabel.frame = CGRect(x: 15, y: featuredView.frame.maxY + 15, width: categoryLabel.intrinsicContentSize.width, height: categoryLabel.intrinsicContentSize.height)
//
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: self.view.bounds.width/2, height: 220)
//        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 10
//
//        collectionView = UICollectionView(frame: CGRect(x: 0, y: categoryLabel.frame.maxY + 15, width: self.view.frame.width, height: 1540), collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.showsVerticalScrollIndicator = true
//        collectionView.register(homeCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        collectionView.backgroundColor = StandardViewColor
//        collectionView.isScrollEnabled = false
//
//        scrollView.addSubview(featuredView)
//        scrollView.addSubview(trendingLabel)
//        featuredView.addSubview(featuredCollectionView)
//        scrollView.addSubview(categoryLabel)
//        scrollView.addSubview(collectionView)
//
//        for view in scrollView.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//
//        scrollView.contentSize.width = self.view.frame.width
//        scrollView.contentSize.height = contentRect.size.height + 20
//    }
//
//    let trendingLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: fontBold, size: 28)
//        label.textAlignment = NSTextAlignment.left
//        label.translatesAutoresizingMaskIntoConstraints = true
//        label.text = "Featured Today"
//        label.mixedTextColor = StandardContrastColor
//        return label
//    }()
//
//    let categoryLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: fontBold, size: 28)
//        label.textAlignment = NSTextAlignment.left
//        label.translatesAutoresizingMaskIntoConstraints = true
//        label.text = "Categories"
//        label.mixedTextColor = StandardContrastColor
//        return label
//    }()
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == featuredCollectionView {
//            return promotedCouponArray.count
//        }else{
//          return categoryArray.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == featuredCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCellIdentifier, for: indexPath) as! featuredCell
//            cell.imageView.image = promotedCouponArray[indexPath.row].Image
//            cell.itemLabel.text = promotedCouponArray[indexPath.row].Name!
//            cell.brandLabel.text = promotedCouponArray[indexPath.row].Brand!
//            if promotedCouponArray[indexPath.row].DiscountType == true{
//                cell.discountLabel.text = "\(promotedCouponArray[indexPath.row].Discount!)% Off"
//            }else{
//                cell.discountLabel.text = "\(convertToCurrency(value: Double(promotedCouponArray[indexPath.row].Discount)!)) Off"
//            }
//            cell.imageView.frame = CGRect(x: 5, y: 0, width: featuredLayout.itemSize.width, height: 200)
//            cell.itemLabel.frame = CGRect(x: 5, y: cell.imageView.frame.maxY + 10, width: featuredLayout.itemSize.width, height: cell.itemLabel.font.lineHeight)
//            cell.brandLabel.frame = CGRect(x: 5, y: cell.itemLabel.frame.maxY + 2, width: featuredLayout.itemSize.width, height: cell.brandLabel.font.lineHeight)
//            cell.discountLabel.frame = CGRect(x: 5, y: cell.brandLabel.frame.maxY + 2, width: featuredLayout.itemSize.width, height: cell.discountLabel.font.lineHeight + 3)
//            let checkDate = Date(fromString: promotedCouponArray[indexPath.row].Expiration, format: DateFormatType.isoDate)!
//            if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
//                cell.discountLabel.mixedTextColor = StandardContrastColor
//            }else{
//                cell.discountLabel.textColor = UIColor.red
//            }
//            return cell
//        }else{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! homeCell
//            cell.imageView.image = categoryArray[indexPath.row].Image
//            cell.itemLabel.text = categoryArray[indexPath.row].Name
//            cell.imageView.frame = CGRect(x: 0, y: 0, width: layout.itemSize.width, height: layout.itemSize.height)
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//         if collectionView == featuredCollectionView {
//            couponPassImage = promotedCouponArray[indexPath.row].Image
//            couponPassName = promotedCouponArray[indexPath.row].Name
//            couponPassBrand = promotedCouponArray[indexPath.row].Brand
//            couponPassDiscount = promotedCouponArray[indexPath.row].Discount
//            couponPassBarcode = promotedCouponArray[indexPath.row].Barcode
//            couponPassCategory = promotedCouponArray[indexPath.row].Category
//            couponPassExpiration = promotedCouponArray[indexPath.row].Expiration
//            couponPassTerms = promotedCouponArray[indexPath.row].Terms
//            couponPassDiscountType = promotedCouponArray[indexPath.row].DiscountType
//            couponPassDate = Date(fromString: promotedCouponArray[indexPath.row].Expiration, format: DateFormatType.isoDate)!
//            couponPassSubcategory = promotedCouponArray[indexPath.row].Subcategory
//            getRelatedCouponData(SelectedCategory: promotedCouponArray[indexPath.row].Category, SelectedSubcategory: promotedCouponArray[indexPath.row].Subcategory)
//            self.showCouponInfo()
//         }else{
//            getSelectedCategoryData(SelectedCategory: categoryArray[indexPath.row].Name, FilterBrand: false, FilterItem: false, FilterBrandData: "", FilterItemData: "")
//            selectedCategory = categoryArray[indexPath.row].Name
//            showSelectedCategory()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? homeCell {
//                cell.alpha = 0.15
//                cell.contentView.backgroundColor = StandardViewColor.withAlphaComponent(0.7)
//            }
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? homeCell {
//                cell.alpha = 1.0
//                cell.contentView.backgroundColor = UIColor.clear
//            }
//        }
//    }
//
//    func showSelectedCategory(){
//        couponArray.removeAll()
//        let view = UINavigationController(rootViewController: newCoupons())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//
//    @objc func ScanItemButton() {
//        let navController = UINavigationController(rootViewController: makeBarcodeScannerViewController())
//        self.navigationController?.present(navController, animated: false, completion: nil)
//    }
//
//    @objc func showCouponInfo() {
//        UIView.animate(withDuration: 1.0) {
//            let navController = UINavigationController(rootViewController: CouponInfo())
//            self.navigationController?.present(navController, animated: false, completion: nil)
//        }
//    }
//
//    func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
//        let viewController = BarcodeScannerViewController()
//        viewController.codeDelegate = self
//        viewController.errorDelegate = self
//        viewController.dismissalDelegate = self
//        viewController.title = "Scan Barcode"
//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.removeScanner))
//        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
//        return viewController
//    }
//
//    @objc func removeScanner(){
//        self.dismiss(animated: false, completion: nil)
//    }
//
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.mixedBackgroundColor = StandardViewColor
//        return view
//    }()
//
//    func checkVerification(){
//        if Auth.auth().currentUser?.isEmailVerified == false {
//            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
//                if error != nil {
//                    print(error as Any)
//                }else{
//                    let alert = createAlert(Title: "Verify", Message: "Please verify your email thought the email that we sent you.", Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }
//            })
//        }
//    }
//
//    @objc func reloadHomeData(notification: NSNotification) {
//        self.collectionView.reloadData()
//        self.featuredCollectionView.reloadData()
//        self.featuredCollectionView.reloadInputViews()
//        setNeedsFocusUpdate()
//    }
//
//    @objc func searchDatabase(){
//        self.navigationController?.pushViewController(SearchViewController(), animated: false)
//        self.tabBarController?.tabBar.isHidden = true
//    }

}

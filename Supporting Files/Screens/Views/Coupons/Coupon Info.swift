//
//  CouponInfo.swift
//  C4ME
//
//  Created by Omar Waked on 1/6/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit
import Social
import AFDateHelper

var relatedCouponArray: [findRelatedCoupons] = []

class CouponInfo: UIViewController, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    
//    let couponBarcode = couponPassBarcode
//    var collectionView: UICollectionView!
//    var favoriteButton = UIBarButtonItem()
//    let relatedCouponCellIdentifier = "RelatedCouponCell"
//    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    var barcodeButtonRef = UIButton()
//    var reportErrorRef = UIButton()
//    let placeholderLabel = UILabel()
//    var contentRect = CGRect.zero
//    
//    
//    let itemLabel = createLabeltemp(LabelText: couponPassName, TextColor: StandardContrastColor, FontName: fontBold, FontSize: 23, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let discountLabel = createLabeltemp(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 20, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let expirationLabel = createLabeltemp(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 20, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let checkDate = Date(fromString: couponPassExpiration, format: DateFormatType.isoDate)!
//    let termsLabel = createLabeltemp(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let detailsLabel = createLabeltemp(LabelText: "Details", TextColor: StandardContrastColor, FontName: font, FontSize: 28, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let relatedLabel = createLabeltemp(LabelText: "Related", TextColor: StandardContrastColor, FontName: font, FontSize: 28, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    
//    
//    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadRelatedCoupons(notification:)), name: NSNotification.Name(rawValue: "reloadRelatedCoupons"), object: nil)
//        view.addSubview(scrollView)
//        super.viewDidLoad()
//        swipeGesture()
//        createInfoDataView()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        if relatedCouponArray.count > 0 {
//            if scrollView.subviews.contains(placeholderLabel){
//                placeholderLabel.removeFromSuperview()
//            }
//            collectionView.isHidden = false
//        }else{
//            scrollView.addSubview(placeholderLabel)
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
//        if bookmarkedArray.contains(where: {$0.Barcode == couponBarcode}) {
//            favoriteButton = UIBarButtonItem(image: UIImage(named: "bookmarked"), style: .plain, target: self, action: #selector(self.favoriteItemAction))
//        }else{
//            favoriteButton = UIBarButtonItem(image: UIImage(named: "bookmark"), style: .plain, target: self, action: #selector(self.favoriteItemAction))
//        }
//        let shareButton = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(self.shareCoupon))
//        self.navigationItem.rightBarButtonItems = [favoriteButton,shareButton]
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//    }
//
//    func createInfoDataView(){
//        view.mixedBackgroundColor = StandardViewColor
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scrollView.showsVerticalScrollIndicator = false
//        
//        self.navigationItem.title = couponPassBrand
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        let itemImage: UIImageView = {
//            let image = UIImageView()
//            image.contentMode = .scaleAspectFit
//            image.image = couponPassImage
//            return image
//        }()
//        
//        
//        let barcodeButton: UIButton = {
//            let button = UIButton()
//            button.addTarget(self, action: #selector(self.barcode), for: UIControl.Event.touchUpInside)
//            button.titleLabel?.font = UIFont(name: font, size: 16)
//            button.setTitle("Show Barcode", for: UIControl.State.normal)
//            button.setTitleColor(self.view.tintColor, for: UIControl.State.normal)
//            return button
//        }()
//        
//        let reportButton: UIButton = {
//            let button = UIButton()
//            button.addTarget(self, action: #selector(self.reportError), for: UIControl.Event.touchUpInside)
//            button.titleLabel?.font = UIFont(name: font, size: 15)
//            button.setTitle("Report an error", for: UIControl.State.normal)
//            button.setTitleColor(self.view.tintColor, for: UIControl.State.normal)
//            return button
//        }()
//        
//        if couponPassDiscountType == true{
//            discountLabel.text = "Discount: \(couponPassDiscount)% Off"
//        }else{
//            discountLabel.text = "Discount: \(convertToCurrency(value: Double(couponPassDiscount)!)) Off"
//        }
//        
//        if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
//            let dateLabel = Date(fromString: couponPassExpiration, format: .isoDate)?.toString(format: .custom("MM/dd/yyyy"))
//            expirationLabel.text = "Expires: \(dateLabel!)"
//            expirationLabel.mixedTextColor = StandardContrastColor
//        }else{
//            let dateLabel = Date(fromString: couponPassExpiration, format: .isoDate)?.toString(format: .custom("MM/dd/yyyy"))
//            expirationLabel.text = "Expired: \(dateLabel!)"
//            expirationLabel.textColor = UIColor.red
//        }
//        
//        if couponPassTerms.isEmpty == true {
//            termsLabel.text = "Terms & Conditions: None"
//        }else{
//            termsLabel.text = "Terms & Conditions: \(couponPassTerms)"
//        }
//
//        
//        itemLabel.frame = CGRect(x: 15, y: 20, width: view.frame.width - 30, height: couponPassName.height(withConstrainedWidth: self.view.frame.width - 20, font: UIFont(name: font, size: 22.0)!) + 10)
//        itemImage.frame = CGRect(x: 0, y: itemLabel.frame.maxY + 5, width: self.view.frame.width, height: (self.view.frame.width)/1.6)
//        detailsLabel.frame = CGRect(x: itemLabel.frame.minX, y: itemImage.frame.maxY + 15, width: itemLabel.frame.width, height: detailsLabel.intrinsicContentSize.height)
//        discountLabel.frame = CGRect(x: itemLabel.frame.minX, y: detailsLabel.frame.maxY + 10, width: itemLabel.frame.width, height: discountLabel.intrinsicContentSize.height)
//        expirationLabel.frame = CGRect(x: itemLabel.frame.minX, y: discountLabel.frame.maxY + 10, width: itemLabel.frame.width, height: expirationLabel.intrinsicContentSize.height)
//        termsLabel.frame = CGRect(x: itemLabel.frame.minX, y: expirationLabel.frame.maxY + 5, width: itemLabel.frame.width, height: couponPassTerms.height(withConstrainedWidth: itemLabel.frame.width, font: UIFont(name: font, size: 14.0)!) + 40)
//        relatedLabel.frame = CGRect(x: itemLabel.frame.minX, y: termsLabel.frame.maxY + 15, width: itemLabel.frame.width, height: relatedLabel.font.lineHeight)
//        
//        layout.itemSize = CGSize(width: self.view.frame.width - 10, height: 215)
//        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
//        collectionView = UICollectionView(frame: CGRect(x: 15, y: relatedLabel.frame.maxY + 10, width: layout.itemSize.width, height: layout.itemSize.height + 15), collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.showsHorizontalScrollIndicator = true
//        collectionView.register(relatedCouponCell.self, forCellWithReuseIdentifier: relatedCouponCellIdentifier)
//        collectionView.mixedBackgroundColor = StandardViewColor
//        collectionView.isHidden = true
//        
//        barcodeButton.frame = CGRect(x: itemLabel.frame.minX, y: collectionView.frame.maxY + 15, width: itemLabel.frame.width, height: barcodeButton.intrinsicContentSize.height + 10)
//        reportButton.frame = CGRect(x: 30, y: barcodeButton.frame.maxY, width: self.view.frame.width - 60, height: reportButton.intrinsicContentSize.height)
//        
//        if NightNight.theme == .night {
//            barcodeButton.layer.addBorder(edge: UIRectEdge.top, color: UIColor.white, thickness: 1.5)
//            termsLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.white, thickness: 1.5)
//        }else{
//            barcodeButton.layer.addBorder(edge: UIRectEdge.top, color: UIColor.black, thickness: 1.5)
//            termsLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.black, thickness: 1.5)
//        }
//
//        placeholderLabel.font = UIFont(name: font, size: 20)
//        placeholderLabel.textAlignment = NSTextAlignment.center
//        placeholderLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
//        placeholderLabel.numberOfLines = 0
//        placeholderLabel.mixedTextColor = StandardContrastColor
//        placeholderLabel.text = "There are no coupons related to this one yet."
//        placeholderLabel.frame = CGRect(x: 15, y: relatedLabel.frame.maxY + 80, width: view.frame.width - 30, height: (placeholderLabel.text?.height(withConstrainedWidth: self.view.frame.width - 30, font: UIFont(name: font, size: 20)!))!)
//        placeholderLabel.isHidden = false
//        
//        scrollView.addSubview(itemLabel)
//        scrollView.addSubview(itemImage)
//        scrollView.addSubview(detailsLabel)
//        scrollView.addSubview(discountLabel)
//        scrollView.addSubview(expirationLabel)
//        scrollView.addSubview(termsLabel)
//        scrollView.addSubview(relatedLabel)
//        scrollView.addSubview(collectionView)
//        
//        scrollView.addSubview(barcodeButton)
//        scrollView.addSubview(reportButton)
//
//        for view in scrollView.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//        
//        scrollView.contentSize.width = self.view.frame.width
//        scrollView.contentSize.height = contentRect.size.height + 30
//        
//        barcodeButtonRef = barcodeButton
//        reportErrorRef = reportButton
//    }
//    
//    func snapToNearestCell(_ collectionView: UICollectionView) {
//        for i in 0..<collectionView.numberOfItems(inSection: 0) {
//            
//            let itemWithSpaceWidth = layout.itemSize.width + layout.minimumLineSpacing
//            let itemWidth = layout.itemSize.width
//            
//            if collectionView.contentOffset.x <= CGFloat(i) * itemWithSpaceWidth + itemWidth / 2 {
//                let indexPath = IndexPath(item: i, section: 0)
//                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//                break
//            }
//        }
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        snapToNearestCell(scrollView as! UICollectionView)
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        snapToNearestCell(scrollView as! UICollectionView)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return relatedCouponArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: relatedCouponCellIdentifier, for: indexPath) as! relatedCouponCell
//        cell.imageView.image = relatedCouponArray[indexPath.row].Image
//        cell.itemLabel.text = relatedCouponArray[indexPath.row].Name!
//        cell.brandLabel.text = relatedCouponArray[indexPath.row].Brand!
//        if relatedCouponArray[indexPath.row].DiscountType == true {
//             cell.discountLabel.text = "\(relatedCouponArray[indexPath.row].Discount!)% Off"
//        }else{
//            cell.discountLabel.text = "\(convertToCurrency(value: Double(relatedCouponArray[indexPath.row].Discount)!)) Off"
//        }
//        cell.imageView.frame = CGRect(x: 5, y: 0, width: layout.itemSize.width, height: 130)
//        cell.itemLabel.frame = CGRect(x: 5, y: cell.imageView.frame.maxY + 10, width: layout.itemSize.width, height: cell.itemLabel.font.lineHeight)
//        cell.brandLabel.frame = CGRect(x: 5, y: cell.itemLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.brandLabel.font.lineHeight)
//        cell.discountLabel.frame = CGRect(x: 5, y: cell.brandLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.discountLabel.font.lineHeight + 3)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let relatedArray = relatedCouponArray[indexPath.row]
//        couponPassImage = relatedArray.Image
//        couponPassName = relatedArray.Name
//        couponPassBrand = relatedArray.Brand
//        couponPassDiscount = relatedArray.Discount
//        couponPassBarcode = relatedArray.Barcode
//        couponPassCategory = relatedArray.Category
//        couponPassExpiration = relatedArray.Expiration
//        couponPassTerms = relatedArray.Terms
//        couponPassDate = Date(fromString: relatedArray.Expiration, format: DateFormatType.isoDate)!
//        couponPassSubcategory = relatedArray.Subcategory
//        couponPassDiscountType = relatedArray.DiscountType
//        couponPassCompanyName = couponArray[indexPath.row].CompanyName
//        couponPassCUID = couponArray[indexPath.row].CompanyCUID
//        getRelatedCouponData(SelectedCategory: relatedArray.Category, SelectedSubcategory: relatedArray.Subcategory)
//        self.showCouponInfo()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? relatedCouponCell {
//                cell.alpha = 0.15
//                cell.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            }
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? relatedCouponCell {
//                cell.alpha = 1.0
//                cell.contentView.backgroundColor = UIColor.clear
//            }
//        }
//    }
//    
//    @objc func favoriteItemAction() {
//        database.collection("Users").document(currentUserUUID!).collection("Bookmarks").document(couponPassBarcode).getDocument { (snapshot, error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                if let document = snapshot {
//                    if document.exists{
//                        self.deleteItemFromDatabase()
//                        NotificationCenter.default.post(name: NSNotification.Name("reloadBookmarkedArray"), object: nil)
//                    }else{
//                        if bookmarkedArray.count >= 50 {
//                            let alert = createAlert(Title: "Error", Message: "You have reached the limit of 50 bookmarked items. Remove some bookmarked items to continue.", Style: .alert, ButtonTitle: "Ok")
//                            self.present(alert, animated: true, completion: nil)
//                        }else{
//                            self.bookmarkItem()
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    
//    func bookmarkItem(){
//        let bookmarkCouponData: [String: Any] = ["Barcode": couponPassBarcode,
//                                                "Category": couponPassCategory,
//                                                "Subcategory": couponPassSubcategory,
//                                                "Brand": couponPassBrand,
//                                                "Item": couponPassName]
//
//        let bookmarkCompanyData: [String: Any] = ["Name": couponPassCompanyName,
//                                                  "CUID": couponPassCUID]
//        
//        let bookmarkData: [String: Any] = ["Coupon": bookmarkCouponData,
//                                           "Company": bookmarkCompanyData]
//        
//        database.collection("Users").document(currentUserUUID!).collection("Bookmarks").document(couponPassBarcode).setData(bookmarkData) { error in
//            if let error = error?.localizedDescription {
//                print(error)
//            }else{
//                print("Item Appended to User Bookmark Database")
//                self.favoriteButton.image = UIImage(named: "bookmarked")
//                NotificationCenter.default.post(name: NSNotification.Name("reloadBookmarkedArray"), object: nil)
//            }
//        }
//    }
//        
//    func deleteItemFromDatabase(){
//        database.collection("Users").document(currentUserUUID!).collection("Bookmarks").document(couponPassBarcode).delete { (error) in
//            if error != nil{
//                print(error as Any)
//            }else{
//                print("Deleted Item Bookmarked From Database")
//                self.favoriteButton.image = UIImage(named: "bookmark")
//            }
//        }
//    }
//    
//    @objc func barcode(){
//        barcodeButtonRef.removeFromSuperview()
//        let barcode = UIImageView()
//        let barcodeNumber = UILabel()
//        barcode.image = codeGenerator.barcode(code: couponPassBarcode, type: .code128, size: CGSize(width: self.view.frame.width, height: self.view.frame.width/2))
//        barcode.frame = CGRect(x: 15, y: collectionView.frame.maxY + 20, width: view.frame.width - 30, height: 80)
//        barcodeNumber.font = UIFont(name: font, size: 16.0)
//        barcodeNumber.lineBreakMode = NSLineBreakMode.byWordWrapping
//        barcodeNumber.textAlignment = NSTextAlignment.center
//        barcodeNumber.numberOfLines = 0
//        barcodeNumber.text = "Barcode: \(couponPassBarcode)"
//        barcodeNumber.mixedTextColor = StandardContrastColor
//        barcodeNumber.frame = CGRect(x: 15, y: barcode.frame.maxY + 10, width: self.view.frame.width - 30, height: barcodeNumber.intrinsicContentSize.height)
//        reportErrorRef.frame = CGRect(x: 30, y: barcodeNumber.frame.maxY + 10, width: self.view.frame.width - 60, height: (reportErrorRef.titleLabel?.intrinsicContentSize.height)! + 10)
//        barcode.layer.addBorder(edge: UIRectEdge.top, color: UIColor.lightGray, thickness: 1.5)
//        scrollView.addSubview(barcode)
//        scrollView.addSubview(barcodeNumber)
//        scrollView.contentSize.height = contentRect.size.height + 110
//    }
//
//    @objc func shareCoupon() {
//        var sharedDiscount = String()
//        var sharedTerms = String()
//        
//        if couponPassTerms.isEmpty {
//            sharedTerms = "None"
//        }else{
//            sharedTerms = couponPassTerms
//        }
//        
//        if couponPassDiscountType == true {
//            sharedDiscount = "Discount: \(couponPassDiscount)% Off"
//        }else{
//            sharedDiscount = "Discount: \(convertToCurrency(value: Double(couponPassDiscount)!))"
//        }
//        
//        let activityVC = UIActivityViewController(activityItems: ["I thought you might like this coupon I found on Lynx.",
//                                                                couponPassImage,
//                                                                "\n\(couponPassName) by \(couponPassBrand)",
//                                                                "\n\(sharedDiscount)",
//                                                                "\nExpires: \(couponPassExpiration)",
//                                                                "\nTerms: \(sharedTerms)",
//                                                                "\nSent from Lynx couponing made simple. (itunes link)"],
//                                                                applicationActivities: nil)
//        activityVC.popoverPresentationController?.sourceView = self.view
//        self.present(activityVC, animated: true, completion: nil)
//    }
//    
//    func swipeGesture(){
//        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(closeView(gesture:)))
//        gesture.direction = .right
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func reportError(){
//        let view = UINavigationController(rootViewController: ReportError())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    @objc func closeView(gesture: UISwipeGestureRecognizer) {
//        self.dismiss(animated: false, completion: nil)
//        relatedCouponArray.removeAll()
//    }
//    
//    func showCouponInfo(){
//        let view = UINavigationController(rootViewController: CouponInfo())
//        self.navigationController?.present(view, animated: false, completion: nil)
//    }
//    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.mixedBackgroundColor = StandardViewColor
//        return view
//    }()
//    
//    @objc func reloadRelatedCoupons(notification: NSNotification) {
//        self.view.reloadInputViews()
//        self.updateViewConstraints()
//        self.setNeedsFocusUpdate()
//        self.collectionView.reloadData()
//        self.collectionView.reloadInputViews()
//        
//        if relatedCouponArray.count > 0 {
//            collectionView.isHidden = false
//            placeholderLabel.isHidden = true
//            if scrollView.subviews.contains(placeholderLabel){
//                placeholderLabel.removeFromSuperview()
//            }
//        }else{
//            collectionView.isHidden = true
//            placeholderLabel.isHidden = false
//        }
//    }

}

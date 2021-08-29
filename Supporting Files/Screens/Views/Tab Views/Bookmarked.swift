//
//  Bookmarked.swift
//  C4ME
//
//  Created by Omar Waked on 11/15/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import AFDateHelper
import EmptyDataSet_Swift

class BookmarkedView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    var collectionView: UICollectionView!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var editArray = false
    var cellIdentifier = "BookmarkID"
    var selectedDeleteItems = [String]()
    let placeholderLabel = createLabel(LabelText: "Your bookmarked items will appear here once bookmarked.", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 20, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBookmarkView(notification:)), name: NSNotification.Name(rawValue: "reloadBookmarkedArray"), object: nil)
        super.viewDidLoad()
        createScreenLayout()
        self.collectionView.reloadData()
        self.collectionView.reloadInputViews()
        self.collectionView.updateConstraintsIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
        self.collectionView.reloadInputViews()
        self.collectionView.updateConstraintsIfNeeded()
        
        delay(1.0) {
            if bookmarkedArray.count == 0 {
                self.view.addSubview(self.placeholderLabel)
                self.placeholderLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
                self.placeholderLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                self.placeholderLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
        checkConnection()
        self.collectionView.reloadData()
        self.collectionView.reloadInputViews()
        self.collectionView.updateConstraintsIfNeeded()
    }

    func createScreenLayout(){
        view.backgroundColor = StandardViewColor
        setupNavigationBar(LargeText: true, Title: "Bookmarked", SystemImageR: true, ImageR: true, ImageTitleR: "Edit", TargetR: self, ActionR: #selector(self.editBookmarked), SystemImageL: false, ImageL: false, ImageTitleL: "", TargetL: nil, ActionL: nil)

        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        layout.itemSize = CGSize(width: self.view.bounds.width/2, height: 245)
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 50
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - (UITabBar.appearance().frame.height + (navigationController?.navigationBar.frame.height)!)), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(bookmarkedCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.backgroundColor = StandardViewColor
        collectionView.showsVerticalScrollIndicator = true
        collectionView.allowsMultipleSelection = false
        collectionView.allowsSelection = true
        self.view.addSubview(collectionView)
    
    }
    
    @objc func editBookmarked(){
        for row in 0..<(collectionView?.numberOfItems(inSection: 0) ?? 0) {
            collectionView.cellForItem(at: IndexPath(row: row, section: 0))?.alpha = 0.5
        }
        editArray = true
        collectionView.allowsMultipleSelection = true
        self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "Cancel", Target: self, Action: #selector(self.cancelEdit))
        self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: "Delete", Target: nil, Action: #selector(self.deleteSelected))
    }
    
    @objc func cancelEdit(){
        if let cell = collectionView.cellForItem(at: indexPath) as? bookmarkedCell {
            editArray = false
            cell.isSelected = false
            for row in 0..<(collectionView?.numberOfItems(inSection: 0) ?? 0) {
                collectionView.cellForItem(at: IndexPath(row: row, section: 0))?.alpha = 1.0
            }
            collectionView.allowsMultipleSelection = false
            self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "Edit", Target: self, Action: #selector(self.editBookmarked))
            self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
        }
    }
    
    @objc func deleteSelected(){
        if bookmarkedArray.count > 0 {
            for bookmarkedItem in selectedDeleteItems {
                database.collection("Users").document(currentUserUUID!).collection("Bookmarks").document(bookmarkedItem).delete { (error) in
                    if error != nil{
                        print(error as Any)
                    }else{
                        print("Deleted Item Bookmarked From Database")
                        if let i = (bookmarkedArray.index {$0.Barcode == bookmarkedItem}) {
                            bookmarkedArray.remove(at: i)
                        }
                    }
                }
            }
            collectionView.reloadData()
            collectionView.reloadInputViews()
            self.navigationItem.leftBarButtonItem = createBarButtonItem(Image: false, Title: "", Target: nil, Action: nil)
            self.navigationItem.rightBarButtonItem = createBarButtonItem(Image: false, Title: "Edit", Target: self, Action: #selector(self.editBookmarked))
        }else{
            cancelEdit()
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookmarkedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! bookmarkedCell
            cell.imageView.image = bookmarkedArray[indexPath.row].Image
            cell.itemLabel.text = bookmarkedArray[indexPath.row].Name
            cell.brandLabel.text = bookmarkedArray[indexPath.row].Brand
            cell.imageView.frame = CGRect(x: 0, y: 0, width: layout.itemSize.width, height: 210)
            cell.itemLabel.frame = CGRect(x: 0, y: cell.imageView.frame.maxY + 5, width: layout.itemSize.width, height: cell.itemLabel.intrinsicContentSize.height)
            cell.brandLabel.frame = CGRect(x: 0, y: cell.itemLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.brandLabel.intrinsicContentSize.height)
            cell.discountLabel.frame = CGRect(x: 0, y: cell.brandLabel.frame.maxY + 5, width: layout.itemSize.width, height: cell.discountLabel.intrinsicContentSize.height + 5)
            let checkDate = Date(fromString: bookmarkedArray[indexPath.row].Expiration, format: .isoDate)!
            if checkDate.compare(.isToday) || checkDate.compare(.isInTheFuture){
                cell.discountLabel.mixedTextColor = StandardContrastColor
            }else{
                cell.discountLabel.textColor = UIColor.red
            }
            if bookmarkedArray[indexPath.row].DiscountType == true {
                cell.discountLabel.text = "\(bookmarkedArray[indexPath.row].Discount!)% Off"
            }else{
                cell.discountLabel.text = "\(convertToCurrency(value: Double(bookmarkedArray[indexPath.row].Discount)!)) Off"
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? bookmarkedCell {
            if editArray == false {
                cell.alpha = 1.0
                couponPassImage = bookmarkedArray[indexPath.row].Image
                couponPassName = bookmarkedArray[indexPath.row].Name
                couponPassBrand = bookmarkedArray[indexPath.row].Brand
                couponPassDiscount = bookmarkedArray[indexPath.row].Discount
                couponPassBarcode = bookmarkedArray[indexPath.row].Barcode
                couponPassCategory = bookmarkedArray[indexPath.row].Category
                couponPassExpiration = bookmarkedArray[indexPath.row].Expiration
                couponPassTerms = bookmarkedArray[indexPath.row].Terms
                couponPassSubcategory = bookmarkedArray[indexPath.row].Subcategory
                couponPassDiscountType = bookmarkedArray[indexPath.row].DiscountType
                self.showCouponInfo()
            }else{
                cell.alpha = 0.3
                selectedDeleteItems.append(bookmarkedArray[indexPath.row].Barcode)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? bookmarkedCell {
                cell.alpha = 0.15
                cell.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? bookmarkedCell {
                cell.alpha = 1
                cell.contentView.backgroundColor = UIColor.clear
            }
        }
    }
    
    func showCouponInfo(){
        let navController = UINavigationController(rootViewController: CouponInfo())
        self.navigationController?.present(navController, animated: false, completion: nil)
    }
    
    @objc func reloadBookmarkView(notification: NSNotification) {
        self.collectionView.reloadData()
        self.collectionView.reloadInputViews()
        self.collectionView.updateConstraintsIfNeeded()
        
        if view.subviews.contains(placeholderLabel){
            placeholderLabel.removeFromSuperview()
        }
    }

}

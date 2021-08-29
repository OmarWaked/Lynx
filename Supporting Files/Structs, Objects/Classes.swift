//
//  Classes.swift
//  C4ME
//
//  Created by Omar Waked on 6/12/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import Alamofire
import UIKit

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

func checkConnection(){
    if Connectivity.isConnectedToInternet == false{
        UIApplication.shared.keyWindow!.rootViewController = ConnectivityViewController()
    }else{
        //Dismiss connectivity view
    }
}

class homeCell: UICollectionViewCell {
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 30, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(itemLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class featuredCell: UICollectionViewCell {
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 19, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 16, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let discountLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 15, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(itemLabel)
        addSubview(discountLabel)
        addSubview(brandLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class relatedCouponCell: UICollectionViewCell{
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 17, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 15, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let discountLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 17, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(itemLabel)
        addSubview(discountLabel)
        addSubview(brandLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//SEARCH VIEW CELL
class searchCell: UICollectionViewCell {
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 14, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 13, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let discountLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 14, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(itemLabel)
        addSubview(brandLabel)
        addSubview(discountLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//BOOKMARK VIEW CELL
class bookmarkedCell: UICollectionViewCell {
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 14, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 13, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let discountLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 14, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(itemLabel)
        addSubview(brandLabel)
        addSubview(discountLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class couponCell: UICollectionViewCell {
    let imageView = createImage(Image: UIImage(), ContentMode: .scaleAspectFit, BackgroundColor: .clear)
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 15, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 15, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let discountLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 13, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(itemLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(discountLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class transactionCell: UITableViewCell {
    var brand: String?
    var item: String?
    var price: String?
    var quantity: String?
    var number: String?
    var savings: String?

    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 14, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let priceLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .right, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let savingsLabel = createLabel(LabelText: "", TextColor: StandardTintColor, FontName: standardFont, FontSize: 16, TextAlignment: .right, TextBreak: .byWordWrapping, NumberOfLines: 0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        self.addSubview(brandLabel)
        self.addSubview(itemLabel)
        self.addSubview(priceLabel)
        self.addSubview(savingsLabel)
        
        brandLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        brandLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true

        itemLabel.leftAnchor.constraint(equalTo: self.brandLabel.leftAnchor).isActive = true
        itemLabel.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 5).isActive = true
        itemLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 50).isActive = true
        
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        savingsLabel.rightAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: 0).isActive = true
        savingsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        brandLabel.text = brand
        itemLabel.text = item
        priceLabel.text = price
        savingsLabel.text = savings
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class purchaseHistoryCell: UITableViewCell {
    var store: String?
    var date: String?
    var total: String?
    var savings: String?
    var document: String?
    
    let dateLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 17, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let storeLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let totalLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let savingsLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .left, TextBreak: .byClipping, NumberOfLines: 0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(storeLabel)
        self.addSubview(dateLabel)
        self.addSubview(totalLabel)
        self.addSubview(savingsLabel)
        
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        storeLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5).isActive = true
        storeLabel.leftAnchor.constraint(equalTo: self.dateLabel.leftAnchor).isActive = true
        
        savingsLabel.topAnchor.constraint(equalTo: self.storeLabel.bottomAnchor, constant: 5).isActive = true
        savingsLabel.leftAnchor.constraint(equalTo: self.dateLabel.leftAnchor).isActive = true
        
        totalLabel.topAnchor.constraint(equalTo: self.savingsLabel.bottomAnchor, constant: 5).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: self.dateLabel.leftAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        storeLabel.text = store
        dateLabel.text = date
        totalLabel.text = total
        savingsLabel.text = savings
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class transactionDetailedHistoryCell: UITableViewCell {
    var item: String?
    var brand: String?
    var price: String?
    var quantity: String?
    var barcode: String?
    var savings: String?
    
    let itemLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 15, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let brandLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let priceLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .right, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let savingsLabel = createLabel(LabelText: "", TextColor: StandardRedColor, FontName: standardFont, FontSize: 16, TextAlignment: .right, TextBreak: .byWordWrapping, NumberOfLines: 0)
    let quantityLabel = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: standardFont, FontSize: 16, TextAlignment: .left, TextBreak: .byWordWrapping, NumberOfLines: 0)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(quantityLabel)
        self.addSubview(brandLabel)
        self.addSubview(priceLabel)
        self.addSubview(savingsLabel)
        self.addSubview(itemLabel)
        
        quantityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        quantityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        brandLabel.leftAnchor.constraint(equalTo: self.quantityLabel.rightAnchor, constant: 15).isActive = true
        brandLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        savingsLabel.rightAnchor.constraint(equalTo: self.priceLabel.rightAnchor, constant: 0).isActive = true
        savingsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        
        itemLabel.rightAnchor.constraint(equalTo: self.priceLabel.leftAnchor, constant: -2).isActive = true
        itemLabel.leftAnchor.constraint(equalTo: self.brandLabel.leftAnchor).isActive = true
        itemLabel.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        quantityLabel.text = quantity
        brandLabel.text = brand
        priceLabel.text = price
        savingsLabel.text = savings
        itemLabel.text = item
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class accountCell: UITableViewCell {
    let textField: UITextField = {
        let label = UITextField()
        label.font = UIFont(name: "GillSans", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = true
        label.keyboardType = UIKeyboardType.emailAddress
        label.returnKeyType = UIReturnKeyType.next
        label.autocorrectionType = UITextAutocorrectionType.no
        label.autocapitalizationType = UITextAutocapitalizationType.none
        label.setBottomBorderNotSelected()
        label.mixedTextColor = StandardContrastColor
        label.mixedKeyboardAppearance = MixedKeyboardAppearance(normal: UIKeyboardAppearance.light, night: UIKeyboardAppearance.dark)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


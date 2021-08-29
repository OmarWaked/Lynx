//
//  Objects.swift
//  C4ME
//
//  Created by Omar Waked on 8/29/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import UIKit
import Lottie
import KMPlaceholderTextView

func createLabel(LabelText: String, TextColor: UIColor, FontName: String, FontSize: CGFloat, TextAlignment: NSTextAlignment, TextBreak: NSLineBreakMode, NumberOfLines: Int) -> UILabel{
    let label = UILabel()
    label.text = LabelText
    label.font = UIFont(name: FontName, size: FontSize)
    label.textAlignment = TextAlignment
    label.lineBreakMode = TextBreak
    label.numberOfLines = NumberOfLines
    label.textColor = TextColor
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
}

func createButton(Title: String, FontName: String, FontSize: CGFloat, FontColor: UIColor, BorderWidth: CGFloat, CornerRaduis: CGFloat, BackgroundColor: UIColor, BorderColor: CGColor, Target: Any, Action: Selector) -> UIButton {
    let button = UIButton()
    button.setTitle(Title, for: UIControl.State.normal)
    button.titleLabel?.font = UIFont(name: FontName, size: FontSize)
    button.layer.borderWidth = BorderWidth
    button.layer.cornerRadius = CornerRaduis
    button.backgroundColor = BackgroundColor
    button.layer.borderColor = BorderColor
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.textAlignment = NSTextAlignment.center
    button.titleLabel?.adjustsFontSizeToFitWidth = false
    button.setTitleColor(FontColor, for: UIControl.State.normal)
    button.addTarget(Target, action: Action, for: UIControl.Event.touchUpInside)
    return button
}

func createTextField(FontName: String, FontSize: CGFloat, KeyboardType: UIKeyboardType, ReturnType: UIReturnKeyType, BackgroundColor: UIColor, SecuredEntry: Bool, Placeholder: String, Target: Any) -> UITextField {
    let textField = UITextField()
    textField.font = UIFont(name: FontName, size: FontSize)
    textField.keyboardType = KeyboardType
    textField.returnKeyType = ReturnType
    textField.isSecureTextEntry = SecuredEntry
    textField.textAlignment = NSTextAlignment.left
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = BackgroundColor
    textField.adjustsFontSizeToFitWidth = true
    textField.autocorrectionType = UITextAutocorrectionType.no
    textField.autocapitalizationType = UITextAutocapitalizationType.none
    textField.attributedPlaceholder = NSAttributedString(string: Placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont(name: FontName, size: FontSize)!])
    textField.textColor = standardBackgroundColor
    textField.keyboardAppearance = UIKeyboardAppearance.default
    textField.setLeftPaddingPoints(10)
    textField.setRightPaddingPoints(10)
    textField.setBottomBorderNotSelected()
    return textField
}

func createSearchBar() -> UISearchBar {
    let searchBar = UISearchBar()
    searchBar.searchBarStyle = UISearchBar.Style.minimal
    searchBar.placeholder = "enter your destination"
    searchBar.sizeToFit()
    searchBar.searchTextField.font = UIFont(name: font, size: 20)
    searchBar.searchTextField.borderStyle = .none
    searchBar.searchTextField.layer.masksToBounds = true
    searchBar.searchTextField.addBorderBottom(size: 2, color: standardContrastColor)
    return searchBar
}

func createImage(Image: UIImage, ContentMode: UIView.ContentMode, BackgroundColor: UIColor) -> UIImageView {
    let image = UIImageView()
    image.contentMode = ContentMode
    image.image = Image
    image.backgroundColor = BackgroundColor
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
}

func createSwitch(Target: Any, Action: Selector, State: Bool) -> UISwitch {
    let switchButton = UISwitch()
    switchButton.addTarget(Target, action: Action, for: UIControl.Event.valueChanged)
    switchButton.isOn = State
    switchButton.translatesAutoresizingMaskIntoConstraints = false
    return switchButton
}

func createSlider(Min: Float, Max: Float,Color: UIColor) -> UISlider {
    let slider = UISlider()
    slider.minimumValue = Min
    slider.maximumValue = Max
    slider.tintColor = Color
    return slider
}

func createTableView(Cell: AnyClass, CellIdentifier: String, Scroll: Bool, Select: Bool, RowHeight: CGFloat, SeperatorColor: UIColor) -> UITableView {
    let tableview = UITableView()
    tableview.register(Cell, forCellReuseIdentifier: CellIdentifier)
    tableview.isScrollEnabled = Scroll
    tableview.allowsSelection = Select
    tableview.rowHeight = RowHeight
    tableview.separatorColor = SeperatorColor
    let adjustForTabbarInsets: UIEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: UITabBar.appearance().frame.height, right: 0)
    tableview.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    tableview.indicatorStyle = UIScrollView.IndicatorStyle.black
    tableview.contentMode = .scaleAspectFit
    tableview.backgroundColor = standardBackgroundColor
    tableview.contentInset = adjustForTabbarInsets
    tableview.scrollIndicatorInsets = adjustForTabbarInsets
    return tableview
}


func createBarButtonItem(SystemImage: Bool, Image:Bool, Title:String, Target: Any?, Action: Selector?) -> UIBarButtonItem {
    var barButtonItem = UIBarButtonItem()
    if Image == false {
        barButtonItem = UIBarButtonItem(title: Title, style: .plain, target: Target, action: Action)
    }else if SystemImage == true{
        barButtonItem = UIBarButtonItem(image: UIImage(systemName: Title), style: .plain, target: Target, action: Action)
    }else if Image == true && SystemImage == false{
        barButtonItem = UIBarButtonItem(image: UIImage(named: Title), style: .plain, target: Target, action: Action)
    }
    return barButtonItem
}

func createView() -> UIView {
    let view = UIView()
    view.backgroundColor = standardBackgroundColor.withAlphaComponent(0.7)
    view.dropShadow()
    view.addBorderBottom(size: 1.5, color: UIColor.white)
    return view
}

func createPopupView(Radius: CGFloat, BorderColor: CGColor, BorderWidth: CGFloat) -> UIView {
    let view = UIView()
    view.layer.cornerRadius = Radius
    view.layer.borderColor = BorderColor
    view.layer.borderWidth = BorderWidth
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = standardBackgroundColor.withAlphaComponent(0.7)
    return view
}

func createViewOverlay() -> UIView {
    let viewOverlay = UIView(frame: UIScreen.main.bounds)
    viewOverlay.backgroundColor = standardBackgroundColor
    return viewOverlay
}


func setNavigationBarAttributes(self: UIViewController){
    self.navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
    self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
    self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
    self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(buttonAttributes, for: UIControl.State())
    self.navigationController?.setNavigationBarHidden(true, animated: false)
}

func popupNavigationBarAttributes(self: UIViewController, title: String, action: Selector) {
    self.view.backgroundColor = standardBackgroundColor
    self.navigationItem.title = title
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    self.navigationController?.navigationBar.prefersLargeTitles = false
    self.navigationController?.navigationBar.isTranslucent = false
    self.navigationController?.view.backgroundColor = standardBackgroundColor
    self.navigationController?.navigationBar.barTintColor = standardBackgroundColor
    self.navigationController?.navigationBar.tintColor = standardContrastColor
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: UIBarButtonItem.Style.done, target: self, action: action)
}

func removeView(self: UIViewController)  {
    UIView.animate(withDuration: 0.10, animations: {
        self.view.alpha = 0
        self.tabBarController?.tabBar.isHidden = false
    }, completion: { (false) in
        self.dismiss(animated: false, completion: nil)
    })
}

func selectCell(Cell: UITableViewCell!, isSelected: Bool, Filter: Bool){
    if isSelected == true{
        Cell.accessoryType =  UITableViewCell.AccessoryType.checkmark
            Cell.addBorderLeft(size: 3.0, color: standardContrastColor)
    }else{
        if Filter == true {
            Cell.accessoryType =  UITableViewCell.AccessoryType.disclosureIndicator
                Cell.addBorderLeft(size: 3.0, color: standardBackgroundColor)
        }else{
            Cell.accessoryType =  UITableViewCell.AccessoryType.none
                Cell.addBorderLeft(size: 3.0, color: standardBackgroundColor)
        }
    }
}

func createAnimationView(Animation: String, Speed: CGFloat) -> AnimationView {
    let animationView = AnimationView(name: Animation)
    animationView.animationSpeed = Speed
    animationView.contentMode = .scaleAspectFill
    animationView.translatesAutoresizingMaskIntoConstraints = false
    return animationView
}

func showView(self: UIViewController, ViewController: UIViewController){
    self.navigationController?.pushViewController(ViewController, animated: false)
    self.tabBarController?.tabBar.isHidden = true
}

func createPaymentButton(Target: Any, Action: Selector) -> UIButton {
    let button = PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .whiteOutline) //MARK: THIS NEEDS TO BE OPPOSITE OF THE THEME
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(Target, action: Action, for: UIControl.Event.touchUpInside)
    button.cornerRadius = 12
    button.layer.borderColor = UIColor.clear.cgColor
    return button
}

let slider: UISlider = {
    let slider = UISlider()
    slider.minimumTrackTintColor = .gray
    slider.maximumTrackTintColor = .darkGray
    slider.thumbTintColor = standardContrastColor
    slider.maximumValue = 10
    slider.minimumValue = 0
    slider.setValue(0, animated: false)
    return slider
}()


func getMinutesDifferenceFromTwoDates(start: Date, end: Date) -> Int{
    let diff = Int(end.timeIntervalSince1970 - start.timeIntervalSince1970)
    let hours = diff / 3600
    let minutes = (diff - hours * 3600) / 60
    return minutes
}

func convertToMiles(Value: Double) -> String {
    let meters: Measurement<UnitLength> = .init(value: Value, unit: .meters)
    let miles = meters.converted(to: .miles)
    let formatted = miles.usFormatted
    return formatted
}

func convertToFeet(Value: Double) -> String {
    let meters: Measurement<UnitLength> = .init(value: Value, unit: .meters)
    let feet = meters.converted(to: .feet)
    let formatted = feet.usFormatted
    return formatted
}

func convertToString(Number: NSNumber) -> String{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 3
    return formatter.string(from: Number)!
}

func convertToTime(Value: NSNumber, Style: DateComponentsFormatter.UnitsStyle) -> String {
    let interval = Double(truncating: Value)*60

    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute]
    formatter.unitsStyle = Style

    let conversion = formatter.string(from: TimeInterval(interval))!
    return conversion
}

func pullPlistData(Data: String) -> String{
    return Bundle.main.object(forInfoDictionaryKey: Data) as! String
}

//
//  ReportError.swift
//  C4ME
//
//  Created by Omar Waked on 7/3/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import Lottie

var selectedCells = [String]()

class ReportError: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UITextViewDelegate {
//
//    var errorType = ["Category","Discount","Expiration","Item","Terms & Conditions","Other"]
//    var contentRect = CGRect.zero
//    let tableView = createTableView(Cell: UITableViewCell.self, CellIdentifier: "errorCell", Scroll: false, Select: true, RowHeight: 50, SeperatorColor: .clear)
//    let sendButton = createButton(Title: "Sumbit Report", FontName: font, FontSize: 23, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(sendReport))
//    let additionalInformation = createLabel(LabelText: "Additional Information", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 21, TextAlignment: .left, TextBreak: .byClipping, NumberOfLines: 0)
//    let errorExplination = createTextBox()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(scrollView)
//        createScreenLayout()
//        errorExplination.delegate = self
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name(rawValue: "keyboardDidShowNotification"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name("keyboardWillHideNotification"), object: nil)
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
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "keyboardDidShowNotification"), object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("keyboardWillHideNotification"), object: nil)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        scrollView.needsUpdateConstraints()
//        checkConnection()
//        tableView.reloadData()
//        tableView.reloadInputViews()
//    }
//    
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scrollView.showsVerticalScrollIndicator = false
//
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.allowsMultipleSelection = true
//        
//        self.navigationItem.title = "Report an Error"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        tableView.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 340)
//        
//        scrollView.addSubview(tableView)
//        scrollView.addSubview(additionalInformation)
//        scrollView.addSubview(errorExplination)
//        scrollView.addSubview(sendButton)
//        
//        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
//        tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        tableView.heightAnchor.constraint(equalToConstant: 340).isActive = true
//        
//        additionalInformation.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
//        additionalInformation.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
//        
//        errorExplination.topAnchor.constraint(equalTo: additionalInformation.bottomAnchor, constant: 10).isActive = true
//        errorExplination.widthAnchor.constraint(equalToConstant: self.view.frame.width - 30).isActive = true
//        errorExplination.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        errorExplination.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        
//        sendButton.topAnchor.constraint(equalTo: errorExplination.bottomAnchor, constant: 50).isActive = true
//        sendButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        sendButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 50).isActive = true
//        sendButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 50)/5.5).isActive = true
//        
//        for view in scrollView.subviews {
//            contentRect = contentRect.union(view.frame)
//        }
//        scrollView.contentSize.width = self.view.frame.width
//        scrollView.contentSize.height = contentRect.size.height + 40
//        scrollView.bottomAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 20).isActive = true
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return errorType.count
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.mixedBackgroundColor = StandardViewColor
//        let headerLabel = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 30, height: 26))
//        headerLabel.font = UIFont(name: fontBold, size: 20)
//        headerLabel.mixedTextColor = StandardContrastColor
//        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Error Type"
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "errorCell", for: indexPath)
//        cell.textLabel?.font = UIFont(name: font, size: 17)
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none
//        cell.textLabel?.mixedTextColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.accessoryView?.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//        cell.textLabel?.textAlignment = NSTextAlignment.left
//        cell.mixedBackgroundColor = StandardViewColor
//        cell.textLabel?.text = errorType[indexPath.row]
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        selectedCells.append((cell?.textLabel?.text)!)
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = StandardViewColor
//            selectCell(Cell: cell, isSelected: true, Filter: false)
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        selectedCells.removeAll(where: {$0 == cell?.textLabel?.text!})
//        UIView.animate(withDuration: 0.5) {
//            cell?.contentView.mixedBackgroundColor = MixedColor(normal: UIColor.white.withAlphaComponent(0.7), night: UIColor.black.withAlphaComponent(0.7))
//            selectCell(Cell: cell, isSelected: false, Filter: false)
//        }
//        return
//    }
//    
//    @objc func closeView() {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.dismiss(animated: false, completion: nil)
//        })
//    }
//    
//    @objc func sendReport(){
//        if selectedCells.count > 0 && errorExplination.text?.isEmpty == false {
//            sendErrorReport()
//        }else{
//            let alert = createAlert(Title: "Please select at least one error with the coupon and provide additional information.", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//            errorExplination.resignFirstResponder()
//        }
//    }
//    
//    func sendErrorReport(){
//        let errorData: [String: Any] = ["Error Type": selectedCells,
//                                        "Error Detail": errorExplination.text!,
//                                        "Error Item Barcode": couponPassBarcode,
//                                        "Error Item Brand": couponPassBrand,
//                                        "Error Item Label": couponPassName,
//                                        "Error Item Category": couponPassCategory,
//                                        "Error Item Subcategory": couponPassSubcategory,
//                                        "User UUID": currentUserUUID!,
//                                        "User Email": currentUserEmail!
//                                       ]
//        
//        functions.httpsCallable("sendReportError").call(errorData) { (result, error) in
//            if let error = error as NSError? {
//                if error.domain == FunctionsErrorDomain {
//                    functionError = true
//                    let message = error.localizedDescription
//                    errorMessage = "\(message)"
//                }
//                functionError = true
//                let alert = createAlert(Title: errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                self.present(alert, animated: false, completion: nil)
//            }else{
//                functionError = false
//                self.successAnimatin()
//            }
//        }
//    }
//    
//    
//    
//    
//    func successAnimatin(){
//        errorExplination.resignFirstResponder()
//        
//        let blacksubView = createViewOverlay()
//        UIApplication.shared.keyWindow!.addSubview(blacksubView)
//        
//        let animationView = createAnimationView(Animation: "success", Speed: 0.25)
//        
//        blacksubView.addSubview(animationView)
//        animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        animationView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        animationView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        
//        let label = createLabel(LabelText: "Thank you for your feedback. \nThe error will be addressed.", TextColor: StandardContrastColor, FontName: font, FontSize: 23, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//        
//        blacksubView.addSubview(label)
//        
//        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: self.view.frame.width - 30).isActive = true
//        
//        animationView.play { (false) in
//            UIView.animate(withDuration: 0.25, animations: {
//                blacksubView.alpha = 0.5
//            }) { (false) in
//                blacksubView.removeFromSuperview()
//                self.closeView()
//            }
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//        errorExplination.resignFirstResponder()
//    }
//    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if(text == "\n") {
//            textView.resignFirstResponder()
//            return false
//        }
//        return true
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        self.view.endEditing(true)
//        textView.resignFirstResponder()
//    }
//    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.mixedBackgroundColor = StandardViewColor
//        return view
//    }()
//    
//    
//    @objc func keyboardWasShown(notification: NSNotification){
//        let info = notification.userInfo!
//        var kbRect = (info[UIResponder.keyboardFrameEndUserInfoKey]! as! NSValue).cgRectValue
//        kbRect = view.convert(kbRect, from: nil)
//        
//        var contentInsets = errorExplination.contentInset
//        contentInsets.bottom = kbRect.size.height
//        errorExplination.contentInset = contentInsets
//        errorExplination.scrollIndicatorInsets = contentInsets
//    }
//    
//    @objc func keyboardWillBeHidden(notification: NSNotification){
//        var contentInsets = errorExplination.contentInset
//        contentInsets.bottom = 0.0
//        errorExplination.contentInset = contentInsets
//        errorExplination.scrollIndicatorInsets = contentInsets
//    }
}

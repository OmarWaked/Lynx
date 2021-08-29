//
//  ChangePasswordView.swift
//  C4ME
//
//  Created by Omar Waked on 7/8/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class ChangePasswordView: UIViewController, UITextFieldDelegate{
//
//    let changeButton = createButton(Title: "Change Password", FontName: font, FontSize: 23, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(changePassword))
//    let currentPasswordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "Current Password")
//    let newPasswordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "New Password")
//    let newPasswordVerifyTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "Verify New Password")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.reloadInputViews()
//        createScreenLayout()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
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
//        self.navigationItem.title = "Change Password"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        currentPasswordTextField.delegate = self
//        newPasswordTextField.delegate = self
//        newPasswordVerifyTextField.delegate = self
//        
//        view.addSubview(currentPasswordTextField)
//        view.addSubview(newPasswordTextField)
//        view.addSubview(newPasswordVerifyTextField)
//        view.addSubview(changeButton)
//        
//        currentPasswordTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -90).isActive = true
//        currentPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        currentPasswordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        newPasswordTextField.topAnchor.constraint(equalTo: currentPasswordTextField.bottomAnchor, constant: 30).isActive = true
//        newPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        newPasswordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        newPasswordVerifyTextField.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 30).isActive = true
//        newPasswordVerifyTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        newPasswordVerifyTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        changeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        changeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        changeButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        changeButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if currentPasswordTextField.isEditing == true {
//            currentPasswordTextField.setBottomBorderSelected()
//        }
//        if newPasswordTextField.isEditing == true {
//            newPasswordTextField.setBottomBorderSelected()
//        }
//        if newPasswordVerifyTextField.isEditing == true {
//            newPasswordVerifyTextField.setBottomBorderSelected()
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if currentPasswordTextField.isEditing == false {
//            currentPasswordTextField.setBottomBorderNotSelected()
//        }
//        if newPasswordTextField.isEditing == false {
//            newPasswordTextField.setBottomBorderNotSelected()
//        }
//        if newPasswordVerifyTextField.isEditing == false {
//            newPasswordVerifyTextField.setBottomBorderNotSelected()
//        }
//    }
//    
//    func textFieldhide(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func updatePassword(){
//        if newPasswordTextField.text == newPasswordVerifyTextField.text || newPasswordVerifyTextField.text == newPasswordTextField.text {
//            Auth.auth().currentUser?.updatePassword(to: newPasswordTextField.text!, completion: { (error) in
//                if error != nil{
//                    if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                        let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }else{
//                    let alert = createAlert(Title: "Password Successfuly Updated", Message: "", Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }
//            })
//        }else{
//            let alert = createAlert(Title: "Passwords do not match", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    @objc func changePassword(){
//        emptyTextField()
//        let credential = EmailAuthProvider.credential(withEmail: currentUserEmail!, password: currentPasswordTextField.text!)
//        user?.reauthenticateAndRetrieveData(with: credential, completion: { (auth, error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                self.updatePassword()
//            }
//        })
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if newPasswordVerifyTextField.isEditing == true && newPasswordTextField.text?.isEmpty == false && currentPasswordTextField.text?.isEmpty == false && newPasswordVerifyTextField.text?.isEmpty == false{
//            changePassword()
//            textField.resignFirstResponder()
//        }else{
//            if currentPasswordTextField.isEditing == true && currentPasswordTextField.text?.isEmpty == false {
//                newPasswordTextField.becomeFirstResponder()
//            }else{
//                if newPasswordTextField.isEditing == true && newPasswordTextField.text?.isEmpty == false {
//                    newPasswordVerifyTextField.becomeFirstResponder()
//                }
//            }
//        }
//        return false
//    }
//    
//    func emptyTextField(){
//        if currentPasswordTextField.text?.isEmpty == true || newPasswordTextField.text?.isEmpty == true || newPasswordVerifyTextField.text?.isEmpty == true  {
//            let alert = createAlert(Title: "All text fields must be filled out", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    @objc func closeView() {
//        UIView.animate(withDuration: 0.10, animations: {
//            self.view.alpha = 0
//        }, completion: { (false) in
//            self.dismiss(animated: false, completion: nil)
//        })
//    }

}

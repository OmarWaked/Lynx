//
//  ChangeEmailView.swift
//  C4ME
//
//  Created by Omar Waked on 7/8/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class ChangeEmailView: UIViewController, UITextFieldDelegate {
//    
//    let changeButton = createButton(Title: "Change Email", FontName: font, FontSize: 23, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(changeEmail))
//    let currentEmailTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .emailAddress, ReturnType: .next, SecuredEntry: false, Placeholder: "Current Email")
//    let newEmailTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .emailAddress, ReturnType: .next, SecuredEntry: false, Placeholder: "New Email")
//    let passwordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "Password")
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
//        self.navigationItem.title = "Change Email"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//
//        currentEmailTextField.delegate = self
//        newEmailTextField.delegate = self
//        passwordTextField.delegate = self
//        currentEmailTextField.text = Auth.auth().currentUser?.email!
//        currentEmailTextField.isUserInteractionEnabled = false
//        view.addSubview(currentEmailTextField)
//        view.addSubview(newEmailTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(changeButton)
//        
//        currentEmailTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -90).isActive = true
//        currentEmailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        currentEmailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        newEmailTextField.topAnchor.constraint(equalTo: currentEmailTextField.bottomAnchor, constant: 30).isActive = true
//        newEmailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        newEmailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        passwordTextField.topAnchor.constraint(equalTo: newEmailTextField.bottomAnchor, constant: 30).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
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
//        if currentEmailTextField.isEditing == true {
//            currentEmailTextField.setBottomBorderSelected()
//        }
//        if newEmailTextField.isEditing == true {
//            newEmailTextField.setBottomBorderSelected()
//        }
//        if passwordTextField.isEditing == true {
//            passwordTextField.setBottomBorderSelected()
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if currentEmailTextField.isEditing == false {
//            currentEmailTextField.setBottomBorderNotSelected()
//        }
//        if newEmailTextField.isEditing == false {
//            newEmailTextField.setBottomBorderNotSelected()
//        }
//        if passwordTextField.isEditing == false {
//            passwordTextField.setBottomBorderNotSelected()
//        }
//    }
//    
//    func textFieldhide(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func updateEmail(){
//        if newEmailTextField.text! != currentUserEmail!{
//            Auth.auth().currentUser?.updateEmail(to: newEmailTextField.text!, completion: { (error) in
//                if error != nil{
//                    if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                        let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }else{
//                    let structData: [String: Any] = ["Email": self.newEmailTextField.text!]
//                    database.collection("Users").document(currentUserUUID!).updateData(structData) { (error) in
//                        if error != nil{
//                        }else{
//                         print("updated database email")
//                        }
//                    }
//                }
//                let alert = createAlert(Title: "Success", Message: "Your email has been updated.", Style: .alert, ButtonTitle: "Ok")
//                self.present(alert, animated: true, completion: nil)
//            })
//        }else{
//            let alert = createAlert(Title: "Account with that email is in use", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    @objc func changeEmail(){
//        emptyTextField()
//        let credential = EmailAuthProvider.credential(withEmail: currentUserEmail!, password: passwordTextField.text!)
//        user?.reauthenticateAndRetrieveData(with: credential, completion: { (auth, error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                self.updateEmail()
//            }
//        })
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if currentEmailTextField.isEditing == true && newEmailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false{
//            changeEmail()
//            textField.resignFirstResponder()
//        }else{
//            if newEmailTextField.isEditing == true && newEmailTextField.text?.isEmpty == false {
//                passwordTextField.becomeFirstResponder()
//            }else{
//                if passwordTextField.isEditing == true && passwordTextField.text?.isEmpty == false {
//                    changeEmail()
//                    textField.resignFirstResponder()
//                }
//            }
//        }
//        return false
//    }
//    
//    func emptyTextField(){
//        if currentEmailTextField.text?.isEmpty == true || newEmailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true  {
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

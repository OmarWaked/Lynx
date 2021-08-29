//
//  CreateAccount.swift
//  C4ME
//
//  Created by Omar Waked on 12/27/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication
import Lottie

class CreateAccount: UIViewController, UITextFieldDelegate{
//    
//    let emailTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .emailAddress, ReturnType: .next, SecuredEntry: false, Placeholder: "Email")
//    let nameTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: false, Placeholder: "Name")
//    let passwordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "Password")
//    let passwordVerifyTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .next, SecuredEntry: true, Placeholder: "Verify Password")
//    let createAccountButton = createButton(Title: "Next", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(login))
//    let loginButton = createButton(Title: "Have an account? Log In", FontName: font, FontSize: 15, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(login))
//    let privacyPolicyButton = createButton(Title: "Privacy Policy", FontName: font, FontSize: 14, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(viewPrivacyPolicy))
//   
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createScreenLayout()
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
//        
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationItem.title = "Sign Up"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.view.backgroundColor = .clear
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeView))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.mixedTintColor = MixedColor(normal: UIColor.black, night: UIColor.white)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        setNeedsStatusBarAppearanceUpdate()
//        checkConnection()
//    }
//    
//    func createScreenLayout(){
//        view.mixedBackgroundColor = StandardViewColor
//        
//        emailTextField.delegate = self
//        nameTextField.delegate = self
//        passwordTextField.delegate = self
//        passwordVerifyTextField.delegate = self
//
//        view.addSubview(emailTextField)
//        view.addSubview(nameTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(passwordVerifyTextField)
//        view.addSubview(privacyPolicyButton)
//        view.addSubview(loginButton)
//        view.addSubview(createAccountButton)
//        
//        
//        emailTextField.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -180).isActive = true
//        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        emailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        nameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
//        nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        passwordVerifyTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
//        passwordVerifyTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordVerifyTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        privacyPolicyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
//        privacyPolicyButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        privacyPolicyButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        privacyPolicyButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//        loginButton.bottomAnchor.constraint(equalTo: privacyPolicyButton.bottomAnchor, constant: -30).isActive = true
//        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        loginButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        loginButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//        createAccountButton.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: -50).isActive = true
//        createAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        createAccountButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        createAccountButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//    }
//
//    @objc func createAccount(){
//        textFieldEntries()
//        if emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false && passwordTextField.text == passwordVerifyTextField.text && passwordVerifyTextField.text?.isEmpty == false && nameTextField.text?.isEmpty == false {
//            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//                if user != nil{
//                    self.createDatabaseAccount()
//                    self.createdAccount()
//                }else{
//                    if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                        let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
//    }
//    
//    @objc func createDatabaseAccount(){
//        let UUID = Auth.auth().currentUser?.uid
//        let structData: [String: Any] = ["Name": self.nameTextField.text!, "Email": self.emailTextField.text!, "UUID": UUID!, "Created": currentDay]
//        
//        database.collection("Users").document(currentUserUUID!).setData(structData) { error in
//            if let error = error?.localizedDescription {
//                print(error)
//            }else{
//                print("Successfully added to database")
//            }
//        }
//        
//    }
//    
//    @objc func login(){
//        self.navigationController?.pushViewController(LoginAccount(), animated: false)
//    }
//    
//    func createdAccount(){
//        database.collection("Users").whereField("Email", isEqualTo: self.emailTextField.text!).getDocuments { (snapshot, error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                self.present(TabBarViewController(), animated: true, completion: nil)
//            }
//        }
//    }
//    
//    @objc func viewPrivacyPolicy(){
//        webLink = "https://wakedapps.com/Privacy_policy"
//        webViewLabel = "Privacy Policy"
//        let webView = UINavigationController(rootViewController: webViewScreen())
//        self.navigationController?.present(webView, animated: false, completion: nil)
//    }
//    
//    @objc func closeView() {
//        self.navigationController?.pushViewController(startView(), animated: false)
//    }
//    
//    func textFieldEntries(){
//        if emailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true || passwordVerifyTextField.text?.isEmpty == true || nameTextField.text?.isEmpty == true {
//            let alert = createAlert(Title: "All text fields must be filled out", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//        
//        if passwordTextField.text != passwordVerifyTextField.text {
//            let alert = createAlert(Title: "Passwords do not match", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if emailTextField.isEditing == true {
//            emailTextField.setBottomBorderSelected()
//        }
//        if passwordTextField.isEditing == true {
//            passwordTextField.setBottomBorderSelected()
//        }
//        if passwordVerifyTextField.isEditing == true {
//            passwordVerifyTextField.setBottomBorderSelected()
//        }
//        if nameTextField.isEditing == true {
//            nameTextField.setBottomBorderSelected()
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if emailTextField.isEditing == false {
//            emailTextField.setBottomBorderNotSelected()
//        }
//        if passwordTextField.isEditing == false {
//            passwordTextField.setBottomBorderNotSelected()
//        }
//        if passwordVerifyTextField.isEditing == false {
//            passwordVerifyTextField.setBottomBorderNotSelected()
//        }
//        if nameTextField.isEditing == false {
//            nameTextField.setBottomBorderNotSelected()
//        }
//    }
//    
//    func textFieldhide(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if passwordVerifyTextField.isEditing == true && passwordVerifyTextField.text?.isEmpty == false {
//            createAccount()
//            textField.resignFirstResponder()
//        }else{
//            if emailTextField.isEditing == true && emailTextField.text?.isEmpty == false {
//                nameTextField.becomeFirstResponder()
//            }else{
//                if nameTextField.isEditing == true && nameTextField.text?.isEmpty == false {
//                    passwordTextField.becomeFirstResponder()
//                }else{
//                    if passwordTextField.isEditing == true && passwordTextField.text?.isEmpty == false {
//                        passwordVerifyTextField.becomeFirstResponder()
//                    }
//                }
//            }
//        }
//        return false
//    }
}


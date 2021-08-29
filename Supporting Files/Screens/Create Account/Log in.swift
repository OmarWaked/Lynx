//
//  ViewController.swift
//  C4ME
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication
import Lottie

class LoginAccount: UIViewController, UITextFieldDelegate {
//    
//    let emailTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .emailAddress, ReturnType: .next, SecuredEntry: false, Placeholder: "Email")
//    let passwordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .continue, SecuredEntry: true, Placeholder: "Password")
//    let loginButton = createButton(Title: "Log In", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(login))
//    let createAccountButton = createButton(Title: "Don't have an account? Sign up here.", FontName: font, FontSize: 15, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(signup))
//    let forgotButton = createButton(Title: "Forgot?", FontName: font, FontSize: 16, FontColor: StandardTintColor, BorderWidth: 0, CornerRaduis: 0, BackgroundColor: StandardClearColor, Target: self, Action: #selector(passwordReset))
//
//    let blacksubView = createViewOverlay()
//    let animationView = createAnimationView(Animation: "success", Speed: 0.25)
//    let label = createLabel(LabelText: "", TextColor: StandardContrastColor, FontName: font, FontSize: 23, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
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
//        self.navigationItem.title = "Login"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.view.backgroundColor = .clear
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeView))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//    }
//
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
//        passwordTextField.delegate = self
//
//        view.addSubview(emailTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(forgotButton)
//        view.addSubview(createAccountButton)
//        view.addSubview(loginButton)
//        
//        emailTextField.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -90).isActive = true
//        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        emailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//
//        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        forgotButton.titleLabel?.textAlignment = .right
//        forgotButton.rightAnchor.constraint(equalTo: self.passwordTextField.rightAnchor).isActive = true
//        forgotButton.centerYAnchor.constraint(equalTo: self.passwordTextField.centerYAnchor, constant: -5).isActive = true
//        
//        createAccountButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
//        createAccountButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        createAccountButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        createAccountButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//        loginButton.topAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -50).isActive = true
//        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        loginButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        loginButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//    }
//
//    @objc func login(){
//        emptyTextField()
//        if emailTextField.text != "" && passwordTextField.text != "" {
//            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user,error) in
//                if user != nil {
//                    self.addAnimation()
//                }else{
//                    if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                        let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            })
//        }
//    }
//    
//    @objc func passwordReset() {
//        self.navigationController?.pushViewController(ResetPasswordScreen(), animated: false)
//    }
//    
//    @objc func signup(){
//        self.navigationController?.pushViewController(CreateAccount(), animated: false)
//    }
//    
//    @objc func closeView() {
//        self.navigationController?.pushViewController(startView(), animated: false)
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
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if emailTextField.isEditing == false {
//            emailTextField.setBottomBorderNotSelected()
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
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if passwordTextField.isEditing == true && passwordTextField.text?.isEmpty == false {
//            login()
//            textField.resignFirstResponder()
//        }else{
//            if emailTextField.isEditing == true && emailTextField.text?.isEmpty == false {
//                passwordTextField.becomeFirstResponder()
//            }
//        }
//        return false
//    }
//    
//    func emptyTextField(){
//        if emailTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
//            let alert = createAlert(Title: "All text fields must be filled out", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//
//    func addAnimation(){
//        if Auth.auth().currentUser?.isEmailVerified == true {
//            getUserData()
//            UIApplication.shared.keyWindow!.addSubview(blacksubView)
//            blacksubView.addSubview(animationView)
//            animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//            animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            animationView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//            animationView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//
//            animationView.play { (false) in
//                UIView.animate(withDuration: 0.10, animations: {
//                    self.blacksubView.alpha = 0.5
//                }) { (false) in
//                    self.present(TabBarViewController(), animated: false, completion: {
//                        self.blacksubView.removeFromSuperview()
//                    })
//                }
//            }
//        }else{
//            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
//                if let error = error{
//                    let alert = createAlert(Title: "Error", Message: error as! String, Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }else{
//                    let alert = createAlert(Title: "Verify", Message: "Please verify your account through the link we emailed you", Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }
//            })
//        }
//    }
//    
//    
//    func getUserData(){
//        database.collection("Users").whereField("Email", isEqualTo: currentUserEmail!).getDocuments { (snapshot, error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                for document in (snapshot?.documents)! {
//                    if let name = document.data()["Name"] as? String {
//                        self.label.text = "Welcome Back, \n\(name)."
//                        self.blacksubView.addSubview(self.label)
//                        self.label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//                        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//                        self.label.widthAnchor.constraint(equalToConstant: self.view.frame.width - 30).isActive = true
//                    }
//                }
//                currentUserUUID = Auth.auth().currentUser?.uid
//                currentUserEmail = Auth.auth().currentUser?.email!
//            }
//        }
//    }

}


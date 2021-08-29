//
//  TerminateAccountView.swift
//  C4ME
//
//  Created by Omar Waked on 7/8/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import UIKit
import Firebase

class TerminateAccountView: UIViewController, UITextFieldDelegate {
//    
//    let warningLabel = createLabel(LabelText: "Deleting your account will result in permanent loss of all your data and settings.", TextColor: StandardContrastColor, FontName: fontBold, FontSize: 18, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//    let passwordTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .default, ReturnType: .continue, SecuredEntry: true, Placeholder: "Password")
//    let terminateButton = createButton(Title: "Terminate", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(Terminate))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
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
//        passwordTextField.delegate = self
//        
//        self.navigationItem.title = "Terminate Account"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItem.Style.done, target: self, action: #selector(self.closeView))
//        self.navigationController?.navigationBar.prefersLargeTitles = false
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.view.mixedBackgroundColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
//        
//        view.addSubview(warningLabel)
//        view.addSubview(passwordTextField)
//        view.addSubview(terminateButton)
//        
//        warningLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        warningLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        warningLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
//        
//        passwordTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        passwordTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        terminateButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        terminateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        terminateButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        terminateButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if passwordTextField.isEditing == true {
//            passwordTextField.setBottomBorderSelected()
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
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
//            Terminate()
//            textField.resignFirstResponder()
//        }
//        return false
//    }
//    
//    func emptyTextField(){
//        if passwordTextField.text?.isEmpty == true {
//            let alert = createAlert(Title: "Text field must be filled out", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//    
//    func deleteUserDatabaseData(){
//        user?.delete { (error) in
//            if error != nil {
//                print(error as Any)
//            }else{
//                print("Deleted User From Auth")
//                database.collection("Users").document(currentUserUUID!).delete { (error) in
//                    if error != nil{
//                        print(error as Any)
//                    }else{
//                        print("Deleted User Data")
//                        self.signOutAction()
//                        //goodbye view?
//                    }
//                }
//            }
//        }
//    }
//    
//    @objc func Terminate(){
//        emptyTextField()
//        let credential = EmailAuthProvider.credential(withEmail: currentUserEmail!, password: passwordTextField.text!)
//        user?.reauthenticateAndRetrieveData(with: credential, completion: { (auth, error) in
//            if error != nil {
//                if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                    let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }
//            }else{
//                self.deleteUserDatabaseData()
//            }
//        })
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
//    @objc func signOutAction() {
//        try! Auth.auth().signOut()
//        self.navigationController?.pushViewController(startView(), animated: false)
//    }
}

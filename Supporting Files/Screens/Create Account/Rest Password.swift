//
//  ResetPasswordScreen.swift
//  C4ME
//
//  Created by Omar Waked on 10/25/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class ResetPasswordScreen: UIViewController, UITextFieldDelegate{

//    let emailTextField = createTextField(FontName: font, FontSize: 18, KeyboardType: .emailAddress, ReturnType: .next, SecuredEntry: false, Placeholder: "Email")
//    let resetButton = createButton(Title: "Reset", FontName: font, FontSize: 25, FontColor: StandardViewColor, BorderWidth: 1.5, CornerRaduis: 6, BackgroundColor: StandardContrastColor, Target: self, Action: #selector(checkForEmail))
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
//        self.navigationItem.title = "Reset Password"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.view.backgroundColor = .clear
//        self.navigationController?.navigationBar.mixedBarTintColor = StandardViewColor
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeView))
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationController?.navigationBar.mixedTintColor = StandardContrastColor
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
//
//        view.addSubview(emailTextField)
//        view.addSubview(resetButton)
//
//        emailTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40).isActive = true
//        emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        emailTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        
//        resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
//        resetButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        resetButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 60).isActive = true
//        resetButton.heightAnchor.constraint(equalToConstant: (self.view.frame.width - 60)/5.5).isActive = true
//    }
//    
//
//    
//    @objc func checkForEmail(){
//        if emailTextField.text?.isEmpty == true {
//            let alert = createAlert(Title: "You must enter an email address", Message: "", Style: .alert, ButtonTitle: "Ok")
//            self.present(alert, animated: true, completion: nil)
//        }else{
//            database.collection("User").document(emailTextField.text!).getDocument { (snapshot, error) in
//                if let document = snapshot {
//                    if document.exists{
//                        self.sendEmail()
//                    }else{
//                        let alert = createAlert(Title: "Account with that email does not exist", Message: "", Style: .alert, ButtonTitle: "Ok")
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
//        }
//    }
//    
//    func sendEmail() {
//        Auth.auth().sendPasswordReset(withEmail: "email@email") { error in
//            if error != nil{
//                self.addAnimation()
//            }else{
//                if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
//                    let alert = createAlert(Title: errorCode.errorMessage, Message: "", Style: .alert, ButtonTitle: "Ok")
//                    self.present(alert, animated: true, completion: nil)
//                }
//            }
//        }
//    }
//    
//    func addAnimation(){
//        Auth.auth().sendPasswordReset(withEmail: self.emailTextField.text!)
//        var blacksubView = UIView()
//        blacksubView = UIView(frame: UIScreen.main.bounds)
//        blacksubView.backgroundColor = UIColor.black
//        UIApplication.shared.keyWindow!.addSubview(blacksubView)
//        
//        let animationView = LOTAnimationView(name: "success")
//        animationView.frame = CGRect(x: 0, y: self.view.frame.midY - 10, width: 350, height: 350)
//        animationView.center = self.view.center
//        animationView.animationSpeed = 0.25
//        animationView.contentMode = .scaleAspectFill
//        view.addSubview(animationView)
//        UIApplication.shared.keyWindow!.addSubview(animationView)
//        self.view.bringSubviewToFront(animationView)
//        
//        let label = createLabel(LabelText: "An email has been sent to your inbox.", TextColor: StandardContrastColor, FontName: font, FontSize: 25, TextAlignment: .center, TextBreak: .byWordWrapping, NumberOfLines: 0)
//        UIApplication.shared.keyWindow!.addSubview(label)
//        
//        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
//        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: self.view.frame.width - 30).isActive = true
//        
//        animationView.play { (false) in
//            self.closeView()
//            animationView.removeFromSuperview()
//            blacksubView.removeFromSuperview()
//            label.removeFromSuperview()
//        }
//    }
//    
//    @objc func closeView() {
//        self.navigationController?.pushViewController(LoginAccount(), animated: false)
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if emailTextField.isEditing == true {
//            emailTextField.setBottomBorderSelected()
//        }
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if emailTextField.isEditing == false {
//            emailTextField.setBottomBorderNotSelected()
//        }
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
//    func textFieldhide(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if emailTextField.isEditing == true {
//            textField.resignFirstResponder()
//            checkForEmail()
//        }
//        return false
//    }

}

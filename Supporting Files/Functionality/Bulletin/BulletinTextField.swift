/**
 *  BulletinBoard
 *  Copyright (c) 2017 - present Alexis Aubry. Licensed under the MIT license.
 */

import UIKit
import BLTNBoard
import Firebase

class TextFieldBulletinPage: FeedbackPageBLTNItem {
    
    @objc public var textField: UITextField!
    @objc public var textInputHandler: ((BLTNActionItem, String?) -> Void)? = nil
    
    
    override func makeViewsUnderDescription(with interfaceBuilder: BLTNInterfaceBuilder) -> [UIView]? {
        textField = interfaceBuilder.makeTextField(placeholder: "Email Address", returnKey: .done, delegate: self)
        return [textField]
    }
    
    override func tearDown() {
        super.tearDown()
        textField?.delegate = nil
    }
    
    override func actionButtonTapped(sender: UIButton) {
        textField.resignFirstResponder()
        super.actionButtonTapped(sender: sender)
    }
    
}

extension TextFieldBulletinPage: UITextFieldDelegate {
    
    @objc open func isInputValid(text: String?) -> Bool {
        if text == nil || text!.isEmpty {
            return false
        }
        return true
    }
    
    func isValidEmail(text: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        if isInputValid(text: textField.text){
            if isValidEmail(text: textField.text){
                textInputHandler?(self, textField.text)
                sendTransactionEmail(Email: textField.text)
            }else{
                descriptionLabel!.textColor = .red
                descriptionLabel!.text = "You must enter a valid email to continue."
                textField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            }
        }else{
            descriptionLabel!.textColor = .red
            descriptionLabel!.text = "You must enter an email to continue."
            textField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        }
    }
    
    func sendTransactionEmail(Email: String!){
        functions.httpsCallable("getUserData").call(["UUID": currentUserUUID!, "EMAIL": Email, "NAME": currentUserName]) { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    functionError = true
                    let message = error.localizedDescription
                    errorMessage = "\(message)"
                }
                functionError = true
            }else{
                functionError = false
            }
        }
    }

}

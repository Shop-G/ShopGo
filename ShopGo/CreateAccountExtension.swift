//
//  CreateAccountExtension.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 28/09/2022.
//
import Foundation
import UIKit
extension  CreateScreenViewController : UITextFieldDelegate {
    
    // Setting the custom button corner radius and shadows
    func updateLayerProperties() {
        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.layer.masksToBounds = false
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowRadius = 10
        nextButton.layer.shadowOpacity = 1.0
    }
    
    // textField image setup
    func addLeftImage(textField: UITextField , image: UIImage) {
        let leftImage = UIImageView()
        leftImage.image = image
        let contentView = UIView()
        contentView.addSubview(leftImage)
        contentView.frame = CGRectMake(0, 0, 25, 20)
        leftImage.frame = CGRectMake(10, 0, 25, 20)
        textField.leftView = contentView
        textField.leftViewMode = .always
    }
    
    //Hide keyboard
    func hideKeyboardTappedAccount() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateScreenViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // dismiss the keyboard on tap
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // dismiss the keyboard on return tap
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Username validation
    func isValidUsername(username: String) -> Bool {
        let usernameRegEx = "\\w{4,18}"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernameTest.evaluate(with: username)
    }
    
    //Password validation
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{7,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    //Email Validation
    func  isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // Phone Number Validation
    func isValidPhoneNo(phoneNo: String) -> Bool {
        let phoneNoRegEx = "^[+]?+[0-9]{5,16}$"
        let phoneNoTest = NSPredicate(format: "SELF MATCHES %@", phoneNoRegEx)
        return phoneNoTest.evaluate(with: phoneNo)
    }
    
    // enable and disable button
    func checkForValidForm() {
        if let name = usernameTextField.text ,
           let email = emailTextField.text ,
           let phoneNo = phoneNoTextField.text ,
           let password = passwordTextField.text
        {
            if (isValidUsername(username: name)) && (isValidEmail(email: email)) && (isValidPhoneNo(phoneNo: phoneNo)) && (isValidPassword(password: password)) {
                nextButton.isEnabled = true
                nextButton.alpha = 1.0
            } else {
                nextButton.isEnabled = false
                nextButton.alpha = 0.9
            }
        }
    }
    
    // Reset the storyboard
    func resetScreen() {
        nextButton.isEnabled = false
        usernameTextField.text = ""
        emailTextField.text = ""
        phoneNoTextField.text = ""
        passwordTextField.text = ""
    }
}


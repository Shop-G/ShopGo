//
//  CreateAccountExtension.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 28/09/2022.
//
import Foundation
import UIKit

extension  UIViewController  {
    
    //Hide keyboard
    func hideKeyboardTappedAccount() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // dismiss the keyboard on tap
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension String {
    
    //Username validation
    var isValidUsername: Bool {
        let usernameRegEx = "\\w{5,18}"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return usernameTest.evaluate(with: self)
    }

    //Password validation
    var isValidPassword: Bool {
        let passwordRegEx = "(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{7,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    //Email Validation
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    // Phone Number Validation
    var isValidPhoneNo: Bool {
        let phoneNoRegEx = "^[+]?+[0-9]{5,16}$"
        let phoneNoTest = NSPredicate(format: "SELF MATCHES %@", phoneNoRegEx)
        return phoneNoTest.evaluate(with: self)
    }
}

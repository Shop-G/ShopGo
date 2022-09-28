//
//  CreateAccountExtension.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 28/09/2022.
//

import Foundation
import UIKit

extension  UIViewController {

func hideKeyboardTappedAccount() {
    let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
}
// dismiss the keyboard on tap everywhere on the screen
@objc func dismissKeyboard() {
    view.endEditing(true)
}
}

extension String {
    
    var  isPasswordValid: Bool {
        let passwordRegEx = "(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{7,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var isValidPhoneNo: Bool {
        let phoneNoRegEx = "^[+]?+[0-9]{5,16}$"
        let phoneNoTest = NSPredicate(format: "SELF MATCHES %@", phoneNoRegEx)
        return phoneNoTest.evaluate(with: self)
    }
}

//
//  myProfileExtension.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 08/10/2022.
//

import Foundation
import UIKit
extension MyProfileTableViewController :  UITextFieldDelegate {
    
    //Profile Image corner radius
    func setRadius() {
        profileImage.layer.cornerRadius = 10
        profileImage.clipsToBounds = true
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
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

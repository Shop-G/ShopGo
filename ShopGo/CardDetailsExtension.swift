//
//  CardDetailsExtension.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 13/10/2022.
//

import Foundation
import UIKit
extension CardDetailsViewController : UITextFieldDelegate {
  
    //Hide keyboard
    func hideKeyboardTappedAccount() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CardDetailsViewController.dismissKeyboard))
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
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength : Int = 0
        
        if textField == usernameTextField {
            maxLength = 20
        } else if textField == cardNoTextField {
            maxLength = 20
        } else if textField == expMonthTextField {
            maxLength = 2
        } else if textField == expDateTextField {
            maxLength = 2
        } else if textField == cvvTextField {
            maxLength = 3
        }
        let currentString: NSString = textField.text! as NSString
                let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
                return newString.length <= maxLength
        }
}

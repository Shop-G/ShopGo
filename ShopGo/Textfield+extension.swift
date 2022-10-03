//
//  Textfield+extension.swift
//  ShopGo
//
//  Created by Quratulain on 9/30/22.
//

import Foundation
import UIKit
extension LoginVC : UITextFieldDelegate {
    
    // textfield shake
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool , textfield : UITextField) {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: textfield.center.x - 10, y: textfield.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: textfield.center.x + 10, y: textfield.center.y))
        textfield.layer.add(shake, forKey: "position")
    }
    
    // Configuring textfield icons  and padding
    func configureTextfieldIcons() {
        guard let usernameImage = UIImage(named: "user") else {return}
        self.addLeftImageToTextfield(textfield: usernameTextfield, addImage: usernameImage)
        guard let passwordImage = UIImage(named: "padlock") else {return}
        self.addLeftImageToTextfield(textfield: passwordTextfield, addImage: passwordImage)
    }
    
    // Adding a left icon to the textfield with padding
    func addLeftImageToTextfield(textfield:UITextField , addImage img:UIImage) {
        let leftImage = UIImageView()
        leftImage.image = img
        let contentView = UIView()
        contentView.addSubview(leftImage)
        contentView.frame = CGRectMake(0, 0, 25, 20)
        leftImage.frame = CGRectMake(10, 0, 25, 20)
        textfield.leftView = contentView
        textfield.leftViewMode = .always
    }
    
    // Username and Password Validation
    func resetForm(){
        usernameTextfield.text = ""
        passwordTextfield.text = ""
    }
    
    //Button enable and Disable
    func buttonEnableDisable() {
        if let name = usernameTextfield.text, let password = passwordTextfield.text {
            if (isValidPassword(password: password)) && (isValidUsername(username: name)) {
                loginButton.isEnabled = true
                loginButton.alpha = 1
            } else {
                loginButton.isEnabled = false
                loginButton.alpha = 0.9
            }
        }
    }
    
    // Password validation check
    func isValidPassword (password : String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{6,12}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
    //Username validation check
    func isValidUsername (username : String) -> Bool{
        let usernameRegEx = "\\w{5,18}"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        let result = usernameTest.evaluate(with: username)
        return result
    }
    
    // hide keyboard on tap
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

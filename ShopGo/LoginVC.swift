//  LoginVC.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit
class LoginVC: UIViewController {
    
    var username = "admin"
    var password = "password1@"
    
    @IBOutlet weak var redUnderlineView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextfieldIcons()
        resetForm()
        redUnderlineView.isHidden = true
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let passwordField = passwordTextfield.text
        let usernameField = usernameTextfield.text
        
        if (isValidPassword(password: passwordField!)) && passwordField == password && isValidUsername(username: usernameField!) && usernameField == username{
            
            
        } else {
            isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 4.0, revert: true, textfield: passwordTextfield)
            redUnderlineView.isHidden = false
        }
        resetForm()
    }
    
    @IBAction func usernameEdited(_ sender: Any) {
        buttonEnableDisable()
    }
    
    @IBAction func passwordEdited(_ sender: Any) {
        buttonEnableDisable()
        redUnderlineView.isHidden = true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return")
        return true
    }
}

//
//  CreateScreenViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 21/09/2022.

import UIKit
class CreateScreenViewController: UIViewController  {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    let emailImage = UIImage(named: "mail")
    let passwordImage = UIImage(named: "password")
    let phoneNoImage = UIImage(named: "phone")
    let userNameImage = UIImage(named: "person")
    var name = "user"
    var email = "user@gmail.com"
    var phone = "+12345678910"
    var password = "userr5*"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetScreen()
        updateLayerProperties()
        hideKeyboardTappedAccount()
        addLeftImage(textField: emailTextField, image: emailImage!)
        addLeftImage(textField: passwordTextField, image: passwordImage!)
        addLeftImage(textField: usernameTextField, image: userNameImage!)
        addLeftImage(textField: phoneNoTextField, image: phoneNoImage!)
        
        // Listen the keyboards events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Move view 150 points upward
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    // Move view to original position
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let usernameField = usernameTextField.text
        let emailField = emailTextField.text
        let phoneNoField = phoneNoTextField.text
        let passwordField = passwordTextField.text
        if (isValidUsername(username: usernameField!)) && usernameField == name && (isValidEmail(email: emailField!)) && emailField == email && (isValidPhoneNo(phoneNo: phoneNoField!)) && phoneNoField == phone &&
            (isValidPassword(password: passwordField!)) && passwordField == password {
            
        } else {
            
        }
        resetScreen()
    }
    
    // name validation
    @IBAction func nameChanged(_ sender: Any) {
        checkForValidForm()
    }
    
    // email validation
    @IBAction func emailChanged(_ sender: Any) {
        checkForValidForm()
    }
    
    // phone number validation
    @IBAction func phoneNoChanged(_ sender: Any) {
        checkForValidForm()
    }
    
    // password validation
    @IBAction func passwordChanged(_ sender: Any) {
        checkForValidForm()
    }
}










    
    


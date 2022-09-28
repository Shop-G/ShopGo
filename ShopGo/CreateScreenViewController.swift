//
//  CreateScreenViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 21/09/2022.
//

import UIKit

class CreateScreenViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    let emailImage = UIImage(named: "mail")
    let passwordImage = UIImage(named: "password")
    let phoneNoImage = UIImage(named: "phone")
    let userNameImage = UIImage(named: "person")
   
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        
        updateLayerProperties()
        self.hideKeyboardTappedAccount()
        
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
    
    // dismiss the keyboard on return tap
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
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
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
   
    
    // name validation
    @IBAction func nameChanged(_ sender: Any) {
     checkForValidForm()
    }
    // email validation
    @IBAction func emailChanged(_ sender: Any) {
        if (emailTextField.text?.isValidEmail)! {
            checkForValidForm()
            print("your email is valid")
        } else {
          print("your email is invalid")
        }
    }
    // phone number validation
    @IBAction func phoneNoChanged(_ sender: Any) {
        if (phoneNoTextField?.text?.isValidPhoneNo)! {
            checkForValidForm()
            print("your phone number is valid")
        } else {
            print("your phone number is invalid")
        }
    }
    // password validation
    @IBAction func passwordChanged(_ sender: Any) {
        if (passwordTextField?.text?.isPasswordValid)!   {
            checkForValidForm()
            print("your password is valid")
        }  else {
            print("your password is invalid")
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {

    }
   // enable and disable button when textfields are empty or not
    func checkForValidForm()
        {
            if let name = usernameTextField.text ,
               let email = emailTextField.text ,
               let phoneNo = phoneNoTextField.text ,
               let password = passwordTextField.text
            {
                if !name.isEmpty && !email.isEmpty && !phoneNo.isEmpty && !password.isEmpty {
                nextButton.isEnabled = true
                    nextButton.alpha = 1.0
            }
            else
            {
                nextButton.isEnabled = false
                nextButton.alpha = 0.5
            }
        }
}
}




    
    


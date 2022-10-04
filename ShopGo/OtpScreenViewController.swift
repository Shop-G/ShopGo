//
//  OtpScreenViewController.swift
//  ShopGo
//
//  Created by Muhammad Rehman on 9/22/22.
//

import UIKit

class OtpScreenViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var textFieldFour: UITextField!
    @IBOutlet weak var createAccountButtonOutlet: UIButton!
    
    @IBAction func CreateAccountButton(_ sender: Any) {
        /*
         Code for Create Account screen
         */
    }
    
    @IBAction func logInAccountButton(_ sender: Any) {
        /*
         Code for login screen
         */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        createAccountButtonEditing()
    }
    
    //  function for cornerradius and shadow for the create account button
    func createAccountButtonEditing(){
        createAccountButtonOutlet.layer.cornerRadius = 22
        createAccountButtonOutlet.layer.shadowColor = UIColor.black.cgColor
        createAccountButtonOutlet.layer.shadowOffset = CGSize(width: 5, height: 9)
        createAccountButtonOutlet.layer.shadowRadius = 10
        createAccountButtonOutlet.layer.shadowOpacity = 0.4
    }
    
    //    assignig delegates for OTP text fields
    func textFieldDelegate(){
        textFieldOne.delegate = self
        textFieldTwo.delegate = self
        textFieldThree.delegate = self
        textFieldFour.delegate = self
        textFieldOne.becomeFirstResponder()
    }
    
    //  functionality for the textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == textFieldOne {
                textFieldTwo.becomeFirstResponder()
            }
            else if textField == textFieldTwo {
                textFieldThree.becomeFirstResponder()
            }
            else if textField == textFieldThree {
                textFieldFour.becomeFirstResponder()
            }
            else if textField == textFieldFour {
                textFieldFour.resignFirstResponder()
            }
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == textFieldTwo {
                textFieldOne.becomeFirstResponder()
            }
            else if textField == textFieldThree {
                textFieldTwo.becomeFirstResponder()
            }
            else if textField == textFieldFour {
                textFieldThree.becomeFirstResponder()
            }
            else if textField == textFieldOne {
                textFieldOne.resignFirstResponder()
            }
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = ""
            return false
        }
        return true
    }
}

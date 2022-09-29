//  LoginVC.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit
class LoginVC: UIViewController , UITextFieldDelegate{
    
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
        let password = passwordTextfield.text
        let username = usernameTextfield.text
        if (isValidPassword(password: password!)) {
            print("valid password")
        }else{
            passwordTextfield.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 4, revert: true)
            redUnderlineView.isHidden = false
            print("invalid password")
        }
        if (isValidUsername(username: username!)) {
            print("valid username")
        }else{
            print("invalid username")
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
    
    // Configuring textfield icons  and padding
    func configureTextfieldIcons() {
        guard let usernameImage = UIImage(named: "user") else {return}
        self.addLeftImageToTextfield(textfield: usernameTextfield, addImage: usernameImage)
        guard let passwordImage = UIImage(named: "padlock") else {return}
        self.addLeftImageToTextfield(textfield: passwordTextfield, addImage: passwordImage)
    }
    
    // Dismiss keyboard with return key
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return")
        return true
    }
}

extension LoginVC{
    
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
            if !name.isEmpty && !password.isEmpty {
                loginButton.isEnabled = true
                loginButton.alpha = 1
            }else{
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

extension UITextField {
    
    // textfield shake
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: center.y))
        layer.add(shake, forKey: "position")
    }
}

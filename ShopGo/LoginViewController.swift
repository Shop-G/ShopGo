//
//  LoginViewController.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit
class LoginViewController: UIViewController {
    
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
    }

    // Configuring textfield icons
    func configureTextfieldIcons() {
        guard let usernameImage = UIImage(named: "user") else {return}
        addLeftImageToTextfield(textfield: usernameTextfield, addImage: usernameImage)
        guard let passwordImage = UIImage(named: "padlock") else {return}
        addLeftImageToTextfield(textfield: passwordTextfield, addImage: passwordImage)
    }
}

extension LoginViewController {
    
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
}

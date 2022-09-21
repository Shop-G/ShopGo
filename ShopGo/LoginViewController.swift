//
//  LoginViewController.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let usernameImage = UIImage(named: "user") else {return}
        addLeftImageToTextfield(textfield: usernameTextfield, addImage: usernameImage)
        guard let passwordImage = UIImage(named: "padlock") else {return}
        addLeftImageToTextfield(textfield: passwordTextfield, addImage: passwordImage)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
}
extension LoginViewController {
    func addLeftImageToTextfield(textfield:UITextField , addImage img:UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 10, y: 5, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        textfield.leftView = leftImageView
        textfield.leftViewMode = .always
    }
}

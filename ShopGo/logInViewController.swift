//
//  logInViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 20/09/2022.
//

import UIKit

class logInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.layer.masksToBounds = false
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowRadius = 10
        nextButton.layer.shadowOpacity = 1.0
        
//        let userNameImage = UIImage(named: "")
//        addLeftImage(textField: usernameTextField, image: userNameImage!)
        let emailImage = UIImage(named: "mail")
        addLeftImage(textField: emailTextField, image: emailImage!)
//       let phoneNoImage = UIImage(named: "phone")
//       addLeftImage(textField: phoneNoTextField, image: phoneNoImage!)
        let passwordImage = UIImage(named: "password")
        addLeftImage(textField: passwordTextField, image: passwordImage!)
    }
    
    func addLeftImage(textField: UITextField , image: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
   

}

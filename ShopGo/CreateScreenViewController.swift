//
//  CreateScreenViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 21/09/2022.
//

import UIKit

class CreateScreenViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    let emailImage = UIImage(named: "mail")
    let passwordImage = UIImage(named: "password")
    let phoneNoImage = UIImage(named: "phone")
    let userNameImage = UIImage(named: "user")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLayerProperties()
         
        addLeftImage(textField: emailTextField, image: emailImage ?? UIImage())
        addLeftImage(textField: passwordTextField, image: passwordImage ?? UIImage())
        addLeftImage(textField: usernameTextField, image: userNameImage ?? UIImage())
        addLeftImage(textField: phoneNoTextField, image: phoneNoImage ?? UIImage())
    }
    
    func updateLayerProperties() {
        nextButton.layer.cornerRadius = 22
        nextButton.clipsToBounds = true
        nextButton.layer.masksToBounds = false
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        nextButton.layer.shadowRadius = 10
        nextButton.layer.shadowOpacity = 1.0
    }
    
    func addLeftImage(textField: UITextField , image: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
}

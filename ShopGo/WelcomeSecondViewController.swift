//
//  WelcomeSecondViewController.swift
//  ShopGo
//
//  Created by Blall Ahmad on 9/28/22.
//

import UIKit

class WelcomeSecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountBtnCorner.layer.cornerRadius = 22
        logInBtnCorner.layer.cornerRadius = 22
       createAccountBtnCorner.clipsToBounds = true
        logInBtnCorner.clipsToBounds = true
    }
    @IBOutlet weak var createAccountBtnCorner: UIButton!
    @IBOutlet weak var logInBtnCorner: UIButton!
    @IBAction func createAccountBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "CreateAccountScreen", bundle: nil).instantiateViewController(withIdentifier: "CreateScreenViewController") as! CreateScreenViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logInBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

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
    }
    @IBAction func logInBtn(_ sender: Any) {
    } 
}

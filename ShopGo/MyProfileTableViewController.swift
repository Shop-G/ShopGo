//
//  MyProfileTableViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 05/10/2022.
//

import UIKit
class MyProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var adressButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRadius()
        hideKeyboardTappedAccount()
        
        // Listen the keyboards events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Move view 150 points upward
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -280
    }
    
    // Move view to original position
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @IBAction func myAdress(_ sender: Any) {
    }
    
    @IBAction func order(_ sender: Any) {
    }
    
    @IBAction func setting(_ sender: Any) {
    }
}
    
    




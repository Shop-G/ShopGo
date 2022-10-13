//
//  CardDetailsViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 12/10/2022.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var cardNoTextField: UITextField!
    @IBOutlet weak var expMonthTextField: UITextField!
    @IBOutlet weak var expDateTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var addCardButton: UIButton! {
        didSet {
            addCardButton.layer.cornerRadius = 22
            addCardButton.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Card Details"
       
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
    
   
    
}

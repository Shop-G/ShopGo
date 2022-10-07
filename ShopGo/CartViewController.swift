//
//  CartViewController.swift
//  ShopGo
//
//  Created by Quratulain on 10/6/22.
//

import UIKit
class CartViewController: UIViewController {
    
    var imagesArray : [UIImage] = [UIImage(named: "Cart1")! , UIImage(named: "Cart2")!]
    
    @IBOutlet weak var continueButton: CustomButton!{
        didSet{
            continueButton.layer.cornerRadius = 22
            continueButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var buttonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

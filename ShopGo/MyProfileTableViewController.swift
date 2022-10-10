//
//  MyProfileTableViewController.swift
//  ShopGo
//
//  Created by Anoosha Wahid  on 05/10/2022.
//

import UIKit
class MyProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRadius()
    }
    
    //Profile Image corner radius
    func setRadius() {
        profileImage.layer.cornerRadius = 10
        profileImage.clipsToBounds = true
    }
    
    @IBAction func myAddress(_ sender: Any) {
    }
    
    @IBAction func order(_ sender: Any) {
    }
    
    @IBAction func setting(_ sender: Any) {
    }
}


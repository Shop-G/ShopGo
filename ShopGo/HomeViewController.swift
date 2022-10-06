//
//  HomeViewController.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/6/22.
//

import UIKit
class HomeViewController: UIViewController {
    
    @IBOutlet weak var locationIcon: UIButton!
    @IBOutlet weak var burgerMenu: UIButton!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var trendingOption: UIButton!
    @IBOutlet weak var menOption: UIButton!
    @IBOutlet weak var womenOption: UIButton!
    @IBOutlet weak var childrenOption: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLeftImageToTextField()
        modification()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func trendingBtn(_ sender: Any) {
    }
    @IBAction func menBtn(_ sender: Any) {
    }
    @IBAction func womenBtn(_ sender: Any) {
    }
    @IBAction func childrenBtn(_ sender: Any) {
    }
}



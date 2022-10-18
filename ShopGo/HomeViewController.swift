//
//  HomeViewController.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/6/22.
//

import UIKit
class HomeViewController: UIViewController {
    
    var arrayMenu: [MenuButtonDataModel] = [MenuButtonDataModel(option: "Home", image: UIImage(named: "homeIcon")!),
                                            MenuButtonDataModel(option: "Explore", image: UIImage(named: "Explore")!),
                                            MenuButtonDataModel(option: "Cart", image: UIImage(named: "ShoppingCart")!),
                                            MenuButtonDataModel(option: "Stores", image: UIImage(named: "store")!),
                                            MenuButtonDataModel(option: "Card Details", image: UIImage(named: "card")!),
                                            MenuButtonDataModel(option: "WishList", image: UIImage(named: "wishList")!)]
    
    var isSideViewOpen:Bool = true
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var trendingOption: UIButton!
    @IBOutlet weak var menOption: UIButton!
    @IBOutlet weak var womenOption: UIButton!
    @IBOutlet weak var childrenOption: UIButton!
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var tableViewSideBar: UITableView!
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
    @IBAction func menuBtn(_ sender: Any) {
        showBurgerMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        placeLeftImageToTextField()
        modification()
        self.navigationItem.setHidesBackButton(true, animated: false)
        sideView.isHidden = true
        isSideViewOpen = false
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomePageMenuCell
        cell.nameDisplay.text = arrayMenu[indexPath.row].option
        cell.imageDisplay.image = arrayMenu[indexPath.row].image
        print(indexPath.row)
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if indexPath.row == 5{
    //            let vc = storyboard?.instantiateViewController(withIdentifier: "wishListViewController") as! wishListViewController
    //            navigationController?.pushViewController(vc, animated: true)
    //        }
}




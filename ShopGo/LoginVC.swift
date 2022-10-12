//  LoginVC.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit
class LoginVC: UIViewController {
    
    var username = "admin"
    var password = "password1@"
    
    @IBOutlet weak var redUnderlineView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextfieldIcons()
        resetForm()
        redUnderlineView.isHidden = true
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let passwordField = passwordTextfield.text
        let usernameField = usernameTextfield.text
        
        if (isValidPassword(password: passwordField!)) && passwordField == password && isValidUsername(username: usernameField!) && usernameField == username{
            tabBar()

        } else {
            isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 4.0, revert: true, textfield: passwordTextfield)
            redUnderlineView.isHidden = false
        }
        resetForm()
    }
    
    @IBAction func usernameEdited(_ sender: Any) {
        buttonEnableDisable()
    }
    
    @IBAction func passwordEdited(_ sender: Any) {
        buttonEnableDisable()
        redUnderlineView.isHidden = true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return")
        return true
    }
    
    func tabBar(){
        let tabBarVC = UITabBarController()
        let vcOne = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let vcTwo =  UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        let vcThree = UIStoryboard(name: "MyProfileScreen", bundle: nil).instantiateViewController(withIdentifier: "MyProfileTableViewController") as! MyProfileTableViewController
        vcOne.title = "Home"
        vcTwo.title = "Cart"
        vcThree.title = "Profile"
        tabBarVC.setViewControllers([vcOne,vcTwo,vcThree], animated: false)
        guard let items = tabBarVC.tabBar.items else {return}
        let images = ["house","cart"]
        for i in 0...items.count-2 {
            items[i].image = UIImage(systemName: images[i])
        }
        items[2].image = UIImage(named: "profileTabBarButton")
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        tabBarApperence(tabBarVC: tabBarVC)
        }
    
    func tabBarApperence(tabBarVC : UITabBarController) {
        var tabBarheight = tabBarVC.tabBar.frame
        let tabBarItemAppearance = UITabBarItemAppearance()
        let tabBarAppearance = UITabBarAppearance()
        tabBarVC.tabBar.layer.masksToBounds = true
        tabBarheight.size.height = 20
        tabBarVC.tabBar.layer.cornerRadius = 25
        tabBarVC.tabBar.backgroundColor = UIColor(named: "ButtonColor")
        tabBarVC.tabBar.alpha = 10
        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tabBarItemAppearance.normal.iconColor = UIColor.black
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonColor")!]
        tabBarItemAppearance.selected.iconColor = UIColor(named: "ButtonColor")!
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarVC.tabBar.standardAppearance = tabBarAppearance
        tabBarVC.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}

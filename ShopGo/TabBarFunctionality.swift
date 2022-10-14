//
//  TabBarFunctionality.swift
//  ShopGo
//
//  Created by Muhammad Rehman on 10/13/22.
//

import Foundation
import UIKit

// Data for TabBar
enum tabBarData : String, CaseIterable {
    case Home = "Home"
    case Cart = "Cart"
    case Profile = "My Profile"
    var viewControllers: UIViewController{
        switch self{
        case .Home:
       let vc =  UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            vc.title = self.rawValue
            return vc
        case .Cart:
            let vc = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
            vc.title = self.rawValue
            return vc
        case .Profile:
           let vc = UIStoryboard(name: "MyProfileScreen", bundle: nil).instantiateViewController(withIdentifier: "MyProfileTableViewController") as! MyProfileTableViewController
            vc.title = self.rawValue
            return vc
        }
    }
        var tabBarImages:UIImage{
            switch self {
            case .Home:
                return UIImage(systemName: "house")!
            case .Cart:
                return UIImage(systemName: "cart")!
            case .Profile:
                return UIImage(named: "profileTabBarButton")!
            }
        }
}

// creating TabBar
func tabBar(tabBarImages : [UIImage], viewControllers : [UIViewController]) -> UITabBarController{
    let tabBarVC = UITabBarController()
    tabBarVC.setViewControllers(viewControllers, animated: false)
    guard let items = tabBarVC.tabBar.items else {return tabBarVC}
    for i in 0...items.count-1 {
        items[i].image = tabBarImages[i]
    }
    tabBarVC.modalPresentationStyle = .fullScreen
    tabBarApperence(tabBarVC: tabBarVC)
    return tabBarVC
    }

// Customizing TabBar
func tabBarApperence(tabBarVC : UITabBarController) {
    let tabBarItemAppearance = UITabBarItemAppearance()
    let tabBarAppearance = UITabBarAppearance()
    tabBarVC.tabBar.layer.masksToBounds = true
    tabBarVC.tabBar.layer.cornerRadius = 25
    tabBarVC.tabBar.backgroundColor = UIColor(named: "ButtonColor" )
    tabBarVC.tabBar.alpha = 10
    tabBarItemAppearance.normal.badgeTitlePositionAdjustment = UIOffset(horizontal: 0, vertical: +20)
    tabBarItemAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0,vertical: +10)
    tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont(name: "Arial", size: 15)]
    tabBarItemAppearance.normal.iconColor = UIColor.darkGray
    tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ButtonColor")!]
    tabBarItemAppearance.selected.iconColor = UIColor(named: "ButtonColor")!
    tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
    tabBarVC.tabBar.standardAppearance = tabBarAppearance
    tabBarVC.tabBar.scrollEdgeAppearance = tabBarAppearance
}

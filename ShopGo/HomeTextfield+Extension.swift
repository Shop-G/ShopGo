//
//  HomeTextfield+Extension.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/7/22.
//

import Foundation
import UIKit
extension HomeViewController {
    
    //add left image and padding in textfield
    func placeLeftImageToTextField() {
        let imageIcon = UIImageView()
        imageIcon.image = UIImage(named: "magnifying")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "magnifying")!.size.width, height: UIImage(named: "magnifying")!.size.height)
        imageIcon.frame = CGRect(x:10, y: 0, width: UIImage(named: "magnifying")!.size.width, height: UIImage(named: "magnifying")!.size.height)
        typeText.leftView = contentView
        typeText.leftViewMode = .always
        typeText.clearButtonMode = .whileEditing
    }
    // modifying the corner radius of buttons and border style in homepage
    func modification(){
        trendingOption.layer.cornerRadius = 5
        menOption.layer.cornerRadius = 5
        womenOption.layer.cornerRadius = 5
        childrenOption.layer.cornerRadius = 5
        typeText.borderStyle = UITextField.BorderStyle.roundedRect
    }
    // present the list of menu on HomeViewController when menu button is pressed
    func showBurgerMenu() {
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen{
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 120, width: 0, height: 763)
            tableViewSideBar.frame =  CGRect(x: 0, y: 97, width: 316, height: 406)
            UIView.animate(withDuration: 0.1) {
                self.sideView.frame = CGRect(x: 0, y: 120, width: 316, height: 763)
                self.tableViewSideBar.frame =  CGRect(x: 0, y: 97, width: 316, height: 406)
            }
        }else{
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 120, width: 316, height: 763)
            tableViewSideBar.frame =  CGRect(x: 0, y: 97, width: 316, height: 406)
            UIView.animate(withDuration: 0.1) {
                self.sideView.frame = CGRect(x: 0, y: 120, width: 0, height: 763)
                self.tableViewSideBar.frame =  CGRect(x: 0, y: 97, width: 316, height: 406)
            }
        }
    }
}



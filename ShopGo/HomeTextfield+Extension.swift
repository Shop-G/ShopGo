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
}



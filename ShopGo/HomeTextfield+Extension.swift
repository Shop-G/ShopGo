//
//  HomeTextfield+Extension.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/7/22.
//

import Foundation
import UIKit
extension HomeViewController {
    
    // Left textField image setup
    func placeLeftImage(textField: UITextField , image: UIImage) {
        let leftImage = UIImageView()
        leftImage.image = image
        let contentView = UIView()
        contentView.addSubview(leftImage)
        contentView.frame = CGRectMake(0, 0, 25, 20)
        leftImage.frame = CGRectMake(10, 0, 25, 20)
        textField.leftView = contentView
        textField.leftViewMode = .always
    }
    
    // Right textField image setup
    func placeRightImage(textField: UITextField , image: UIImage) {
        let leftImage = UIImageView()
        leftImage.image = image
        let contentView = UIView()
        contentView.addSubview(leftImage)
        contentView.frame = CGRectMake(0, 0, 25, 20)
        leftImage.frame = CGRectMake(-10, 0, 25, 20)
        textField.rightView = contentView
        textField.rightViewMode = .always
    }
    
    // Configuring textfield icons and padding
    func configureTextfieldIcons() {
        guard let magnifyingImage = UIImage(named: "magnifying") else {return}
        self.placeLeftImage(textField: typeText, image: magnifyingImage)
        guard let locationImage = UIImage(named: "location") else {return}
        self.placeRightImage(textField: typeText, image: locationImage)
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



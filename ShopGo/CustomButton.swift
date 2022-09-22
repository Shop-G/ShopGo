//
//  CustomButton.swift
//  ShopGo
//
//  Created by Quratulain on 9/21/22.
//

import UIKit
class CustomButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRadiusAndShadow()
    }
    
    // Setting the custom button corner radius and shadows
    func setRadiusAndShadow() {
        layer.cornerRadius = 22
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.gray.cgColor
    }
}



//
//  Textfield+extension.swift
//  ShopGo
//
//  Created by Quratulain on 9/30/22.
//

import Foundation
import UIKit
extension UITextField {
    
    // textfield shake
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: center.y))
        layer.add(shake, forKey: "position")
    }
}

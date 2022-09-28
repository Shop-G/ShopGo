//
//  LaunchScreenAnimationViewController.swift
//  ShopGo
//
//  Created by Muhammad Rehman on 9/20/22.
//

import UIKit

class LaunchScreenAnimationViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var shopGoLabel: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           animation()
       }
    
//   Using this function to activate all the animation
     func animation(){
        shopGoLabel.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animateForMoving()
        })
        DispatchQueue.main.asyncAfter(deadline: .now()+1.8, execute: {
            self.shopGoLabel.isHidden = false
            self.animationForFading()
        })
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:{
            self.transiton()
        })
    }
    
//    This function is to move the logo from left to right
    func animateForMoving(){
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = logoImage.layer.position.x
        animation.toValue = logoImage.layer.position.x + 350
        animation.duration = 1.5
        logoImage.layer.add(animation, forKey: "launch")
        logoImage.layer.position = CGPoint(x: logoImage.layer.position.x + 350, y: logoImage.layer.position.y)
    }
    
//  This is for fading in the logo
    func animationForFading(){
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.fromValue = 0
        fadeIn.toValue = 1
        fadeIn.duration = 0.5
        shopGoLabel.layer.add(fadeIn, forKey: nil)
    }
    
    func transiton(){
        /*
         Use this function to naviagte to next screen
         */
        self.performSegue(withIdentifier: "otpVC", sender: nil)
    }
}

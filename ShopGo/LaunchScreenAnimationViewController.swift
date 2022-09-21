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
    func animateForMoving(){
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = logoImage.layer.position.x
        animation.toValue = logoImage.layer.position.x + 300
        animation.duration = 1.5
        logoImage.layer.add(animation, forKey: "launch")
        logoImage.layer.position = CGPoint(x: logoImage.layer.position.x + 300, y: logoImage.layer.position.y)
    }
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
    }
    

    

}

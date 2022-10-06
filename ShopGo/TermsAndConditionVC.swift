//
//  TermsAndConditionVC.swift
//  ShopGo
//
//  Created by Ayesha Alyas on 9/20/22.
//

import UIKit

class TermsAndConditionVC: UIViewController {
    
    var isReadMoreTapped = false
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var readMoreLablel: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var readMoreCenter: NSLayoutConstraint!
    @IBOutlet weak var readMoreView: UIView!
    
  override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LogInButton(_ sender: Any) {
        let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func NextButton(_ sender: Any) {
        let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func readMoreAction(_ sender: UIButton) {
        if isReadMoreTapped {
            readMoreCenter.constant = 0
            
            readMoreView.backgroundColor = UIColor(red:  0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            readMoreLablel.text = "Read more"
            textlabel.numberOfLines = 8
            arrowImg.image = UIImage(systemName: "chevron.down")
            isReadMoreTapped = false
        } else {
            readMoreLablel.text = ""
            readMoreCenter.constant = ((view.frame.width/2) - 100)
            readMoreView.backgroundColor = .clear
            textlabel.numberOfLines = 0
            arrowImg.image = UIImage(systemName: "chevron.up")
            isReadMoreTapped = true
        }
    }

}

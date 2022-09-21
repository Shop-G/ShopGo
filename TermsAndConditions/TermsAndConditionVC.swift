//
//  TermsAndConditionVC.swift
//  ShopGo
//
//  Created by Ayesha Alyas on 9/20/22.
//

import UIKit

class TermsAndConditionVC: UIViewController {
    
    @IBOutlet weak var textLablel: UILabel!
    @IBOutlet weak var readMoreLablel: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
    var isReadMoreTapped = false
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func readMoreAction(_ sender: UIButton) {
        if isReadMoreTapped {
            readMoreLablel.text = "Read more"
            textLablel.numberOfLines = 8
            arrowImg.image = UIImage(systemName: "chevron.down")
            isReadMoreTapped = false
        }else {
            readMoreLablel.text = "Read less"
            textLablel.numberOfLines = 0
            arrowImg.image = UIImage(systemName: "chevron.up")
            isReadMoreTapped = true
        }
    }

}

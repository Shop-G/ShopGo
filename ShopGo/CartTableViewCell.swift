//
//  CartTableViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/6/22.
//

import UIKit
class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartProduct: UILabel!
    @IBOutlet weak var cartProductPrice: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var cartBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  CartTableView+extension.swift
//  ShopGo
//
//  Created by Quratulain on 10/6/22.
//

import Foundation
import UIKit
extension CartViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.cartImage.image = imagesArray[indexPath.row]
        cell.cartImage.imageCornerStyle()
        cell.cartBackgroundView.viewCornerStyle()
        cell.plusButton.cartButtonCornerStyle()
        cell.minusButton.cartButtonCornerStyle()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension UIButton {
    
    func cartButtonCornerStyle() {
        layer.cornerRadius = layer.frame.height/2
        layer.masksToBounds = true
    }
}

extension UIView {
    func viewCornerStyle() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

extension UIImageView {
    func imageCornerStyle() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

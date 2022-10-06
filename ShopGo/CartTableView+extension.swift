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
        cell.cartBackgroundView.layer.cornerRadius = 10
        cell.cartBackgroundView.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
}

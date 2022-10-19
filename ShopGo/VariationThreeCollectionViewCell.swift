//
//  VariationThreeCollectionViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/18/22.
//

import UIKit

class VariationThreeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VariationThreeCollectionViewCell"
    var heartButton = UIButton()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heartButtonSetup()
        imageSetup()
        constraints()
    }
    
    func constraints(){
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addSubview(heartButton)
        NSLayoutConstraint.activate([heartButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5),heartButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,constant: 5), heartButton.heightAnchor.constraint(equalToConstant: 20), heartButton.widthAnchor.constraint(equalToConstant: 20)])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VariationThreeCollectionViewCell {
    // Image Setup
    func imageSetup() {
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
    // Heart Button Setup
    func heartButtonSetup() {
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        heartButton.tintColor = UIColor(named: "ButtonColor")
        heartButton.contentVerticalAlignment = .fill
        heartButton.contentHorizontalAlignment = .fill
        heartButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

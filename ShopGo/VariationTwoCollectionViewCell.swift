//
//  VariationTwoCollectionViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/15/22.
//

import UIKit

class VariationTwoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VariationTwoCollectionViewCell"
    let nameLabel = UILabel()
    var heartButton = UIButton()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabelSetup()
        heartButtonSetup()
        imageSetup()
        constraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VariationTwoCollectionViewCell {
    
    func constraints(){
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addSubview(heartButton)
        NSLayoutConstraint.activate([heartButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5), heartButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,constant: 5), heartButton.heightAnchor.constraint(equalToConstant: 20), heartButton.widthAnchor.constraint(equalToConstant: 20)])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10), nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor), nameLabel.heightAnchor.constraint(equalToConstant: 50), nameLabel.widthAnchor.constraint(equalToConstant: 150)])
    }
    // Image Setup
    func imageSetup() {
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
    // Heartbutton Setup
    func heartButtonSetup() {
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        heartButton.tintColor = UIColor(named: "ButtonColor")
        heartButton.contentVerticalAlignment = .fill
        heartButton.contentHorizontalAlignment = .fill
        heartButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // Namelabel Setup
    func nameLabelSetup() {
        nameLabel.textColor = UIColor.systemGray
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 3
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

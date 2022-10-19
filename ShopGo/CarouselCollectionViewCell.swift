//
//  CarouselCollectionViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/15/22.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CarouselCollectionViewCell"
    var heartButton = UIButton()
    let trendingLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageSetup()
        labelSetup()
        heartButtonSetup()
        constraints()
    }
    // All subview Constraints
    func constraints(){
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10).isActive = true
        addSubview(trendingLabel)
        NSLayoutConstraint.activate([trendingLabel.topAnchor.constraint(equalTo: imageView.topAnchor , constant: 10), trendingLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor , constant: -20), trendingLabel.heightAnchor.constraint(equalToConstant: 50) , trendingLabel.widthAnchor.constraint(equalToConstant: 100) , ])
        addSubview(heartButton)
        NSLayoutConstraint.activate([heartButton.topAnchor.constraint(equalTo: imageView.topAnchor , constant: 5), heartButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor , constant: 5), heartButton.heightAnchor.constraint(equalToConstant: 30) , heartButton.widthAnchor.constraint(equalToConstant: 30)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselCollectionViewCell {
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
    // Trending Label Setup
    func labelSetup() {
        trendingLabel.text = "Trending Products"
        trendingLabel.textColor = UIColor.white
        trendingLabel.textAlignment = .center
        trendingLabel.numberOfLines = 3
        trendingLabel.font = .boldSystemFont(ofSize: 20)
        trendingLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

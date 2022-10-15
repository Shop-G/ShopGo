//
//  CarouselCollectionViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/15/22.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    static let identifier = "CarouselCollectionViewCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        addSubview(imageView)
        addSubview(pageControl)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        pageControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor , constant: -10).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


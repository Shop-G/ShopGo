//
//  VariationTwoTableViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/14/22.
//

import UIKit

class VariationTwoTableViewCell: UITableViewCell {
    
    var Images: [UIImage]? {
        didSet{
            collectionView.reloadData()
        }
    }
    var CarouselImages : [UIImage] = [ UIImage(named: "Womenclothing")! ,UIImage(named: "Jewelery1")!,UIImage(named: "Watches")!,UIImage(named: "Makeup")!,UIImage(named: "Shoes")!]
    
    static let identifier = "VariationTwoTableViewCell"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
    
    override required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(VariationTwoCollectionViewCell.self, forCellWithReuseIdentifier: VariationTwoCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: self.topAnchor), collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor), collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor) , collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VariationTwoTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VariationTwoCollectionViewCell", for: indexPath) as! VariationTwoCollectionViewCell
        cell.imageView.image = CarouselImages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}

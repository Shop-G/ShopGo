//
//  VariationThreeTableViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/18/22.
//

import UIKit

class VariationThreeTableViewCell: UITableViewCell {
    
    static let identifier = "VariationThreeTableViewCell"
    var nameLabelTitles : [String] = [ "Clothes Brand", "Watches Brand", "Jewelry Brand", "Makeup Brand", "Shoes Brand"]
    var CarouselImages : [UIImage] = [ UIImage(named: "Womenclothing")! ,UIImage(named: "Jewelery1")!,UIImage(named: "Watches")!,UIImage(named: "Makeup")!,UIImage(named: "Shoes")!]
    var Images: [UIImage]? {
        didSet{
            collectionView.reloadData()
        }
    }
    let allButton : UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.textColor = .gray
        button.setTitle("All >", for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let recentLabel = UILabel()
    let collectionView : UICollectionView = {
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
    }
    
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
    
    override required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionviewSetup()
        labelSetup()
        self.addSubview(allButton)
        NSLayoutConstraint.activate([allButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 5), allButton.widthAnchor.constraint(equalToConstant: 50), allButton.trailingAnchor.constraint(equalTo: self.trailingAnchor ,constant: -40), allButton.heightAnchor.constraint(equalToConstant: 30)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VariationThreeTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VariationThreeCollectionViewCell", for: indexPath) as! VariationThreeCollectionViewCell
        cell.imageView.image = CarouselImages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    // Collectionview Setup & constraints
    func collectionviewSetup() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(VariationThreeCollectionViewCell.self, forCellWithReuseIdentifier: VariationThreeCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: self.topAnchor), collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor), collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor), collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    // Label Setup & Constraints
    func labelSetup() {
        recentLabel.textColor = UIColor.black
        recentLabel.textAlignment = .left
        recentLabel.numberOfLines = 1
        recentLabel.font = .boldSystemFont(ofSize: 20)
        recentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(recentLabel)
        NSLayoutConstraint.activate([recentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),recentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10), recentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 10)])
    }
}

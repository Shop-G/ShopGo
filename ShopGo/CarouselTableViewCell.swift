//
//  CarouselTableViewCell.swift
//  ShopGo
//
//  Created by Quratulain on 10/14/22.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    static let identifier = "CarouselTableViewCell"
    var CarouselImages : [UIImage] = [ UIImage(named: "Bag5")! ,UIImage(named: "Bag4")!,UIImage(named: "Bag3")!,UIImage(named: "Bag2")!,UIImage(named: "Bag1")!]
    var currentCellIndex = 0
    var timer : Timer?
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor(named: "PagetintColor")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "ButtonColor")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    var Images: [UIImage]? {
        didSet{
            collectionView.reloadData()
        }
    }
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
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
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: self.topAnchor), collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor), collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor) , collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        self.addSubview(pageControl)
        self.pageControl.sizeToFit()
        self.pageControl.numberOfPages = CarouselImages.count
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        NSLayoutConstraint.activate([pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: -20), pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor), pageControl.heightAnchor.constraint(equalToConstant: 60), pageControl.widthAnchor.constraint(equalToConstant: 150)])
    }
    
    @objc func slideToNext() {
        if currentCellIndex < CarouselImages.count-1 {
            currentCellIndex = currentCellIndex + 1
        }
        else {
            currentCellIndex = 0
        }
        pageControl.currentPage = currentCellIndex
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        cell.imageView.image = CarouselImages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width, height: frameSize.height - 50)
    }
}

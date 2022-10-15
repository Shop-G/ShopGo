//
//  HomeViewController.swift
//  ShopGo
//
//  Created by Blall Ahmad on 10/6/22.
//

import UIKit

class HomeViewController: UIViewController {
   
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CarouselTableViewCell.self, forCellReuseIdentifier: CarouselTableViewCell.identifier)
        table.register(VariationTwoTableViewCell.self, forCellReuseIdentifier: VariationTwoTableViewCell.identifier)
        return table
    }()
    
    @IBOutlet weak var locationIcon: UIButton!
    @IBOutlet weak var burgerMenu: UIButton!
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var trendingOption: UIButton!
    @IBOutlet weak var menOption: UIButton!
    @IBOutlet weak var womenOption: UIButton!
    @IBOutlet weak var childrenOption: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
        tableView.delegate = self
        tableView.dataSource = self
        configureTextfieldIcons()
        modification()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func trendingBtn(_ sender: Any) {
    }
    @IBAction func menBtn(_ sender: Any) {
    }
    @IBAction func womenBtn(_ sender: Any) {
    }
    @IBAction func childrenBtn(_ sender: Any) {
    }
}

// TableView Setup
extension  HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier, for: indexPath) as! CarouselTableViewCell
            cell.collectionView.reloadData()
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: VariationTwoTableViewCell.identifier, for: indexPath) as! VariationTwoTableViewCell
            cell.collectionView.reloadData()
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier, for: indexPath) as! CarouselTableViewCell
            cell.collectionView.reloadData()
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: VariationTwoTableViewCell.identifier, for: indexPath) as! VariationTwoTableViewCell
            cell.collectionView.reloadData()
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        else if indexPath.row == 2 {
            return 250
        }
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableViewConfiguration() {
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: self.typeText.bottomAnchor,constant: 10) , tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50) , tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0) , tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0)])
    }
}



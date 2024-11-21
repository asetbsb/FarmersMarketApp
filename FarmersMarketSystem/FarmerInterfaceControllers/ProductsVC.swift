//
//  ProductsVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

struct ProductBrain {
    var productNames = [
        "Apple"
    ]
    
    var productImages = [
        UIImage(named: "apple")
    ]
}

final class ProductsVC: UIViewController {
    
    private var productBrain = ProductBrain()
    private let addProductVC = AddProductVC()
    
    private lazy var productsTitle: UILabel = {
        let label = UILabel()
        label.text = "My Products"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica Neue", size: 24)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("Add product", for: .normal)
        button.addTarget(self, action: #selector(addProductAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var productsTableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.register(AddProductCell.self, forCellReuseIdentifier: AddProductCell.identifier)
        addProductVC.delegate = self
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        addSubviews()
        setupConstraints()
        productsTableview.delegate = self
        productsTableview.dataSource = self
        addProductVC.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(productsTitle)
        view.addSubview(addProductButton)
        view.addSubview(productsTableview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            productsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1),
            productsTitle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: view.frame.width*0.35),
            
            addProductButton.leadingAnchor.constraint(
                equalTo: productsTitle.trailingAnchor, constant: view.frame.width*0.05
            ),
            addProductButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addProductButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -view.frame.width*0.1
            ),
            addProductButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            addProductButton.heightAnchor.constraint(equalTo: productsTitle.heightAnchor),
            
            productsTableview.topAnchor.constraint(equalTo: productsTitle.bottomAnchor, constant: 20),
            productsTableview.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: view.frame.width*0.1
            ),
            productsTableview.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -view.frame.width*0.1
            ),
            productsTableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    @objc private func addProductAction() {
        addProductVC.modalPresentationStyle = .fullScreen
        addProductVC.delegate = self
        self.present(addProductVC, animated: true, completion: nil)
    }
}

extension ProductsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        productBrain.productNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddProductCell.identifier) as? AddProductCell
        else {
            return UITableViewCell()
        }
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 18
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        addProductVC.delegate = self
        cell.set(productBrain.productNames[indexPath.section])
        cell.set2(productBrain.productImages[indexPath.section]!)
        return cell
    }
}

extension ProductsVC: AddNewProductToTableView {
    func passImage(_ image: UIImage) {
        productBrain.productImages.append(image)
        productsTableview.reloadData()
    }
    
    func passName(_ name: String) {
        productBrain.productNames.append(name)
        productsTableview.reloadData()
    }
    
    
}

//
//  ProductCell.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

class ProductCell: UITableViewCell {
    
    private lazy var productImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "brocolli")
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var productTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var restockButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Restock", for: .normal)
        button.addTarget(self, action: #selector(restockAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static var identifier = "TableViewCellIdentifier"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(_ productName: String) {
        productTitle.text = productName
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(productImage)
        addSubview(productTitle)
        addSubview(restockButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor),
            
            productTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            productTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            restockButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            restockButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            restockButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            restockButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func restockAction() {
        
    }
}

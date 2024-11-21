//
//  AddProductCell.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

class AddProductCell: UITableViewCell {
    
    private lazy var productImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var productTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.addTarget(self, action: #selector(editProductAction), for: .touchUpInside)
        
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

    func set (_ name: String) {
        productTitle.text = name
    }
    
    func set2 (_ image: UIImage) {
        productImage.image = image
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(productImage)
        addSubview(productTitle)
        addSubview(editButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor),
            
            productTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12),
            productTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            editButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            editButton.widthAnchor.constraint(equalTo: editButton.heightAnchor),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func editProductAction() {
        
    }
}

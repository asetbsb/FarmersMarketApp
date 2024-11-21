//
//  RestockModalVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/19/24.
//

import UIKit

class RestockModalVC: UIViewController {
    
    // UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Restock"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let productNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Broccoli"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let currentQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Quantity"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let currentQuantityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "3 kg"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let addQuantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Quantity"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.value = 1
        return stepper
    }()
    
    private let quantityValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let restockButton: UIButton = {
        let button = UIButton()
        button.setTitle("Restock Product", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("×", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        // Add subviews
        [titleLabel, productNameLabel, productNameValueLabel, currentQuantityLabel, currentQuantityValueLabel,
         addQuantityLabel, quantityValueLabel, quantityStepper, restockButton, closeButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Layout
        NSLayoutConstraint.activate([
            // Close Button
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Product Name
            productNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            productNameValueLabel.centerYAnchor.constraint(equalTo: productNameLabel.centerYAnchor),
            productNameValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Current Quantity
            currentQuantityLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 16),
            currentQuantityLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),
            
            currentQuantityValueLabel.centerYAnchor.constraint(equalTo: currentQuantityLabel.centerYAnchor),
            currentQuantityValueLabel.trailingAnchor.constraint(equalTo: productNameValueLabel.trailingAnchor),
            
            // Add Quantity
            addQuantityLabel.topAnchor.constraint(equalTo: currentQuantityLabel.bottomAnchor, constant: 16),
            addQuantityLabel.leadingAnchor.constraint(equalTo: currentQuantityLabel.leadingAnchor),
            
            quantityValueLabel.centerYAnchor.constraint(equalTo: addQuantityLabel.centerYAnchor),
            quantityValueLabel.trailingAnchor.constraint(equalTo: currentQuantityValueLabel.trailingAnchor),
            
            quantityStepper.centerYAnchor.constraint(equalTo: quantityValueLabel.centerYAnchor),
            quantityStepper.trailingAnchor.constraint(equalTo: quantityValueLabel.trailingAnchor, constant: 60),
            
            // Restock Button
            restockButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            restockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            restockButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            restockButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupActions() {
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        restockButton.addTarget(self, action: #selector(restockProduct), for: .touchUpInside)
        quantityStepper.addTarget(self, action: #selector(updateQuantity), for: .valueChanged)
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func restockProduct() {
        print("Restocking product with quantity: \(Int(quantityStepper.value))")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func updateQuantity() {
        quantityValueLabel.text = "\(Int(quantityStepper.value))"
    }
}

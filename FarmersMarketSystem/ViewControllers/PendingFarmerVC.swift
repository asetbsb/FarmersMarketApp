//
//  PendingFarmerVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/11/24.
//

import UIKit

class PendingFarmerVC: UIViewController {
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotColored")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pendingTitle: UILabel = {
        let label = UILabel()
        label.text = "Pending Approval"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor(rgb: 0x53B175)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private lazy var pendingSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Your account is under review. You will be notified via email once approved."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pendingSubTitle2: UILabel = {
        let label = UILabel()
        label.text = "Thank you for your patience!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        addSubviews()
        activityIndicator.startAnimating()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(carrotImage)
        view.addSubview(pendingTitle)
        view.addSubview(activityIndicator)
        view.addSubview(pendingSubTitle)
        view.addSubview(pendingSubTitle2)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            carrotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            pendingTitle.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 80),
            pendingTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            pendingTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            activityIndicator.topAnchor.constraint(equalTo: pendingTitle.bottomAnchor, constant: 50),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pendingSubTitle.topAnchor.constraint(
                equalTo: activityIndicator.bottomAnchor, constant: 50
            ),
            pendingSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            pendingSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            pendingSubTitle2.topAnchor.constraint(equalTo: pendingSubTitle.bottomAnchor, constant: 28),
            pendingSubTitle2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            pendingSubTitle2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28)
        ])
    }

}

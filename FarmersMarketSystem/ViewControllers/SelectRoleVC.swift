//
//  SelectRoleVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/2/24.
//

import UIKit

final class SelectRoleVC: UIViewController {

    //MARK: - UI elements
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotColored")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: -Main Content
    
    private lazy var welcomeTitleView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome! \nGet started by selecting your role."
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var welcomeSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose the option"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - bottom UI elements
    
    private lazy var buyerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Buyer", for: .normal)
        button.addTarget(self, action: #selector(buyerAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buyerSubLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up as a Buyer to explore available goods and connect with local farmers"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var farmerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Farmer", for: .normal)
        button.addTarget(self, action: #selector(farmerAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var farmerSubLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up as a Farmer to reach more customers and grow your business"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .thin)
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
        setContentConstraints()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(carrotImage)
        
        view.addSubview(welcomeTitleView)
        welcomeTitleView.addSubview(welcomeTitleLabel)
        welcomeTitleView.addSubview(welcomeSubTitleLabel)
        
        view.addSubview(buyerButton)
        view.addSubview(buyerSubLabel)
        view.addSubview(farmerButton)
        view.addSubview(farmerSubLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            carrotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeTitleView.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 80),
            welcomeTitleView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: (view.frame.width/10)
            ),
            welcomeTitleView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -(view.frame.width/10)
            ),
            
            buyerButton.topAnchor.constraint(equalTo: welcomeTitleView.bottomAnchor, constant: 80),
            buyerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            buyerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            buyerSubLabel.topAnchor.constraint(equalTo: buyerButton.bottomAnchor, constant: 15),
            buyerSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyerSubLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: (view.frame.width/10)
            ),
            buyerSubLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -(view.frame.width/10)
            ),
            
            farmerButton.topAnchor.constraint(equalTo: buyerSubLabel.bottomAnchor, constant: 80),
            farmerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            farmerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            farmerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            farmerSubLabel.topAnchor.constraint(equalTo: farmerButton.bottomAnchor, constant: 15),
            farmerSubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            farmerSubLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: (view.frame.width/10)
            ),
            farmerSubLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -(view.frame.width/10)
            ),
        ])
    }
    
    private func setContentConstraints() {
        NSLayoutConstraint.activate([
            welcomeTitleLabel.topAnchor.constraint(equalTo: welcomeTitleView.topAnchor),
            welcomeTitleLabel.leadingAnchor.constraint(equalTo: welcomeTitleView.leadingAnchor),
            welcomeTitleLabel.trailingAnchor.constraint(equalTo: welcomeTitleView.trailingAnchor),
            
            welcomeSubTitleLabel.topAnchor.constraint(
                equalTo: welcomeTitleLabel.bottomAnchor, constant: 8
            ),
            welcomeSubTitleLabel.leadingAnchor.constraint(equalTo: welcomeTitleView.leadingAnchor),
            welcomeSubTitleLabel.bottomAnchor.constraint(equalTo: welcomeTitleView.bottomAnchor),
        ])
    }
    
    @objc private func buyerAction() {
        let selectLocationVC = SelectLocationVC()
        selectLocationVC.modalPresentationStyle = .fullScreen
        present(selectLocationVC, animated: true)
    }
    
    @objc private func farmerAction() {
        let onboardingVC = FarmSignupVC()
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true)
    }
}

//
//  ViewController.swift
//  FarmersMarketSystem
//
//  Created by Asset on 10/31/24.
//

import UIKit

final class OnboardingVC: UIViewController {
    
    private lazy var elementsView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotTransparent")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to our store"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var welcomeSubLabel: UILabel = {
        let label = UILabel()
        label.text = "Get your groceries in as fast as one hour"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Get started", for: .normal)
        button.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        setBackgroundImage(imageName: "backgroundOnboarding")
        addSubviews()
        setConstraints()
    }
    
    private func setBackgroundImage(imageName: String) {
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func addSubviews() {
        view.addSubview(elementsView)
        elementsView.addSubview(carrotImage)
        elementsView.addSubview(welcomeLabel)
        elementsView.addSubview(welcomeSubLabel)
        elementsView.addSubview(getStartedButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            elementsView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5
            ),
            elementsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            elementsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            elementsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            carrotImage.centerXAnchor.constraint(equalTo: elementsView.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: elementsView.topAnchor, constant: 20),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            welcomeLabel.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: elementsView.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: elementsView.leadingAnchor, constant: 100),
            welcomeLabel.trailingAnchor.constraint(equalTo: elementsView.trailingAnchor, constant: -100),
            
            welcomeSubLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            welcomeSubLabel.centerXAnchor.constraint(equalTo: elementsView.centerXAnchor),
            welcomeSubLabel.leadingAnchor.constraint(equalTo: elementsView.leadingAnchor, constant: 50),
            welcomeSubLabel.trailingAnchor.constraint(equalTo: elementsView.trailingAnchor, constant: -50),
            
            getStartedButton.bottomAnchor.constraint(equalTo: elementsView.bottomAnchor, constant: -20),
            getStartedButton.centerXAnchor.constraint(equalTo: elementsView.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            getStartedButton.heightAnchor.constraint(equalTo: elementsView.heightAnchor, multiplier: 0.2)
            
        ])
    }
    
    @objc private func goToNextPage() {
        let loginPageVC = LoginPageVC()
        loginPageVC.modalPresentationStyle = .fullScreen
        self.present(loginPageVC, animated: true, completion: nil)
    }

}


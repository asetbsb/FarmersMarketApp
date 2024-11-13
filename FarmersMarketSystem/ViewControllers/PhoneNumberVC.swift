//
//  PhoneNumberVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/11/24.
//

import UIKit

class PhoneNumberVC: UIViewController {
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotColored")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your mobile number"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile number"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your phone number"
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.contentMode = .scaleToFill
        textField.keyboardType = .decimalPad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signupAction), for: .touchUpInside)

        
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        arrowImageView.tintColor = .white
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(arrowImageView)

        NSLayoutConstraint.activate([
            arrowImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -12)
        ])

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(carrotImage)
        view.addSubview(titleLabel)
        view.addSubview(numberLabel)
        view.addSubview(numberTextField)
        view.addSubview(nextButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            carrotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            numberLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 52),
            numberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 12),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            nextButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26
            ),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func signupAction() {
        let selectLocationVC = SelectRoleVC()
        selectLocationVC.modalPresentationStyle = .fullScreen
        self.present(selectLocationVC, animated: true, completion: nil)
    }
}


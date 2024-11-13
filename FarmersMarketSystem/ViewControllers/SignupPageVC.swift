//
//  SignupPageVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 10/31/24.
//

import UIKit

final class SignupPageVC: UIViewController {

    //MARK: - UI elements
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotColored")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: -Main Content
    
    private lazy var signupTitleView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signupTitle: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signupSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Enter your credentials to continue"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Asset Bissenbayev"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailTitle: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "abc@some.com"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .emailAddress
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTitle: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "your password"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.contentMode = .scaleToFill
        textField.isSecureTextEntry = true
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
        button.sizeToFit()
        
        textField.rightView = button
        textField.rightViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - bottom UI elements
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
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
    
    private lazy var accountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have account?"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var goToLoginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.textColor = UIColor(rgb: 0x53B175)
        
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loginLabelPressed))
        label.addGestureRecognizer(tapGesture)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
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
        
        view.addSubview(signupTitleView)
        signupTitleView.addSubview(signupTitle)
        signupTitleView.addSubview(signupSubTitle)
        
        view.addSubview(nameView)
        nameView.addSubview(nameTitle)
        nameView.addSubview(nameTextField)
        
        view.addSubview(emailView)
        emailView.addSubview(emailTitle)
        emailView.addSubview(emailTextField)
        
        view.addSubview(passwordView)
        passwordView.addSubview(passwordTitle)
        passwordView.addSubview(passwordTextField)
        
        view.addSubview(signupButton)
        view.addSubview(accountQuestionLabel)
        view.addSubview(goToLoginLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            carrotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            signupTitleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            signupTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupTitleView.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 60),
        
            nameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            nameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameView.topAnchor.constraint(equalTo: signupTitleView.bottomAnchor, constant: 40),
            
            emailView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 40),
            
            passwordView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 40),
            
            signupButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 50),
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            signupButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            accountQuestionLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 15),
            accountQuestionLabel.leadingAnchor.constraint(
                equalTo: signupButton.leadingAnchor, constant: 40
            ),
            
            goToLoginLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 15),
            goToLoginLabel.leadingAnchor.constraint(
                equalTo: accountQuestionLabel.trailingAnchor, constant: 5
            )
        ])
    }
    
    private func setContentConstraints() {
        NSLayoutConstraint.activate([
            signupTitle.topAnchor.constraint(equalTo: signupTitleView.topAnchor),
            signupTitle.leadingAnchor.constraint(equalTo: signupTitleView.leadingAnchor),
            
            signupSubTitle.topAnchor.constraint(equalTo: signupTitle.bottomAnchor, constant: 8),
            signupSubTitle.leadingAnchor.constraint(equalTo: signupTitleView.leadingAnchor),
            signupSubTitle.bottomAnchor.constraint(equalTo: signupTitleView.bottomAnchor),
            
            nameTitle.topAnchor.constraint(equalTo: nameView.topAnchor),
            nameTitle.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: nameView.widthAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: nameView.bottomAnchor),
            
            emailTitle.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailTitle.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalTo: emailView.widthAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor),

            
            passwordTitle.topAnchor.constraint(equalTo: passwordView.topAnchor),
            passwordTitle.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTitle.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: passwordView.widthAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor)
        ])
    }
    
    @objc private func nextAction() {
        let selectLocationVC = PhoneNumberVC()
        selectLocationVC.modalPresentationStyle = .fullScreen
        self.present(selectLocationVC, animated: true, completion: nil)
    }
    
    @objc private func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @objc private func loginLabelPressed() {
        let loginPageVC = LoginPageVC()
        loginPageVC.modalPresentationStyle = .fullScreen
        self.present(loginPageVC, animated: true, completion: nil)
    }
}

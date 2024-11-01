//
//  loginPageVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 10/31/24.
//

import UIKit

class LoginPageVC: UIViewController {
    
    //MARK: - UI elements
    
    private lazy var carrotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "carrotColored")
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: -Main Content
    
    private lazy var loginTitleView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Enter your emails and password"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - bottom UI elements
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var accountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account? Sign up"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var getBackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Get back", for: .normal)
        button.addTarget(self, action: #selector(getBackAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        view.addSubview(loginTitleView)
        loginTitleView.addSubview(loginTitle)
        loginTitleView.addSubview(loginSubTitle)
        
        view.addSubview(emailView)
        emailView.addSubview(emailTitle)
        emailView.addSubview(emailTextField)
        
        view.addSubview(passwordView)
        passwordView.addSubview(passwordTitle)
        passwordView.addSubview(passwordTextField)
        
        view.addSubview(loginButton)
        view.addSubview(accountQuestionLabel)
        view.addSubview(getBackButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            carrotImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            carrotImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            carrotImage.widthAnchor.constraint(equalToConstant: 50),
            carrotImage.heightAnchor.constraint(equalToConstant: 50),
            
            loginTitleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginTitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitleView.topAnchor.constraint(equalTo: carrotImage.bottomAnchor, constant: 80),
        
            
            emailView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailView.topAnchor.constraint(equalTo: loginTitleView.bottomAnchor, constant: 50),
            
            passwordView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            accountQuestionLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            accountQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getBackButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50
            ),
            getBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getBackButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            getBackButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
        ])
    }
    
    private func setContentConstraints() {
        NSLayoutConstraint.activate([
            loginTitle.topAnchor.constraint(equalTo: loginTitleView.topAnchor),
            loginTitle.leadingAnchor.constraint(equalTo: loginTitleView.leadingAnchor),
            
            loginSubTitle.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 8),
            loginSubTitle.leadingAnchor.constraint(equalTo: loginTitleView.leadingAnchor),
            loginSubTitle.bottomAnchor.constraint(equalTo: loginTitleView.bottomAnchor),
            
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
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),

        ])
    }
    
    @objc private func loginAction() {
        let signupPageVC = SignupPageVC()
        signupPageVC.modalPresentationStyle = .fullScreen
        self.present(signupPageVC, animated: true, completion: nil)
    }
    
    @objc private func getBackAction() {
        dismiss(animated: true)
    }
    
    @objc private func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
}

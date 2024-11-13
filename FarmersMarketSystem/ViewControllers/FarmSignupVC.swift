//
//  FarmSignupVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/11/24.
//

import UIKit

class FarmSignupVC: UIViewController {
    
    private let cities = ["Almaty", "Astana", "Shymkent", "Aktobe"]
    
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
        label.text = "Farm Details"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signupSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Enter farm details to continue"
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
        label.text = "Farm name"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type farm name"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .default
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var locationView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var locationTitle: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Select location"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .emailAddress
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var descriptionView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Description (optional)"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type description of farm"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - bottom UI elements
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 12
        button.setTitle("Sign up", for: .normal)
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
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
    
    private var cityPicker = UIPickerView()

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
        setPickerView()
    }
    
    private func setPickerView() {
        cityPicker.delegate = self
        cityPicker.dataSource = self
        locationTextField.inputView = cityPicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        locationTextField.inputAccessoryView = toolbar
    }
    
    private func addSubviews() {
        view.addSubview(carrotImage)
        
        view.addSubview(signupTitleView)
        signupTitleView.addSubview(signupTitle)
        signupTitleView.addSubview(signupSubTitle)
        
        view.addSubview(nameView)
        nameView.addSubview(nameTitle)
        nameView.addSubview(nameTextField)
        
        view.addSubview(locationView)
        locationView.addSubview(locationTitle)
        locationView.addSubview(locationTextField)
        
        view.addSubview(descriptionView)
        descriptionView.addSubview(descriptionTitle)
        descriptionView.addSubview(descriptionTextField)
        
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
            
            locationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            locationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 40),
            
            descriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 40),
            
            signupButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 50),
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
            
            locationTitle.topAnchor.constraint(equalTo: locationView.topAnchor),
            locationTitle.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            
            locationTextField.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: 8),
            locationTextField.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            locationTextField.widthAnchor.constraint(equalTo: locationView.widthAnchor),
            locationTextField.bottomAnchor.constraint(equalTo: locationView.bottomAnchor),

            
            descriptionTitle.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            descriptionTitle.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 8),
            descriptionTextField.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descriptionTextField.widthAnchor.constraint(equalTo: descriptionView.widthAnchor),
            descriptionTextField.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor)
        ])
    }
    
    @objc private func nextAction() {
        let selectLocationVC = PendingFarmerVC()
        selectLocationVC.modalPresentationStyle = .fullScreen
        self.present(selectLocationVC, animated: true, completion: nil)
    }
    
    @objc private func loginLabelPressed() {
        let loginPageVC = LoginPageVC()
        loginPageVC.modalPresentationStyle = .fullScreen
        self.present(loginPageVC, animated: true, completion: nil)
    }
    
    @objc private func donePressed() {
        view.endEditing(true)
    }
}

extension FarmSignupVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationTextField.text = cities[row]
    }
}

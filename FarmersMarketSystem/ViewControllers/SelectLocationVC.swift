//
//  SelectLocationVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/2/24.
//

import UIKit

final class SelectLocationVC: UIViewController {
    
    private let cities = ["Almaty", "Astana", "Shymkent", "Aktobe"]
    private let areas = ["Downtown", "Suburbs", "Countryside"]

    // MARK: - UI Elements
    
    private lazy var mapIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location") // Replace with your image asset name
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Your Location"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.font = UIFont(name: "Helvetica Neue", size: 28)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Switch on your location to stay in tune with what’s happening in your area"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Your city"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Astana"
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var areaLabel: UILabel = {
        let label = UILabel()
        label.text = "Your area"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var areaTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your address"
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 22, weight: .light)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.keyboardType = .emailAddress
        textField.contentMode = .scaleToFill
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var cityPicker = UIPickerView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        addSubviews()
        setConstraints()
        setPickerView()
    }
    
    private func setPickerView() {
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityTextField.inputView = cityPicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        cityTextField.inputAccessoryView = toolbar
    }
    
    private func addSubviews() {
        view.addSubview(mapIconImageView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(cityLabel)
        view.addSubview(cityTextField)
        view.addSubview(areaLabel)
        view.addSubview(areaTextField)
        view.addSubview(submitButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mapIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            mapIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapIconImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            mapIconImageView.heightAnchor.constraint(equalTo: mapIconImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: mapIconImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cityLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 54),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            areaLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 42),
            areaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            areaTextField.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 12),
            areaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            areaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            submitButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20
            ),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            submitButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func donePressed() {
        view.endEditing(true)
    }
    
    @objc private func signupAction() {
        let selectLocationVC = OnboardingVC()
        selectLocationVC.modalPresentationStyle = .fullScreen
        self.present(selectLocationVC, animated: true, completion: nil)
    }
}

extension SelectLocationVC: UIPickerViewDelegate, UIPickerViewDataSource {
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
        cityTextField.text = cities[row]
    }
}

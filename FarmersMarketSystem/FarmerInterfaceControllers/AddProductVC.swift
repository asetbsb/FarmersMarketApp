//
//  AddProductVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

protocol AddNewProductToTableView: AnyObject {
    func passImage (_ image: UIImage)
    func passName (_ name: String)
}

final class AddProductVC: UIViewController {
    
    weak var delegate: AddNewProductToTableView?
    
    private let cities = ["Almaty", "Astana", "Shymkent", "Aktobe"]
    private let categories = ["Fruits", "Vegetables"]
    private let images = [
        UIImage(named: "apple"), UIImage(named: "brocolli"), UIImage(named: "carrot"),
        UIImage(named: "cabbage"), UIImage(named: "onion"), UIImage(named: "eggs"), UIImage(named: "potatoes")
    ]
    
    private var selectedImage: UIImage?
    
    private var locationPicker = UIPickerView()
    private var categoryPicker = UIPickerView()
    private var imagePicker = UIPickerView()
    
    private lazy var imagesView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 22
        view.layer.borderColor = UIColor.systemGray6.cgColor
        view.layer.borderWidth = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(backArrowPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -Product Details Stackview
    
    private lazy var productsDetailsStackview: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .clear
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var productNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product name"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        return view
    }()
    
    private lazy var productNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type product name"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .default
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var productCategoryView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product category"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        return view
    }()
    
    private lazy var productCategoryTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Choose category"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .default
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var farmLocationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Farm location"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
    
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])

        return view
    }()
    
    private lazy var farmLocationTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Choose location"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .default
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var unitView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product unit (kg)"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])

        return view
    }()
    
    private lazy var unitTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type amount"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .decimalPad
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var priceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product price (tg)"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])

        return view
    }()
    
    private lazy var priceTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type price"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .decimalPad
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var productDetailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Product details"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.numberOfLines = 0
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])

        return view
    }()
    
    private lazy var detailsTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type details"
        tf.textAlignment = .left
        tf.font = .systemFont(ofSize: 22, weight: .light)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.keyboardType = .default
        tf.contentMode = .scaleToFill
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var addProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x53B175)
        button.layer.cornerRadius = 14
        button.setTitle("Add product", for: .normal)
        button.addTarget(self, action: #selector(addProductAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -End of uielements declaration
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetInputs()
    }
    
    func resetInputs() {
        productNameTF.text = ""
        productCategoryTF.text = ""
        farmLocationTF.text = ""
        unitTF.text = ""
        priceTF.text = ""
        selectedImage = nil
        detailsTF.text = ""
        // If you're using a UIImageView for the image, clear it:
        // imageView.image = nil
    }
    
    private func setupUI() {
        self.hideKeyboardWhenTappedAround()
        addSubviews()
        setupConstraints()
        setPickerView()
        setupTopViewGesture()
    }
    
    private func setupTopViewGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(topViewTapped))
        topView.addGestureRecognizer(tapGesture)
        topView.isUserInteractionEnabled = true
    }

    
    private func setPickerView() {
        locationPicker.delegate = self
        locationPicker.dataSource = self
        locationPicker.tag = 1
        farmLocationTF.inputView = locationPicker
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.tag = 2
        productCategoryTF.inputView = categoryPicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        farmLocationTF.inputAccessoryView = toolbar
        productCategoryTF.inputAccessoryView = toolbar
    }
    
    private func addSubviews() {
        view.addSubview(imagesView)
        imagesView.addSubview(topView)
        imagesView.addSubview(returnButton)
        
        view.addSubview(addProductButton)
        view.addSubview(productsDetailsStackview)
        addViewsToStackview()
    }
    
    private func addViewsToStackview() {
        productNameView.addSubview(productNameTF)
        productCategoryView.addSubview(productCategoryTF)
        farmLocationView.addSubview(farmLocationTF)
        unitView.addSubview(unitTF)
        priceView.addSubview(priceTF)
        productDetailsView.addSubview(detailsTF)
        
        NSLayoutConstraint.activate([
            productNameTF.leadingAnchor.constraint(equalTo: productNameView.leadingAnchor),
            productNameTF.trailingAnchor.constraint(equalTo: productNameView.trailingAnchor),
            productNameTF.heightAnchor.constraint(equalTo: productNameView.heightAnchor, multiplier: 0.5),
            productNameTF.bottomAnchor.constraint(equalTo: productNameView.bottomAnchor),
            
            productCategoryTF.leadingAnchor.constraint(equalTo: productCategoryView.leadingAnchor),
            productCategoryTF.trailingAnchor.constraint(equalTo: productCategoryView.trailingAnchor),
            productCategoryTF.heightAnchor.constraint(equalTo: productCategoryView.heightAnchor, multiplier: 0.5),
            productCategoryTF.bottomAnchor.constraint(equalTo: productCategoryView.bottomAnchor),
            
            farmLocationTF.leadingAnchor.constraint(equalTo: farmLocationView.leadingAnchor),
            farmLocationTF.trailingAnchor.constraint(equalTo: farmLocationView.trailingAnchor),
            farmLocationTF.heightAnchor.constraint(equalTo: farmLocationView.heightAnchor, multiplier: 0.5),
            farmLocationTF.bottomAnchor.constraint(equalTo: farmLocationView.bottomAnchor),
            
            unitTF.leadingAnchor.constraint(equalTo: unitView.leadingAnchor),
            unitTF.trailingAnchor.constraint(equalTo: unitView.trailingAnchor),
            unitTF.heightAnchor.constraint(equalTo: unitView.heightAnchor, multiplier: 0.5),
            unitTF.bottomAnchor.constraint(equalTo: unitView.bottomAnchor),
            
            priceTF.leadingAnchor.constraint(equalTo: priceView.leadingAnchor),
            priceTF.trailingAnchor.constraint(equalTo: priceView.trailingAnchor),
            priceTF.heightAnchor.constraint(equalTo: priceView.heightAnchor, multiplier: 0.5),
            priceTF.bottomAnchor.constraint(equalTo: priceView.bottomAnchor),
            
            detailsTF.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor),
            detailsTF.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor),
            detailsTF.heightAnchor.constraint(equalTo: productDetailsView.heightAnchor, multiplier: 0.5),
            detailsTF.bottomAnchor.constraint(equalTo: productDetailsView.bottomAnchor),
        ])
        
        productsDetailsStackview.addArrangedSubview(productNameView)
        productsDetailsStackview.addArrangedSubview(productCategoryView)
        productsDetailsStackview.addArrangedSubview(farmLocationView)
        productsDetailsStackview.addArrangedSubview(unitView)
        productsDetailsStackview.addArrangedSubview(priceView)
        productsDetailsStackview.addArrangedSubview(productDetailsView)
        
        NSLayoutConstraint.activate([
            productNameView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            productNameView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
            
            productCategoryView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            productCategoryView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
            
            farmLocationView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            farmLocationView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
            
            unitView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            unitView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
            
            priceView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
            
            productDetailsView.leadingAnchor.constraint(equalTo: productsDetailsStackview.leadingAnchor),
            productDetailsView.trailingAnchor.constraint(equalTo: productsDetailsStackview.trailingAnchor),
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imagesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imagesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1),
            imagesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width*0.1),
            imagesView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            addProductButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            addProductButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            addProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            productsDetailsStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1),
            productsDetailsStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width*0.1),
            productsDetailsStackview.topAnchor.constraint(equalTo: imagesView.bottomAnchor),
            productsDetailsStackview.bottomAnchor.constraint(equalTo: addProductButton.topAnchor, constant: -6),
            
            //MARK: -Constraints inside parent views
            
            topView.widthAnchor.constraint(equalTo: imagesView.widthAnchor, multiplier: 0.7),
            topView.heightAnchor.constraint(equalTo: imagesView.heightAnchor, multiplier: 0.7),
            topView.centerXAnchor.constraint(equalTo: imagesView.centerXAnchor),
            topView.centerYAnchor.constraint(equalTo: imagesView.centerYAnchor),
            
            returnButton.topAnchor.constraint(equalTo: imagesView.topAnchor, constant: 6),
            returnButton.leadingAnchor.constraint(equalTo: imagesView.leadingAnchor, constant: 6),
            returnButton.widthAnchor.constraint(equalTo: imagesView.widthAnchor, multiplier: 0.1),
            returnButton.heightAnchor.constraint(equalTo: returnButton.heightAnchor)
        ])
    }
    
    @objc private func backArrowPressed() {
        dismiss(animated: true)
    }
    
    @objc private func addProductAction() {
        guard let productName = productNameTF.text, !productName.isEmpty,
              let productCategory = productCategoryTF.text, !productCategory.isEmpty,
              let location = farmLocationTF.text, !location.isEmpty,
              let unit = unitTF.text, !unit.isEmpty,
              let price = priceTF.text, !price.isEmpty,
              let image = selectedImage else {
            // Show an alert for incomplete fields or missing image
            showAlert(message: "Please fill out all fields and select an image")
            return
        }
        
        delegate?.passName(productNameTF.text ?? "Noname")
        delegate?.passImage(image)
        
        dismiss(animated: true)
        // Handle product addition logic here
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func donePressed() {
        view.endEditing(true)
    }
    
    @objc private func topViewTapped() {
        imagePicker.tag = 3
        imagePicker.delegate = self
        imagePicker.dataSource = self

        let pickerViewAlert = UIAlertController(title: "Select an Image", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: pickerViewAlert.view.bounds.size.width - 20, height: 200))
        pickerView.tag = 3
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerViewAlert.view.addSubview(pickerView)
        
        pickerViewAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        pickerViewAlert.addAction(UIAlertAction(title: "Select", style: .default, handler: { _ in
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            if let selectedImage = self.images[selectedRow] {
                self.selectedImage = selectedImage // Save the selected image
                self.topView.layer.contents = selectedImage.cgImage // Update the view
            }
        }))
        
        present(pickerViewAlert, animated: true)
    }

}

extension AddProductVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return cities.count
        case 2: return categories.count
        case 3: return images.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return cities[row]
        case 2: return categories[row]
        case 3: return "Image \(row + 1)" // or a descriptive name if available
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            farmLocationTF.text = cities[row]
        case 2:
            productCategoryTF.text = categories[row]
        case 3:
            if let selectedImage = images[row] {
                topView.layer.contents = selectedImage.cgImage
            }
        default:
            break
        }
    }
}



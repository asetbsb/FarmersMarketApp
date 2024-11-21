//
//  DashboardVC.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

class DashboardVC: UIViewController {
    
    private var products = ["Broccoli", "Carrot", "Tomato"]
    
    private lazy var statisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "Statistics"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica Neue", size: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statisticsStackview: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.alignment = .center
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK: -Inside stackview
    
    private lazy var totalSalesView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "Total Sales"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lowStockItemsView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "Low-stock items"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var revenueView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.purple.cgColor
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "Revenue"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: -After stackview
    
    private lazy var lowStockLabel: UILabel = {
        let label = UILabel()
        label.text = "Low-stock Notifications"
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica Neue", size: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lowStockTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        addSubviews()
        setupConstraints()
        lowStockTableView.delegate = self
        lowStockTableView.dataSource = self
    }
    
    private func addSubviews() {
        view.addSubview(statisticsLabel)
        view.addSubview(statisticsStackview)
        
        statisticsStackview.addArrangedSubview(totalSalesView)
        statisticsStackview.addArrangedSubview(lowStockItemsView)
        statisticsStackview.addArrangedSubview(revenueView)
        
        view.addSubview(lowStockLabel)
        view.addSubview(lowStockTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            statisticsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1),
            
            statisticsStackview.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 20),
            statisticsStackview.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: view.frame.width*0.1
            ),
            statisticsStackview.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -view.frame.width*0.1
            ),
            
            lowStockLabel.topAnchor.constraint(equalTo: statisticsStackview.bottomAnchor, constant: 36),
            lowStockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.1),
            
            lowStockTableView.topAnchor.constraint(equalTo: lowStockLabel.bottomAnchor, constant: 20),
            lowStockTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: view.frame.width*0.1
            ),
            lowStockTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -view.frame.width*0.1
            ),
            lowStockTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            //Time for constraints inside stackview
            
            totalSalesView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            totalSalesView.heightAnchor.constraint(equalTo: totalSalesView.widthAnchor),
            
            lowStockItemsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            lowStockItemsView.heightAnchor.constraint(equalTo: lowStockItemsView.widthAnchor),
            
            revenueView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            revenueView.heightAnchor.constraint(equalTo: revenueView.widthAnchor),
        ])
    }
    
    

}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell
        else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 18
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        cell.set(products[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restockModalVC = RestockModalVC()
        restockModalVC.modalPresentationStyle = .popover
        self.present(restockModalVC, animated: true, completion: nil)
    }
}

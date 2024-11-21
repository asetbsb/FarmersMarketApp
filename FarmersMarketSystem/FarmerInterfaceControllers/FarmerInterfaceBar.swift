//
//  FarmerInterfaceBar.swift
//  FarmersMarketSystem
//
//  Created by Asset on 11/18/24.
//

import UIKit

final class FarmerInterfaceBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.setupTabs()
        
        self.selectedIndex = 1
        self.tabBar.tintColor = UIColor(rgb: 0x53B175)
        
        addSeparator()
        customizeNavigationBar()
    }
    
    private func addSeparator() {
        
        let separator = UIView()
        separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        separator.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            separator.topAnchor.constraint(equalTo: tabBar.topAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func setupTabs() {
        let dashboardVC = createNav(with: "Dashboard", and: UIImage(systemName: "house"), vc: DashboardVC())
        
        let productsVC = createNav(with: "Products", and: UIImage(systemName: "list.dash"), vc: ProductsVC())
        
        let accountFarmerVC = createNav(with: "Account", and: UIImage(systemName: "person.circle"), vc: AccountFarmerVC())
        
        self.setViewControllers([productsVC, dashboardVC, accountFarmerVC], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        
        return nav 
    }
    
    private func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = UIColor.lightGray.withAlphaComponent(0.5) // Separator color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

}

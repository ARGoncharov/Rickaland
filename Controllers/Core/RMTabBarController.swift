//
//  RMTabBarController.swift
//  Rickaland
//
//  Created by Алексей  on 03.03.2023.
//

import UIKit

class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupTabs()
    }
    
    private func setupTabs() {
        let quotesVC = RMQuotesViewController()
        let infoVC = RMInfoViewController()
        let settingsVC = RMSettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: quotesVC)
        let nav2 = UINavigationController(rootViewController: infoVC)
        let nav3 = UINavigationController(rootViewController: settingsVC)
    }
    
}

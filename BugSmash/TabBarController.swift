//
//  TabBarController.swift
//  BugSmash
//
//  Created by Lachy Schumacher on 1/1/20.
//  Copyright © 2020 Tydewest. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        SetupBarUI()
        
    }
    func SetupBarUI() {
        view.backgroundColor = .systemBackground
        tabBar.barTintColor = UIColor.systemBackground
        overrideUserInterfaceStyle = .light
    }
    func setupTabBar() {
        
        let Report = UINavigationController(rootViewController: ReportViewController())
        Report.tabBarItem.title = "Smash The Bug"
        Report.tabBarItem.image = UIImage(systemName: "ant")
        Report.tabBarItem.selectedImage = UIImage(systemName: "ant.fill")
        

    
        viewControllers = [Report]
    }

}


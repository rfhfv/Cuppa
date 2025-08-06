//
//  TabBarController.swift
//  Cuppa
//
//  Created by admin on 30.07.2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarController: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarController {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .systemBlue
        tabBar.itemPositioning = .centered
        
        tabBar.itemWidth = 30.0
        tabBar.itemSpacing = 60.0
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        UITabBarItem.appearance().setTitleTextAttributes( .none, for: .normal)
        
    }
}

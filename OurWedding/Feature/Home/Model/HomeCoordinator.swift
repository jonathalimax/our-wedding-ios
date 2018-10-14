//
//  HomeCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    enum Destination {
        case events
    }
    
    var window: UIWindow
    var tabBarController: UITabBarController
    
    init(window: UIWindow,
         controllers: [UIViewController]) {
        self.window = window
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = controllers
    }
    
    func start() {
        navigate(to: .events)
    }
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .events:
            
            self.window.rootViewController = self.tabBarController
            self.window.makeKeyAndVisibleAnimated()
            
        }
        
    }
    
}

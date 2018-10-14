//
//  EventCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventCoordinator: Coordinator {
    
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
        tabBarController.tabBar.tintColor = Resource.Color.black
    }
    
    func start() {
        self.window.rootViewController = self.tabBarController
        self.window.makeKeyAndVisibleAnimated()
    }
    
}

//
//  AppCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    enum Destination {
        case login
        case event
    }
    
    private let window: UIWindow
    
    private let eventNavigationController: UINavigationController
    
    var children: [Coordinator]
    private var tabBarController: UITabBarController
    
    init(window: UIWindow) {
        children = []
        self.window = window
        
        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        eventNavigationController =
            NavigationController(rootViewController: EventViewController())
        
        prepare()
    }
    
    func start() {
        navigate(to: .login)
    }
    
    func prepare() {
        let controllers = [eventNavigationController]
        tabBarController.viewControllers = controllers
        tabBarController.tabBar.tintColor = Resource.Color.black
    }
    
    func setupTabBar() {
        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisibleAnimated()
    }
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .login:
            
            let coordinator = LoginCoordinator(window: window)
            coordinator.delegate = self
            coordinator.start()
            addChildCoordinator(childCoordinator: coordinator)
            
        case .event:
            
            setupTabBar()
            let coordinator = EventCoordinator(tabBarController: tabBarController,
                                               navigation: eventNavigationController)
            coordinator.delegate = self
            coordinator.start()
            addChildCoordinator(childCoordinator: coordinator)
            
        }
        
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator) {
        removeChieldCoordinator(childCoordinator: coordinator)
        navigate(to: .event)
    }
    
}

extension AppCoordinator: EventCoordinatorDelegate {
    
    func eventCoordinatorDidFinish(_ coordinator: EventCoordinator) {
        removeChieldCoordinator(childCoordinator: coordinator)
    }
    
}

//
//  EventCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol EventCoordinatorDelegate: class {
    func eventCoordinatorDidFinish(_ coordinator: EventCoordinator)
}

class EventCoordinator: Coordinator {
    
    enum Destination {
        case detail(event: Int)
    }
    
    var children: [Coordinator]
    weak var delegate: EventCoordinatorDelegate?
    
    private let tabBarController: UITabBarController
    private let navigation: UINavigationController
    
    init(tabBarController: UITabBarController, navigation: UINavigationController) {
        children = []
        self.navigation = navigation
        self.tabBarController = tabBarController
    }
    
    func start() {
        
        guard let viewControllers = tabBarController.viewControllers,
            let rootViewController = navigation.viewControllers.first else {
                return
        }
        
        for (index, controller) in viewControllers.enumerated() {
            
            guard let eventViewController = rootViewController as? EventViewController,
                controller === navigation else {
                    continue
            }
            
            eventViewController.delegate = self
            tabBarController.selectedIndex = index
            
        }
        
    }
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .detail(let event):
            print(event)
            let eventDetailViewController = EventDetailViewController()
            eventDetailViewController.hidesBottomBarWhenPushed = true
            navigation.pushViewController(eventDetailViewController, animated: true)
        }
        
    }
    
}

extension EventCoordinator: EventViewControllerDelegate {
    
    func eventViewController(_ viewController: EventViewController,
                             didSelectEvent event: Int) {
        
        navigate(to: .detail(event: event))
    }
    
}

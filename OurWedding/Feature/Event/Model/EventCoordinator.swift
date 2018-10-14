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
        case detail
    }
    
    var children: [Coordinator]
    weak var delegate: EventCoordinatorDelegate?
    
    private let tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        children = []
        self.tabBarController = tabBarController
    }
    
    func start() {
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        for (index, controller) in viewControllers.enumerated() {
            if controller.isKind(of: EventViewController.self) {
                tabBarController.selectedIndex = index
                return
            }
        }
    }
    
}

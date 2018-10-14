//
//  CoordinatorProtocol.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    
    var children: [Coordinator] { get set } 
    
    func start()
    func navigate(to destination: Coordinator)
}

extension Coordinator {
    
    func navigate(to destination: Coordinator){}
    
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.children.append(childCoordinator)
    }
    
    func removeChieldCoordinator(childCoordinator: Coordinator) {
        self.children = self.children.filter { $0 !== childCoordinator }
    }
    
}

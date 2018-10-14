//
//  CoordinatorProtocol.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import Foundation

enum Destination {}

protocol Coordinator: class {
    
    var children: [Coordinator] { get set } 
    
    func start()
    func navigate(to destination: Destination)
}

extension Coordinator {
    
    func navigate(to destination: Destination){}
    
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.children.append(childCoordinator)
    }
    
    func removeChieldCoordinator(childCoordinator: Coordinator) {
        self.children = self.children.filter { $0 !== childCoordinator }
    }
    
}

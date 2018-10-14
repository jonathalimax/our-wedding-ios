//
//  CoordinatorProtocol.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import Foundation

protocol Coordinator {
    associatedtype Destination
    
    func start()
    func navigate(to destination: Destination)
}

extension Coordinator {
    func navigate(to destination: Destination){}
}

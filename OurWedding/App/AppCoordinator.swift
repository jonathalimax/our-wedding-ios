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
    }
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        navigate(to: .login)
    }
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .login:
            let loginCoordinator = LoginCoordinator(window: window)
            loginCoordinator.start()
        }
        
    }
    
}

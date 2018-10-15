//
//  LoginCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    
    enum Destination {
        case login
    }
    
    var children: [Coordinator]
    weak var delegate: LoginCoordinatorDelegate?
    
    let window: UIWindow
    
    init(window: UIWindow) {
        children = []
        self.window = window
    }
    
    func start() {
        navigate(to: .login)
    }
    
    func navigate(to destination: Destination) {
        
        switch destination {
        case .login:
            
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            window.rootViewController = loginViewController
            window.makeKeyAndVisible()
            
        }
        
    }
    
}

extension LoginCoordinator: LoginViewControllerDelegate {
    
    func loginViewControllerLogInSuccessfully(_ viewController: LoginViewController) {
        delegate?.loginCoordinatorDidFinish(self)
    }
    
}

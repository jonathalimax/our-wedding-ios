//
//  LoginCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    
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
            
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            window.rootViewController = loginViewController
            window.makeKeyAndVisibleAnimated()
            
        }
        
    }
    
}

extension LoginCoordinator {
    
    private func startEventCoordinator() {
        let eventNavigationController = NavigationController(rootViewController: EventViewController())
        let controllers = [eventNavigationController, UIViewController(), UIViewController()]
        let coordinator = EventCoordinator(window: window,
                                          controllers: controllers)
        coordinator.start()
    }
    
}

extension LoginCoordinator: LoginViewControllerDelegate {
    
    func loginViewControllerLogInSuccessfully(_ viewController: LoginViewController) {
        startEventCoordinator()
    }
    
}

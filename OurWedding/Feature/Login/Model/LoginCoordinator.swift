//
//  LoginCoordinator.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        window.rootViewController = loginViewController
        window.makeKeyAndVisibleAnimated()
    }
    
}

extension LoginCoordinator {
    
    private func startHomeCoordinator() {
        let homeNavigationController = NavigationController(rootViewController: HomeViewController())
        let controllers = [homeNavigationController, UIViewController(), UIViewController()]
        let coordinator = HomeCoordinator(window: window,
                                          controllers: controllers)
        coordinator.start()
    }
    
}

extension LoginCoordinator: LoginViewControllerDelegate {
    
    func loginViewControllerLogInSuccessfully(_ viewController: LoginViewController) {
        startHomeCoordinator()
    }
    
}

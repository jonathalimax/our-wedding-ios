//
//  AppDelegate.swift
//  OurWedding
//
//  Created by Jonatha Lima on 16/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = AppCoordinator(window: window)

        self.window = window
        self.appCoordinator = coordinator
        
        coordinator.start()
        return true
    }

}

//
//  NavigationController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 24/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NavigationController {
    
    func prepare() {
        
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
        }
        
        //self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //self.navigationBar.shadowImage = UIImage()
        //self.navigationBar.isTranslucent = true
        
    }
    
}

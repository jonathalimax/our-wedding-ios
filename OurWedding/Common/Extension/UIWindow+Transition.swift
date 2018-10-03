//
//  UIWindow+Transition.swift
//  OurWedding
//
//  Created by Jonatha Lima on 29/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func makeKeyAndVisibleAnimated() {
        
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.makeKeyAndVisible()
        }, completion: nil)
        
    }
    
}

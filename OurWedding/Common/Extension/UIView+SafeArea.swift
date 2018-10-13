//
//  UIView+SafeArea.swift
//  OurWedding
//
//  Created by Jonatha Lima on 29/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UIView {
    
    var safeArea: UILayoutGuide {
        get {
            if #available(iOS 11.0, *) {
                return self.safeAreaLayoutGuide
            }
            return self.layoutMarginsGuide
        }
    }
    
}

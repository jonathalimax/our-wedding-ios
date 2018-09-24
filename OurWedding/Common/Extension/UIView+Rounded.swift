//
//  UIView+Rounded.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UIView {
    
    func rounded(value: CGFloat) {
        // TODO: Fix
        self.clipsToBounds = true
        self.layer.cornerRadius = value
    }
    
}

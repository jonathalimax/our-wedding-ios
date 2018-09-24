//
//  UIView+Identifier.swift
//  OurWedding
//
//  Created by Jonatha Lima on 24/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UIView {
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }

}

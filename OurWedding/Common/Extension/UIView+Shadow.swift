//
//  UIView+Shadow.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

enum Shadow {
    
    struct Configuration {
        var color: UIColor
        var opacity: Float
        var offset: CGSize
        var radius: CGFloat
        
        init(color: UIColor = Resource.Color.black,
             opacity: Float = 1,
             offset: CGSize,
             radius: CGFloat) {
            
            self.color = color
            self.opacity = opacity
            self.offset = offset
            self.radius = radius
        }
        
    }
    
}

extension UIView {
    
    func addShadow(configuration: Shadow.Configuration) {
        
        layer.masksToBounds = false
        layer.shadowColor = configuration.color.cgColor
        layer.shadowOpacity = configuration.opacity
        layer.shadowOffset = configuration.offset
        layer.shadowRadius = configuration.radius
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
    }
    
}

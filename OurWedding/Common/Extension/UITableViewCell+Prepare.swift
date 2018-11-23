//
//  UITableViewCell+Prepare.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func prepare(item: Any,
                 configuration: Configuration?) {
        
        textLabel?.text = "\(item)"
        configure(with: configuration)
    }
    
}

extension UITableViewCell {
    
    struct Configuration {
        var accessoryType: AccessoryType
        var selectionStyle: SelectionStyle
    }
    
    func configure(with configuration: Configuration?) {
        
        guard let config = configuration else { return }
        
        self.accessoryType = config.accessoryType
        self.selectionStyle = config.selectionStyle
        
    }
    
}

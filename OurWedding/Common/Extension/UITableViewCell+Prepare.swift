//
//  UITableViewCell+Prepare.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func prepare(item: Any) {
        textLabel?.text = "\(item)"
    }
    
}

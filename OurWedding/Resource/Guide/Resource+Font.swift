//
//  Resource+Font.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension Resource.Font {
    
    enum SourceSansPro {}
    
}

extension Resource.Font.SourceSansPro {
    
    static func regular(size: CGFloat) -> UIFont {
        return Resource.Font.getFont(named: "SourceSansPro-Regular", size: size)
    }
    
    static func light(size: CGFloat) -> UIFont {
        return Resource.Font.getFont(named: "SourceSansPro-Light", size: size)
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        return Resource.Font.getFont(named: "SourceSansPro-SemiBold", size: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return Resource.Font.getFont(named: "SourceSansPro-Bold", size: size)
    }
    
}

private extension Resource.Font {
    
    static func getFont(named name: String, size: CGFloat) -> UIFont {
        
        guard let font = UIFont(name: name, size: size) else {
            fatalError("Font \(name) not fount")
        }
        
        return font
    }
    
}

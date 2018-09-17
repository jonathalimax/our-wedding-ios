//
//  Button.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    init(type: Type) {
        super.init(frame: .zero)
        configure(for: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum `Type` {
        case primary
    }
    
}

private extension Button {
    
    func configure(for type: Type) {
        
        layer.masksToBounds = true
        
        switch type {
        case .primary:
            layer.cornerRadius = 8
            backgroundColor = Resource.Color.lightGray
                .withAlphaComponent(0.3)
            titleLabel?.font = UIFont.systemFont(ofSize: 25)
            setTitleColor(Resource.Color.black, for: .normal)
        }
        
    }
    
}

//
//  Button.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    let type: Type
    
    init(type: Type) {
        self.type = type
        super.init(frame: .zero)
        configure(for: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum `Type` {
        case primary
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.configureHighlighted(for: self.type)
        }
    }
    
}

private extension Button {
    
    func configure(for type: Type) {
        
        switch type {
        case .primary:
            
            layer.cornerRadius = 8
            titleLabel?.font = Resource.Font.SourceSansPro.bold(size: 24)
            setTitleColor(Resource.Color.black, for: .normal)
            backgroundColor = Resource.Color.lightGray
                .withAlphaComponent(0.2)
            
        }
        
        layer.masksToBounds = true
    }
    
    func configureHighlighted(for type: Type) {
        
        var normalColor: UIColor = .clear
        var highlightedColor: UIColor = .clear
        
        switch type {
        case .primary:
            
            normalColor = Resource.Color.lightGray.withAlphaComponent(0.2)
            highlightedColor = Resource.Color.lightGray.withAlphaComponent(0.3)
            
        }
        
        self.backgroundColor = self.isHighlighted ? highlightedColor : normalColor
        
    }
    
}

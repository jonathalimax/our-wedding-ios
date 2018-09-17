//
//  ViewCodingProtocol.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import SnapKit

protocol ViewCodingProtocol {
    func setupViewCode()
    func addSubviews()
    func setupConstraints()
    func setupSubviews()
}

extension ViewCodingProtocol {
    
    func setupViewCode() {
        addSubviews()
        setupConstraints()
        setupSubviews()
    }
    
    func setupSubviews() {}
    
}

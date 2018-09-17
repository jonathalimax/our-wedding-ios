//
//  InputField.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class InputField: UIView {
    
    lazy var field: UITextField = {
        let textField = UITextField()
        textField.textColor = Resource.Color.black
        textField.font = UIFont.boldSystemFont(ofSize: 24)
        return textField
    }()
    
    private lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Resource.Color.lightGray
        return view
    }()
    
    init(placeholder: String) {
        super.init(frame: .zero)
        field.placeholder = placeholder
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InputField: ViewCodingProtocol {
    
    func addSubviews() {
        addSubview(field)
        addSubview(bottomLineView)
    }
    
    func setupConstraints() {
        
        field.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(35)
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.height.equalTo(2.5)
            make.top.equalTo(field.snp.bottom).offset(2)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func setupSubviews() {
        backgroundColor = .clear
    }
    
}

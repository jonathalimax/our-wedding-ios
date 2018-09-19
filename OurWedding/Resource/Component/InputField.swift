//
//  InputField.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit
import VMaskTextField

class InputField: UIView {
    
    private let bottomLineColor = Resource.Color.lightGray
        .withAlphaComponent(0.5)
    
    private let bottomLineFocusedColor = Resource.Color.lightGray
    
    lazy var field: VMaskTextField = {
        let textField = VMaskTextField()
        textField.textColor = Resource.Color.black
        textField.font = Resource.Font.SourceSansPro.bold(size: 24)
        return textField
    }()
    
    private lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = bottomLineColor
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
            make.height.equalTo(3)
            make.top.equalTo(field.snp.bottom).offset(2)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func setupSubviews() {
        backgroundColor = .clear
        field.delegate = self
    }
    
}

extension InputField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.bottomLineView.backgroundColor = self.bottomLineFocusedColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.bottomLineView.backgroundColor = self.bottomLineColor
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return field.shouldChangeCharacters(in: range, replacementString: string)
    }
    
}

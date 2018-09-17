//
//  LoginViewScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginViewScreen: UIView {

    lazy var welcomeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo,"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = Resource.Color.black
        return label
    }()
    
    lazy var welcomeSignInLabel: UILabel = {
        let label = UILabel()
        label.text = "digite seu número"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = Resource.Color.lightGray
        return label
    }()
    
    lazy var phoneNumberField: InputField = {
        let inputField = InputField(placeholder: "(11)11111-1111")
        inputField.field.keyboardType = .phonePad
        return inputField
    }()
    
    lazy var continueButton: Button = {
        let button = Button(type: .primary)
        button.setTitle("Continuar", for: .normal)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginViewScreen: ViewCodingProtocol {
    
    func addSubviews() {
        
        self.addSubview(welcomeStackView)
        welcomeStackView.addArrangedSubview(welcomeLabel)
        welcomeStackView.addArrangedSubview(welcomeSignInLabel)
        
        self.addSubview(phoneNumberField)
        self.addSubview(continueButton)
        
    }
    
    func setupConstraints() {
        
        welcomeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(122)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().inset(38)
        }
        
        phoneNumberField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview()
            make.height.equalTo(65)
        }
        
        continueButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(38)
            make.bottom.equalToSuperview().inset(50)
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
    }
    
}

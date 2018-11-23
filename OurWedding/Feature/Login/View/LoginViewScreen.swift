//
//  LoginViewScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginViewScreen: UIView {

    var onLoginTap: (() -> Void)?
    
    private let bottomInset: CGFloat = 50.0
    
    lazy var welcomeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo,"
        label.font = Resource.Font.SourceSansPro.bold(size: 34)
        label.textColor = Resource.Color.black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var welcomeSignInLabel: UILabel = {
        let label = UILabel()
        label.text = "digite seu número"
        label.font = Resource.Font.SourceSansPro.bold(size: 34)
        label.textColor = Resource.Color.lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var phoneNumberField: InputField = {
        let inputField = InputField(placeholder: "Celular")
        inputField.field.mask = "(##)#####-####"
        inputField.field.keyboardType = .numberPad
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
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
            make.top.lessThanOrEqualToSuperview().offset(122)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().inset(38)
        }
        
        phoneNumberField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().priority(1)
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview()
            make.height.equalTo(65)
            make.top.greaterThanOrEqualTo(welcomeStackView.snp.bottom)
                .offset(26)
        }
        
        continueButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(38)
            make.bottom.equalToSuperview().inset(self.bottomInset)
            make.top.greaterThanOrEqualTo(phoneNumberField.snp.bottom)
                .offset(32)
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
        self.continueButton.addTarget(self,
                                      action: #selector(onLoginAction),
                                      for: .touchUpInside)
    }
    
}

extension LoginViewScreen {
    
    @objc
    private func onLoginAction() {
        onLoginTap?()
    }
    
    public func handleUI(keyboardHeight: CGFloat) {
        
        let bottomInset = self.bottomInset + keyboardHeight
        
        continueButton.snp.updateConstraints { update in
            update.bottom.equalToSuperview().inset(bottomInset)
        }
        
        self.layoutIfNeeded()
        
    }
    
}

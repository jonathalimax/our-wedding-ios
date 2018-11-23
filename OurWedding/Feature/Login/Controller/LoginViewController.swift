//
//  LoginViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var delegate: LoginViewControllerDelegate?

    private var loginViewScreen: LoginViewScreen
    
    init() {
        loginViewScreen = LoginViewScreen()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = loginViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewScreen.onLoginTap = {
            self.delegate?.loginViewControllerLogInSuccessfully(self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        KeyboardListener.shared.register(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        KeyboardListener.shared.remove(self)
    }

}

extension LoginViewController: KeyboardListenerDelegate {
    
    func keyboardListenerWillAppear(_ info: KeyboardListener.Info) {
        loginViewScreen.handleUI(keyboardHeight: info.height)
    }
    
    func keyboardListenerWillDisappear(_ info: KeyboardListener.Info) {
        loginViewScreen.handleUI(keyboardHeight: info.height)
    }
    
}

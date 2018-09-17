//
//  LoginViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

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
    }

}

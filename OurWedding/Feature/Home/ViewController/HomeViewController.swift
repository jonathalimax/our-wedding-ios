//
//  HomeViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 20/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeViewScreen: HomeViewScreen
    
    init() {
        homeViewScreen = HomeViewScreen()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Eventos"
    }

}

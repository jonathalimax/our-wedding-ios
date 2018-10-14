//
//  EventViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 20/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol EventViewControllerDelegate: class {
    func eventViewController(_ viewController: EventViewController,
                             didSelectEvent event: Int)
}

class EventViewController: UIViewController {
    
    private let eventViewScreen: EventViewScreen
    
    weak var delegate: EventViewControllerDelegate?
    
    init() {
        eventViewScreen = EventViewScreen()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = eventViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare()
    }
    
}

extension EventViewController {
    
    private func prepare() {
        
        let title = "Eventos"
        self.title = title
        
        self.tabBarItem =
            UITabBarItem(title: title,
                         image: Resource.Image.calendar,
                         selectedImage: nil)

    }
    
}

//extension EventViewController: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        delegate?.eventViewController(self,
//                                      didSelectEvent: indexPath.row)
//
//    }
//
//}

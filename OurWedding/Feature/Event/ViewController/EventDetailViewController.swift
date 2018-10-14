//
//  EventDetailViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 13/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol EventDetailViewControllerDelegate: class {
    func eventDetailViewController(_ controller: EventDetailViewController,
                                   didSelectItem item: Any)
}

class EventDetailViewController: UIViewController {
    
    private var eventDetailScreen: EventDetailScreen?
    
    weak var delegate: EventDetailViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        eventDetailScreen = EventDetailScreen()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = eventDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepare()
    }
    
}

extension EventDetailViewController {
    
    private func prepare() {
        self.title = "Detalhes"
        self.eventDetailScreen?.datasource?.delegate = self
    }
    
}

extension EventDetailViewController: TableViewDatasourceDelegate {
    
    func tableViewDatasourceDidSelecteItem(item: Any) {
        
        guard let eventName = item as? String else {
            return
        }
        
        delegate?.eventDetailViewController(self, didSelectItem: eventName)
        
    }
    
}

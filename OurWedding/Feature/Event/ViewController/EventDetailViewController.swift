//
//  EventDetailViewController.swift
//  OurWedding
//
//  Created by Jonatha Lima on 13/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    private let items: [String]
    private var eventDetailScreen: EventDetailScreen?
    
    init() {
        items = ["Casal", "Local", "Padrinhos"]
        super.init(nibName: nil, bundle: nil)
        eventDetailScreen = EventDetailScreen(self)
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
    }
    
}

extension EventDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = UITableViewCell.identifier
        
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: identifier) else {
                fatalError("\(identifier) not found")
        }
        
        cell.textLabel?.text = items[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}

extension EventDetailViewController: UITableViewDelegate {}

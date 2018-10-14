//
//  EventDetailScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 13/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventDetailScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    init(_ delegateSource: (UITableViewDelegate & UITableViewDataSource)) {
        super.init(frame: .zero)
        tableView.delegate = delegateSource
        tableView.dataSource = delegateSource
        setupViewCode()
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventDetailScreen: ViewCodingProtocol {
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(super.safeArea)
        }
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
        self.tableView.register(UITableViewCell.self,
                                forCellReuseIdentifier: UITableViewCell.identifier)
    }
    
}

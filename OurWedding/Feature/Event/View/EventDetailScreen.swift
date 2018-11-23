//
//  EventDetailScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 13/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventDetailScreen: UIView {
    
    var datasource: TableViewDatasource<UITableViewCell>? {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        self.datasource = TableViewDatasource(tableView: tableView)
        self.datasource?.items = (data: ["Noivos", "Locais", "Padrinhos", "Presentes"],
                                  configuration: .init(accessoryType: .disclosureIndicator,
                                                       selectionStyle: .none))
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
        tableView.delegate = datasource
        tableView.dataSource = datasource
    }
    
}

//
//  TableViewDatasource.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol TableViewDatasourceDelegate: class {
    func tableViewDatasourceDidSelecteItem(item: Any)
}

class TableViewDatasource<T: UITableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items: (data: [Any], configuration: UITableViewCell.Configuration?) {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: TableViewDatasourceDelegate?
    private var tableView: UITableView
    
    init(tableView: UITableView) {
        self.items = ([], nil)
        self.tableView = tableView
        super.init()
        registerCell(tableView: tableView)
    }
    
    func registerCell(tableView: UITableView) {
        tableView.register(T.self,
                           forCellReuseIdentifier: T.identifier)
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return items.data.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: T.identifier) else {
            fatalError("\(T.identifier) not found")
        }
        
        cell.prepare(item: items.data[indexPath.row],
                     configuration: items.configuration)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let item = items.data[indexPath.row]
        delegate?.tableViewDatasourceDidSelecteItem(item: item)
    }
    
}

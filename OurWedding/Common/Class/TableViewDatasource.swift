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
    
    var items: [Any] {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: TableViewDatasourceDelegate?
    private var tableView: UITableView
    
    init(tableView: UITableView) {
        self.items = []
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
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: T.identifier) else {
            fatalError("\(T.identifier) not found")
        }
        
        cell.prepare(item: items[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        delegate?.tableViewDatasourceDidSelecteItem(item: item)
    }
    
}

//
//  EventDatasource.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

protocol EventDatasourceDelegate: class {
    func eventDatasource(_ datasource: EventDatasource,
                         didSelectItem item: Int)
}

class EventDatasource: NSObject {
    
    weak var delegate: EventDatasourceDelegate?
    
    private let items: [Any]
    private let collectionView: UICollectionView
    private let padding: CGFloat = 20.0
    
    init(collectionView: UICollectionView, items: [Any]) {
        self.items = items
        self.collectionView = collectionView
        super.init()
        self.collectionView
            .register(EventCollectionViewCell.self,
                      forCellWithReuseIdentifier: EventCollectionViewCell.identifier)
    }
    
}

extension EventDatasource: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let width = frame.width - (padding * 3)
        let height = frame.height - (padding * 2)
        return  CGSize(width: width,
                       height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return padding
    }
    
}
extension EventDatasource: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = EventCollectionViewCell.identifier
        
        guard let cell =
            collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: identifier,
                    for: indexPath) as? EventCollectionViewCell else {
                        
                        fatalError("\(identifier) not found")
        }
        
        return cell
        
    }
    
}

extension EventDatasource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        delegate?.eventDatasource(self, didSelectItem: indexPath.row)
        
    }
    
}

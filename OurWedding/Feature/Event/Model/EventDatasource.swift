//
//  EventDatasource.swift
//  OurWedding
//
//  Created by Jonatha Lima on 14/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventDatasource<T: UICollectionViewCell>: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let items: [Any]
    private let collectionView: UICollectionView
    
    private let padding: CGFloat = 20.0
    
    init(collectionView: UICollectionView, items: [Any]) {
        self.items = items
        self.collectionView = collectionView
        super.init()
        self.collectionView.register(T.self,
                                     forCellWithReuseIdentifier: T.identifier)
    }
 
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
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = T.identifier
        
        guard let cell =
            collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: identifier,
                    for: indexPath) as? T else {
                        
                        fatalError("\(identifier) not found")
        }
        
        return cell
        
    }
    
}

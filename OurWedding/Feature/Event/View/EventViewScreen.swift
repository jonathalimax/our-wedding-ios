//
//  EventViewScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventViewScreen: UIView {
    
    var datasource: EventDatasource<EventCollectionViewCell>? {
        didSet {
            weddingCollectionView.reloadData()
        }
    }
    
    var weddingCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = Resource.Color.white
        return collectionView
    }()
    
    init() {
        datasource =
            EventDatasource(collectionView: weddingCollectionView, items: [1,2,3])
        super.init(frame: .zero)
        weddingCollectionView.delegate = datasource
        weddingCollectionView.dataSource = datasource
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventViewScreen: ViewCodingProtocol {
    
    func addSubviews() {
        self.addSubview(weddingCollectionView)
    }
    
    func setupConstraints() {
        
        weddingCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(super.safeArea)
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
    }
    
}

//
//  EventViewScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventViewScreen: UIView {
    
    let padding: CGFloat = 20.0
    
    let weddingCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = Resource.Color.white
        return collectionView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
        self.weddingCollectionView.delegate = self
        self.weddingCollectionView.dataSource = self
        
        self.weddingCollectionView
            .register(EventCollectionViewCell.self,
                      forCellWithReuseIdentifier: EventCollectionViewCell.identifier)
    }
    
}

extension EventViewScreen: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = weddingCollectionView.frame
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

extension EventViewScreen: UICollectionViewDelegate {}

extension EventViewScreen: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = EventCollectionViewCell
            .identifier
        
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

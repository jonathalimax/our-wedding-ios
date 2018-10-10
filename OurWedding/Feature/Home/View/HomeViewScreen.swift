//
//  HomeViewScreen.swift
//  OurWedding
//
//  Created by Jonatha Lima on 19/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class HomeViewScreen: UIView {
    
    let headerView: HomeHeaderView
    
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
        headerView = HomeHeaderView()
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeViewScreen: ViewCodingProtocol {
    
    func addSubviews() {
        //self.addSubview(headerView)
        self.addSubview(weddingCollectionView)
    }
    
    func setupConstraints() {
        
//        headerView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(38)
//            make.left.right.equalToSuperview()
//        }
        
        weddingCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
        self.weddingCollectionView.delegate = self
        self.weddingCollectionView.dataSource = self
        
        self.weddingCollectionView
            .register(EventCollectionViewCell.self,
                      forCellWithReuseIdentifier: EventCollectionViewCell.identifier)
        self.weddingCollectionView
            .register(EventHeaderCollectionViewCell.self,
                      forCellWithReuseIdentifier: EventHeaderCollectionViewCell.identifier)
    }
    
}

extension HomeViewScreen: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (weddingCollectionView.frame.width / 1.2)
        let height = weddingCollectionView.frame.height - 100
        return  CGSize(width: width,
                       height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20.0, bottom: 100.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20.0
    }
    
}

extension HomeViewScreen: UICollectionViewDelegate {}

extension HomeViewScreen: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: EventCollectionViewCell.identifier,
                for: indexPath) as? EventCollectionViewCell else {
                    
                    fatalError("Cell not found")
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            let headerCell = collectionView
                .dequeueReusableCell(withReuseIdentifier: EventHeaderCollectionViewCell.identifier,
                                     for: indexPath)
            return headerCell
            
        default:
            break
        }
        
        fatalError("Header or footer not found for collectionView")
        
    }
    
}

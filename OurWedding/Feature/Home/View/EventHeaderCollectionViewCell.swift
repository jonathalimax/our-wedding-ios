//
//  EventHeaderCollectionViewCell.swift
//  OurWedding
//
//  Created by Jonatha Lima on 24/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventHeaderCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.SourceSansPro.semiBold(size: 22)
        label.tintColor = Resource.Color.black
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventHeaderCollectionViewCell: ViewCodingProtocol {
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
}

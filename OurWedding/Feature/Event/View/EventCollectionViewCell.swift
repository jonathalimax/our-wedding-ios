//
//  EventCollectionViewCell.swift
//  OurWedding
//
//  Created by Jonatha Lima on 20/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resource.Color.white
        label.font = Resource.Font.SourceSansPro.semiBold(size: 20)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = Resource.Color.white
        label.font = Resource.Font.SourceSansPro.regular(size: 18)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = Resource.Color.white
        label.font = Resource.Font.SourceSansPro.regular(size: 20)
        return label
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let label = UIImageView()
        label.contentMode = .scaleAspectFill
        label.clipsToBounds = true
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

extension EventCollectionViewCell: ViewCodingProtocol {
    
    func addSubviews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.top.equalTo(titleLabel.snp.bottom)
                .offset(2)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = .clear
        self.contentView.rounded(value: 10)
        
        dateLabel.text = "26 Outubro 2018"
        titleLabel.text = "Mayara & Diego"
        descriptionLabel.text = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. \
            Integer aliquet elit in justo dapibus sodales.
            """
        backgroundImageView.image = UIImage(named: "wedding")
        
        self.addShadow(configuration:
            .init(opacity: 0.3,
                  offset: CGSize(width: 0, height: 4),
                  radius: 8))

    }
    
}

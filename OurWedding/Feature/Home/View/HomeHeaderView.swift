//
//  HomeHeaderView.swift
//  OurWedding
//
//  Created by Jonatha Lima on 20/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá Jonatha"
        label.font = Resource.Font.SourceSansPro.bold(size: 24)
        label.tintColor = Resource.Color.black
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeHeaderView: ViewCodingProtocol {
    
    func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(profileImageView)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(38)
            make.bottom.equalToSuperview().inset(38)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalToSuperview().inset(20)
        }
        
    }
    
    func setupSubviews() {
        self.backgroundColor = Resource.Color.white
        // TODO: Temporary image
        self.profileImageView.image = UIImage(named: "harvey_image")
        self.profileImageView.rounded(value: 20)
    }
    
}


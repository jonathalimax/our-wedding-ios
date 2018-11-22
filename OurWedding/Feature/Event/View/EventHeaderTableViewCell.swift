//
//  EventHeaderTableViewCell.swift
//  OurWedding
//
//  Created by Jonatha Lima on 20/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

class EventHeaderTableViewCell: UITableViewCell {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resource.Image.weddingBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blur)
        return blurView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    lazy var guestsView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resource.Image.guest
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var guests2View: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resource.Image.guest
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var guests3View: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resource.Image.guest
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventHeaderTableViewCell: ViewCodingProtocol {
    
    func addSubviews() {
        backgroundImageView.addSubview(effectView)
        contentView.addSubview(backgroundImageView)
        
        stackView.addArrangedSubview(guestsView)
        stackView.addArrangedSubview(guests2View)
        stackView.addArrangedSubview(guests3View)
        
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        
        effectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            make.top.greaterThanOrEqualToSuperview()
                .offset(30)
        }
        
        guestsView.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
        guests2View.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
        guests3View.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
    }
    
    func setupSubviews() {
        
    }
    
}

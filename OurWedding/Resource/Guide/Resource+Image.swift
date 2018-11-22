//
//  Resource+Image.swift
//  OurWedding
//
//  Created by Jonatha Lima on 17/09/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension Resource.Image {
    
    static let user = Resource.Image.getImage(named: "user")
    static let guest = Resource.Image.getImage(named: "guest")
    static let calendar = Resource.Image.getImage(named: "calendar")
    static let arrowRight = Resource.Image.getImage(named: "arrow_right")
    
    // TODO: Temporary
    static let harveyProfile = Resource.Image.getImage(named: "harvey_image")
    static let weddingBackground = Resource.Image.getImage(named: "wedding")
    
}

extension Resource.Image {
    
    static private func getImage(named name: String) -> UIImage {
        
        guard let image = UIImage(named: name) else {
            fatalError("Image \(name) not found!")
        }
        
        return image
        
    }
    
}

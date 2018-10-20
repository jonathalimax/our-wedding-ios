//
//  EventCollectionViewCellSpec.swift
//  OurWeddingTests
//
//  Created by Jonatha Lima on 20/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import Quick
import Nimble

@testable import OurWedding

class EventCollectionViewCellSpec: QuickSpec {
    
    override func spec() {
        
        let sut = EventCollectionViewCell()
        
        describe(EventCollectionViewCell.identifier) {
            
            beforeEach {
                let bounds = UIScreen.main.bounds
                sut.frame =
                    CGRect(x: 0, y: 0, width: bounds.width, height: 300)
            }
            
            context("when initialized", {
                
                it("should be equal to snapshot", closure: {
                    expect(sut)
                        .to(matchSnapshot(named: EventCollectionViewCell.identifier))
                })
                
            })
            
        }
        
    }
    
}

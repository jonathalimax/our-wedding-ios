//
//  EventViewScreenSpec.swift
//  OurWeddingTests
//
//  Created by Jonatha Lima on 20/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import OurWedding

class EventViewScreenSpec: QuickSpec {
    
    override func spec() {
        
        let sut = EventViewScreen()
        
        describe(EventViewScreen.identifier) {
        
            beforeEach {
                sut.frame = UIScreen.main.bounds
            }
            
            context("when initialized", {
                
                it("should be equal to snapshot", closure: {
                    expect(sut).to(matchSnapshot(named: EventViewScreen.identifier))
                })
                
            })
            
        }
        
    }
    
}


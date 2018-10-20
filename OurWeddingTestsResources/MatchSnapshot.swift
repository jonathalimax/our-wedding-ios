//
//  MatchSnapshot.swift
//  OurWeddingTests
//
//  Created by Jonatha Lima on 20/10/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import CoreGraphics
import Nimble
import Nimble_Snapshots

func matchSnapshot(named name: String,
                   record: Bool = false) -> Predicate<Snapshotable> {
    
    guard record else {
        return haveValidSnapshot(named: name)
    }
    
    return recordSnapshot(named: name)
    
}

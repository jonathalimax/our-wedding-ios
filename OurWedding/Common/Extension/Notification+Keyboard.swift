//
//  Notification+Keyboard.swift
//  OurWedding
//
//  Created by Jonatha Lima on 22/11/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

extension Notification {
    
    var keyboardHeight: CGFloat {
        
        guard let userInfo = self.userInfo else {
            return .leastNormalMagnitude
        }
        
        guard let keyboardFrame = userInfo[UIWindow.keyboardFrameEndUserInfoKey] as? NSValue else {
            fatalError("The UIKeyboardFrameBeginUserInfoKey from keyboard cannot cast to NSValue")
        }
        
        let frame = keyboardFrame.cgRectValue
        return frame.height
        
    }
    
}

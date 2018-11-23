//
//  KeyboardListener.swift
//  OurWedding
//
//  Created by Jonatha Lima on 22/11/18.
//  Copyright © 2018 Sunshine Consulting. All rights reserved.
//

import UIKit

public protocol KeyboardListenerDelegate: class {
    func keyboardListenerWillAppear(_ info: KeyboardListener.Info)
    func keyboardListenerWillDisappear(_ info: KeyboardListener.Info)
}

public class KeyboardListener: NSObject {
    
    public static let shared = KeyboardListener()
    
    private var info: Info
    private var delegates = [KeyboardListenerDelegate]()
    
    private override init() {
        info = Info(height: 0.0)
        super.init()
        self.prepare()
    }
    
}

public extension KeyboardListener {
    
    struct Info {
        var height: CGFloat
    }
    
}

public extension KeyboardListener {
    
    private func prepare() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear(notification:)),
                                               name: UIWindow.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillDisappear(notification:)),
                                               name: UIWindow.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    func register(_ delegate: KeyboardListenerDelegate) {
        self.delegates.append(delegate)
    }
    
    func remove(_ delegate: KeyboardListenerDelegate) {
        
        if let index = delegates.index(where: { $0 === delegate }) {
            self.delegates.remove(at: index)
        }
        
    }
    
    @objc
    private func keyboardWillAppear(notification: Notification) {
        
        info = Info(height: notification.keyboardHeight)
        
        for delegate in delegates {
            delegate.keyboardListenerWillAppear(info)
        }
    }
    
    @objc
    private func keyboardWillDisappear(notification: Notification) {
        
        info = Info(height: 0.0)
        
        for delegate in delegates {
            delegate.keyboardListenerWillDisappear(info)
        }
    }
    
}

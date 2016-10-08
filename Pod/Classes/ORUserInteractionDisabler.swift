//
//  ORUserInteractionDisabler.swift
//  Pods
//
//  Created by Maxim Soloviev on 11/05/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import Foundation
import UIKit

open class ORUserInteractionDisabler {
    
    open static let sharedInstance = ORUserInteractionDisabler()
    fileprivate var enablingTimer: Timer?

    fileprivate init() {
    }
    
    open func disableInteractions(onTime duration: TimeInterval) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        enablingTimer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(enableInteractions), userInfo: nil, repeats: false)
    }
    
    @objc open func enableInteractions() {
        enablingTimer?.invalidate()
        enablingTimer = nil
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}

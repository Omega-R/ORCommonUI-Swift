//
//  ORCustomContentButton.swift
//  Pods
//
//  Created by Maxim Soloviev on 11/08/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import UIKit

open class ORCustomContentButton: UIControl {

    open override func awakeFromNib() {
        super.awakeFromNib()
        
        isExclusiveTouch = true
    }
    
    open override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, animations: { _ in
                self.alpha = self.isHighlighted ? 0.3 : 1.0
            }) 
        }
    }
}

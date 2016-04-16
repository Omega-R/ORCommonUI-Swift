//
//  ORDependentOnScreenScaleSeparator.swift
//  Pods
//
//  Created by Maxim Soloviev on 30/03/16.
//  
//

import UIKit

public class ORDependentOnScreenScaleSeparator: UIImageView {

    @IBInspectable var affectWidth: Bool = false
    @IBInspectable var affectHeight: Bool = false
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        for constraint in constraints {
            // Set height of exactly one pixel if this view is using constraints
            if affectWidth && constraint.firstAttribute == NSLayoutAttribute.Width {
                constraint.constant /= UIScreen.mainScreen().scale
            }
            
            if affectHeight && constraint.firstAttribute == NSLayoutAttribute.Height {
                constraint.constant /= UIScreen.mainScreen().scale
            }
        }
    }
}

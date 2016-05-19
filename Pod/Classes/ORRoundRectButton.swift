//
//  ORRoundRectButton.swift
//  Pods
//
//  Created by Maxim Soloviev on 11/04/16.
//
//

import UIKit

public class ORRoundRectButton : UIButton {
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }
}

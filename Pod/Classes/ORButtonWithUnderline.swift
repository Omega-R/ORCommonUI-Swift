//
//  ORButtonWithUnderline.swift
//  Dowoodle
//
//  Created by Maxim Soloviev on 11/04/16.
//  Copyright © 2016 YPSOURCE. All rights reserved.
//

import UIKit

class ORButtonWithUnderline : UIButton {
    
    @IBInspectable var underlineThickness: CGFloat = 1
    @IBInspectable var underlineOffset: CGFloat = 1

    @IBInspectable var underlineHidden: Bool = false {
        didSet {
            if underlineView != nil {
                underlineView.hidden = underlineHidden
            }
        }
    }
    
    weak var underlineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = false
        let uv = UIView(frame: CGRectMake(0, bounds.height + underlineOffset, bounds.width, underlineThickness))
        uv.backgroundColor = titleColorForState(UIControlState.Normal)
        underlineView = uv
        addSubview(underlineView)
        underlineView.hidden = underlineHidden
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if underlineView != nil {
            underlineView.frame = CGRectMake(0, bounds.height + underlineOffset, bounds.width, underlineView.frame.height)
        }
    }
}

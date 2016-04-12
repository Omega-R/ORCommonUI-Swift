//
//  ORScrollViewKeyboardInsetHandler.swift
//  Dowoodle
//
//  Created by Maxim Soloviev on 12/04/16.
//  Copyright © 2016 YPSOURCE. All rights reserved.
//

import UIKit
import ORCommonCode_Swift

class ORScrollViewKeyboardInsetHandler : UIView {

    weak var scrollView: UIScrollView!
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hidden = true
        
        if superview != nil && superview is UIScrollView {
            scrollView = superview as! UIScrollView
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationKeyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationKeyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        }
    }
    
    func notificationKeyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.CGRectValue()
                let kbSize = frame.size
                
                let currentInsets = scrollView.contentInset
                let contentInsets = UIEdgeInsetsMake(currentInsets.top, currentInsets.left, kbSize.height, currentInsets.right)
                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
        }
    }
    
    func notificationKeyboardWillHide(notification: NSNotification) {
        or_dispatch_in_main_queue_after(0.1) {
            UIView.animateWithDuration(0.3, animations: { [weak self] in
                if let sSelf = self {
                    let currentInsets = sSelf.scrollView.contentInset
                    let contentInsets = UIEdgeInsetsMake(currentInsets.top, currentInsets.left, 0, currentInsets.right)
                    sSelf.scrollView.contentInset = contentInsets
                    sSelf.scrollView.scrollIndicatorInsets = contentInsets
                }
            })
        }
    }
    
//    override func prepareForInterfaceBuilder() {
//        backgroundColor = UIColor.clearColor()
//        
//        let lbl = UILabel(frame: bounds)
//        lbl.text = "Non visual component"
//        addSubview(lbl)
//    }
}

//
//  UIScrollView+KeyboardInsetHandler.swift
//  Pods
//
//  Created by Maxim Soloviev on 16/04/16.
//
//

import UIKit
import ORCommonCode_Swift

public class ORScrollViewKeyboardInsetHandler : UIView {
    
    weak var scrollView: UIScrollView!
    
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView

        super.init(frame: CGRectZero)
        
        scrollView.addSubview(self)

        hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationKeyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationKeyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
                if let scrollView = self?.scrollView {
                    let currentInsets = scrollView.contentInset
                    let contentInsets = UIEdgeInsetsMake(currentInsets.top, currentInsets.left, 0, currentInsets.right)
                    scrollView.contentInset = contentInsets
                    scrollView.scrollIndicatorInsets = contentInsets
                }
            })
        }
    }
}

extension UIScrollView {

    public func or_enableKeyboardInsetHandling() {
        _ = ORScrollViewKeyboardInsetHandler(scrollView: self)
    }
}

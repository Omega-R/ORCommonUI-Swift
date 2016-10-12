//
//  ORKeyboardLayoutConstraint.swift
//  Pods
//
//  Created by Maxim Soloviev on 10/08/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import UIKit

open class ORKeyboardLayoutConstraint: NSLayoutConstraint {
    
    fileprivate var originalOffset: CGFloat = 0
    
    @IBInspectable var useCustomOffsetWhenKeyboardIsShown: Bool = false
    @IBInspectable var customOffset: CGFloat = 0
    
    // MARK: - Object lifecycle
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        originalOffset = constant
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - NSNotification methods
    
    func notificationKeyboardWillShow(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.cgRectValue
                let offset = useCustomOffsetWhenKeyboardIsShown ? customOffset : originalOffset
                constant = frame.size.height + offset
                
                updateLayout(userInfo)
            }
        }
    }
    
    func notificationKeyboardWillHide(_ notification: Notification) {
        constant = originalOffset
        
        if let userInfo = notification.userInfo {
            updateLayout(userInfo)
        }
    }
    
    func updateLayout(_ userInfo: [AnyHashable: Any]) {
        if let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber, let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber {
            UIView.animate(
                withDuration: TimeInterval(duration.doubleValue),
                delay: 0,
                options: UIViewAnimationOptions(rawValue: curve.uintValue),
                animations: {[weak self] in
                    var topView = self?.firstItem.superview! as UIView!
                    while let superview = topView?.superview , !(superview is UIWindow) {
                        topView = superview
                    }
                    topView?.layoutIfNeeded()
                },
                completion: nil)
        }
    }
}

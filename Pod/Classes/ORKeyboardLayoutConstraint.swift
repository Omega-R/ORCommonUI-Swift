//
//  ORKeyboardLayoutConstraint.swift
//  Pods
//
//  Created by Alexander Kurbanov on 4/5/16.
//  
//

import UIKit

open class ORKeyboardLayoutConstraint: NSLayoutConstraint {
    
    fileprivate var originalOffset: CGFloat = 0
    
    // MARK: - Object lifecycle
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.originalOffset = self.constant
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
                self.constant = frame.size.height + self.originalOffset
                
                self.updateLayout(userInfo)
            }
        }
    }
    
    func notificationKeyboardWillHide(_ notification: Notification) {
        self.constant = self.originalOffset
        
        if let userInfo = (notification as NSNotification).userInfo {
            self.updateLayout(userInfo)
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

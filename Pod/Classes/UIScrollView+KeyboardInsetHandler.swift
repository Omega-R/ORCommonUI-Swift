//
//  UIScrollView+KeyboardInsetHandler.swift
//  Pods
//
//  Created by Maxim Soloviev on 16/04/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import UIKit

open class ORScrollViewKeyboardInsetHandler : UIView {
    
    fileprivate weak var scrollView: UIScrollView!
    
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView

        super.init(frame: CGRect.zero)
        
        scrollView.addSubview(self)

        isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func notificationKeyboardWillShow(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            if let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.cgRectValue
                let kbSize = frame.size
                
                let currentInsets = scrollView.contentInset
                let contentInsets = UIEdgeInsetsMake(currentInsets.top, currentInsets.left, kbSize.height, currentInsets.right)
                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
        }
    }
    
    func notificationKeyboardWillHide(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
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

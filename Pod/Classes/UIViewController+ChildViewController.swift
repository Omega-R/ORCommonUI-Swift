//
//  UIViewController+ChildViewController.swift
//  Pods
//
//  Created by Maxim Soloviev on 08/06/16.
//
//

import UIKit

extension UIViewController {
    
    public func or_addChildViewController(childVC: UIViewController, intoView containerView: UIView? = nil) {
        addChildViewController(childVC)
        
        let parentView: UIView = containerView ?? self.view
        
        childVC.view.frame = parentView.frame
        parentView.addSubview(childVC.view)
        childVC.didMoveToParentViewController(self)
    }
    
    public func or_removeChildViewController(childVC: UIViewController) {
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()
    }
}

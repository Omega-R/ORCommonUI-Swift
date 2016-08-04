//
//  UIViewController+ChildViewController.swift
//  Pods
//
//  Created by Maxim Soloviev on 08/06/16.
//
//

import UIKit

extension UIViewController {
    
    public func or_addChildViewController(childVC: UIViewController, intoView containerView: UIView) {
        addChildViewController(childVC)
        
        childVC.view.frame = CGRectMake(0, 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame))
        containerView.addSubview(childVC.view)
        childVC.didMoveToParentViewController(self)
    }
    
    public func or_removeChildViewController(childVC: UIViewController) {
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()
    }
}
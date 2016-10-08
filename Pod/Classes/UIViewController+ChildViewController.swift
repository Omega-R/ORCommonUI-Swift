//
//  UIViewController+ChildViewController.swift
//  Pods
//
//  Created by Maxim Soloviev on 08/06/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func or_addChildViewController(_ childVC: UIViewController, intoView containerView: UIView) {
        addChildViewController(childVC)
        
        childVC.view.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        containerView.addSubview(childVC.view)
        childVC.didMove(toParentViewController: self)
    }
    
    public func or_removeFromParentViewController() {
        willMove(toParentViewController: nil)
        
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}

//
//  UIViewController+Alert.swift
//  Pods
//
//  Created by Maxim Soloviev on 06/04/16.
//  Copyright © 2016 Maxim Soloviev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func or_showAlert(title: String?, message: String, buttonTitle: String = "OK", actionBlock: ((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertVC.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.cancel, handler: actionBlock))
        
        present(alertVC, animated: true, completion: nil)
    }
}

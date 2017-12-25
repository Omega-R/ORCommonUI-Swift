//
//  ViewController.swift
//  ORCommonUI-Swift
//
//  Created by Maxim Soloviev on 04/12/2016.
//  Copyright (c) 2016 Maxim Soloviev. All rights reserved.
//

import UIKit
import ORCommonUI_Swift

class ViewController: UIViewController {

    @IBOutlet weak var ivColor: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ivColor.image = UIImage.or_imageWith(color: UIColor.cyan, size: CGSize(width: 1, height: 1))
        
        ORUserInteractionDisabler().disableInteractions(onTime: 1)

        let disabler = ORUserInteractionDisabler(disablingTime: 3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            disabler.enableInteractions()
        }
    }
}

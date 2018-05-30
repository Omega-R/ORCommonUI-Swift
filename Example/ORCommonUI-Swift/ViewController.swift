//
//  ViewController.swift
//  ORCommonUI-Swift
//
//  Created by Maxim Soloviev on 04/12/2016.
//  Copyright (c) 2016 Maxim Soloviev. All rights reserved.
//

import UIKit
import ORCommonUI_Swift

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var ivColor: UIImageView!
    @IBOutlet weak var tableVew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ivColor.image = UIImage.or_imageWith(color: UIColor.cyan, size: CGSize(width: 1, height: 1))
        
        ORUserInteractionDisabler().disableInteractions(onTime: 1)

        let disabler = ORUserInteractionDisabler(disablingTime: 3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            disabler.enableInteractions()
        }
        
        tableVew.dataSource = self
        tableVew.or_registerCellNibs(forClasses: TestTVCell.self, TestTVCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVew.dequeueReusableCell(withIdentifier: String(describing: TestTVCell.self), for: indexPath) as! TestTVCell
        return cell
    }
}

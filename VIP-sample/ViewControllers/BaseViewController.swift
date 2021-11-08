//
//  ViewController.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let destination = ViewController()
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

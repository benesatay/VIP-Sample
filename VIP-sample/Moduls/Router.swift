//
//  Router.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RoutingLogic {
    func navigate(from source: ViewController, to destination: ViewController)
    func present(from source: ViewController, to destination: ViewController)
}

class Router: NSObject {
    weak var viewController: ViewController?
 
}

extension Router: RoutingLogic {
    func navigate(from source: ViewController, to destination: ViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func present(from source: ViewController, to destination: ViewController) {
        source.navigationController?.present(destination, animated: true, completion: nil)
    }
}


//
//  Constants.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//

import UIKit

class AppConstants {
    enum CollectionCell: String {
        case none
        case movieCell
    }
    
    enum ASCIIControl {
        case tab
        case lineFeed
        case carriageReturn
        
        var character: String {
            switch self {
            case .tab:
                return "\t"
            case .lineFeed:
                return "\n"
            case .carriageReturn:
                return "\r"
            }
        }
    }
}

let SMALL_GAP: CGFloat = 5
let GAP: CGFloat = 10
let LARGE_GAP: CGFloat = 20

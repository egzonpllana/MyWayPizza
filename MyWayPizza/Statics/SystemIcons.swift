//
//  SystemIcons.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

enum SystemIcons {
    case heart
    case heartFill
}

extension SystemIcons {
    var image: UIImage {
        switch self {
        case .heart: return UIImage(systemName: "suit.heart") ?? UIImage()
        case .heartFill: return UIImage(systemName: "suit.heart.fill") ?? UIImage()
        }
    }
}

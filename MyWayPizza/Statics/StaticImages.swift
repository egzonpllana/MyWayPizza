//
//  StaticImages.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import UIKit

enum StaticImages {
    case restaurant1
    case restaurant2
    case meal1
    case meal2
    case meal3
    case meal4
    case meal5
    case meal6
    case meal7
}

extension StaticImages {
    var image: UIImage {
        switch self {
        case .restaurant1: return #imageLiteral(resourceName: "restaurant1")
        case .restaurant2: return #imageLiteral(resourceName: "restaurant2")
        case .meal1: return #imageLiteral(resourceName: "meal1")
        case .meal2: return #imageLiteral(resourceName: "meal2")
        case .meal3: return #imageLiteral(resourceName: "meal3")
        case .meal4: return #imageLiteral(resourceName: "meal4")
        case .meal5: return #imageLiteral(resourceName: "meal5")
        case .meal6: return #imageLiteral(resourceName: "meal6")
        case .meal7: return #imageLiteral(resourceName: "meal7")
        }
    }
}

//
//  UIRoundedView.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

@IBDesignable class UIRoundedView: UIExtendedView {

    @IBInspectable var topLeftCorner: Bool = true {
        didSet {
            if !topLeftCorner {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }

    @IBInspectable var topRightCorner: Bool = true {
        didSet {
            if !topRightCorner {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }

    @IBInspectable var bottomLeftCorner: Bool = true {
        didSet {
            if !bottomLeftCorner {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }

    @IBInspectable var bottomRightCorner: Bool = true {
        didSet {
            if !bottomRightCorner {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
}

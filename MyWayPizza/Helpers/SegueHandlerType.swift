//
//  SegueHandlerType.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import Foundation

// NOTE: Our SegueHandlerType system is inspired by
// https://www.natashatherobot.com/protocol-oriented-segue-identifiers-swift/

import UIKit

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    func performSegue(withIdentifier: SegueIdentifier, sender: Any?) {
        performSegue(withIdentifier: withIdentifier.rawValue, sender: sender)
    }

    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        // still have to use guard stuff here, but at least you're
        // extracting it this time
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(String(describing: segue.identifier)).") }
        return segueIdentifier
    }
}

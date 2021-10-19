//
//  MenuItemModel.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

struct MenuItemModel: Codable {
    let id: Int
    let category: String
    let name: String
    let topping: [String]?
    let price: Double
    let rank: Int?
}

//
//  MenuItemViewModel.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

struct MenuItemViewModel {
    let id: Int
    let category: String
    let name: String
    let topping: [String]?
    let price: Double
    let rank: Int?

    init(withModel model: MenuItemModel) {
        self.id = model.id
        self.category = model.category
        self.name = model.name
        self.topping = model.topping
        self.price = model.price
        self.rank = model.rank
    }
}

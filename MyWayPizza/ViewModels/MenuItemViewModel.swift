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

extension MenuItemViewModel {
    var readableTopping: String {
        return self.topping?.joined(separator: ", ") ?? "No topping yet."
    }

    var readableRank: String {
        return (self.rank != nil) ? ("★ " + String(self.rank!)) : "No rating yet."
    }
}

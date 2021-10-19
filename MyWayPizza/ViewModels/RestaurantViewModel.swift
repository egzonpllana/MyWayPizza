//
//  RestaurantViewModel.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

struct RestaurantViewModel {
    let id: Int
    let name: String
    let address1: String
    let address2: String
    let latitude: Double
    let longitude: Double

    init(withModel model: RestaurantModel) {
        self.id = model.id
        self.name = model.name
        self.address1 = model.address1
        self.address2 = model.address2
        self.latitude = model.latitude
        self.longitude = model.longitude
    }
}

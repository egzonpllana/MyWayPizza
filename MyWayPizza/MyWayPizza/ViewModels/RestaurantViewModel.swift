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

    init(restaurantModel: RestaurantModel) {
        self.id = restaurantModel.id
        self.name = restaurantModel.name
        self.address1 = restaurantModel.address1
        self.address2 = restaurantModel.address2
        self.latitude = restaurantModel.latitude
        self.longitude = restaurantModel.longitude
    }
}

//
//  RestaurantModel.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

struct RestaurantModel: Codable {
    let id: Int
    let name: String
    let address1: String
    let address2: String
    let latitude: Double
    let longitude: Double
}

//
//  CoreDependency.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

protocol Dependency {
    func restaurantService() -> RestaurantService
}

class CoreDependency: Dependency {
    func restaurantService() -> RestaurantService {
        return MockRestaurantService()
    }
}

//
//  AppDependency.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

class AppDependency: CoreDependency {

    // MARK: - RestaurantService

    override func restaurantService() -> RestaurantService {
        return MWPRestaurantService()
    }
}

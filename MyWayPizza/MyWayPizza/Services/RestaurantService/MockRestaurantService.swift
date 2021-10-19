//
//  MockRestaurantService.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

class MockRestaurantService: RestaurantService {
    func getRestaurantsList(completion: @escaping (Result<[RestaurantModel], Error>) -> Void) {
        // return mock object
    }

    func getRestaurant(withId id: Int, completion: @escaping (Result<RestaurantModel, Error>) -> Void) {
        // return mock object
    }

    func getRestaurantMenu(withId id: Int, completion: @escaping (Result<[MenuItemModel], Error>) -> Void) {
        // return mock object
    }
}

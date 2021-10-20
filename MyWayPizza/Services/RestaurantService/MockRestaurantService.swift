//
//  MockRestaurantService.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

class MockRestaurantService: RestaurantService {
    func getRestaurantsList(completion: @escaping (Result<[RestaurantModel], Error>) -> Void) {
        let restaurant = RestaurantModel(id: 1, name: "Pizza Hut", address1: "Address 1", address2: "Address 2", latitude: 80.00, longitude: 90.00)
        completion(.success([restaurant]))
    }

    func getRestaurant(withId id: Int, completion: @escaping (Result<RestaurantModel, Error>) -> Void) {
        // return mock object
    }

    func getRestaurantMenu(withId id: Int, completion: @escaping (Result<[MenuItemModel], Error>) -> Void) {
        // return mock object
    }
}

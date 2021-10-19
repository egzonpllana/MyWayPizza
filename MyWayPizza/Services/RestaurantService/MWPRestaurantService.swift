//
//  MWPRestaurantService.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

class MWPRestaurantService: RestaurantService {
    func getRestaurantsList(completion: @escaping (Result<[RestaurantModel], Error>) -> Void) {
        APIClient.getRestaurants { (result) in
            switch result {
            case .success(let restaurants):
                completion(.success(restaurants))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getRestaurant(withId id: Int, completion: @escaping (Result<RestaurantModel, Error>) -> Void) {
        APIClient.getRestaurant(withId: id) { (result) in
            switch result {
            case .success(let restaurant):
                completion(.success(restaurant))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getRestaurantMenu(withId id: Int, completion: @escaping (Result<[MenuItemModel], Error>) -> Void) {
        APIClient.getRestaurantMenu(withId: id) { (result) in
            switch result {
            case .success(let restaurant):
                completion(.success(restaurant))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

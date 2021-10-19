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
}

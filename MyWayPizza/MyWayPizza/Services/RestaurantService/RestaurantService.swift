//
//  RestaurantService.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

protocol RestaurantService {
    /// Get restaurants list.
    ///
    /// ```
    /// getRestaurantsList()
    /// ```
    ///
    /// - No parameters needed.
    func getRestaurantsList(completion: @escaping (Result<[RestaurantModel], Error>) -> Void)

}

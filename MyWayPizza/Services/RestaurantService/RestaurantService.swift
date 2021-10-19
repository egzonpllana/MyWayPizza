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

    /// Get restaurant details.
    ///
    /// ```
    /// getRestaurant()
    /// ```
    ///
    /// - Parameters:
    /// - restaurant id
    func getRestaurant(withId id: Int, completion: @escaping (Result<RestaurantModel, Error>) -> Void)

    /// Get restaurant menu.
    ///
    /// ```
    /// getRestaurant()
    /// ```
    ///
    /// - Parameters:
    /// - restaurant id
    func getRestaurantMenu(withId id: Int, completion: @escaping (Result<[MenuItemModel], Error>) -> Void)
}

//
//  APIClient.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>) -> Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }

    static func getRestaurants(completion: @escaping (Result<[RestaurantModel], AFError>) -> Void) {
        performRequest(route: APIRouter.restaurants, completion: completion)
    }
}

//
//  APIConstants.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Foundation

struct APIConstants {
    struct ProductionServer {
        static let baseURL = "https://private-504473-pizzaapp.apiary-mock.com/"
    }

    struct APIParameterKey {
        static let restaurants = "restaurants/"
        static let orders = "orders/"
    }
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

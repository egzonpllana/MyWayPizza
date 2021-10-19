//
//  APIRouter.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import Alamofire

enum APIRouter: URLRequestConvertible {

    case restaurants
    case restaurantById(id: Int)
    case restaurantMenu(restaurantId: Int)
    case placeOrder

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .restaurants, .restaurantById, .restaurantMenu:
            return .get
        case .placeOrder:
            return .post
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .restaurants:
            return APIConstants.APIParameterKey.restaurants
        case .restaurantById(let id):
            return APIConstants.APIParameterKey.restaurants + "\(id)"
        case .restaurantMenu(let id):
            return APIConstants.APIParameterKey.restaurants + "\(id)/menu"
        case .placeOrder:
            return APIConstants.APIParameterKey.orders
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .restaurants, .restaurantById, .restaurantMenu, .placeOrder:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.ProductionServer.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        return urlRequest
    }
}

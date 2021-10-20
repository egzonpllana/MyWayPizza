//
//  RestaurantServiceTests.swift
//  MyWayPizzaTests
//
//  Created by Egzon Pllana on 20.10.21.
//

@testable import MyWayPizza
import XCTest

class RestaurantServiceTests: XCTestCase, HasDependencies {

    // MARK: - Dependencies

    private lazy var restaurantService: RestaurantService = dependencies.restaurantService()

    // MARK: - Test Life cycle

    override func setUpWithError() throws {
        try super.setUpWithError()

        // Use test dependency or even a scoped one to the test!
        DependencyInjector.dependencies = TestRestaurantService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        // Set dependencies back to what it was
        DependencyInjector.dependencies = AppDependency()
    }

    func testGetRestaurantsList() {
        restaurantService.getRestaurantsList { result in
            switch result {
            case .success(let rests):
                XCTAssertNotNil(rests)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
}

extension RestaurantServiceTests {
    private class TestRestaurantService: AppDependency {

        // Override with mocks, spy, or whatever

        override func restaurantService() -> RestaurantService {
            return MockRestaurantService()
        }
    }
}

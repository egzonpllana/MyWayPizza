//
//  RestaurantViewModelTests.swift
//  MyWayPizzaTests
//
//  Created by Egzon Pllana on 20.10.21.
//

@testable import MyWayPizza
import XCTest

class RestaurantViewModelTests: XCTestCase {

    // MARK: - Properties

    var sut: RestaurantViewModel!

    // MARK: - Test Life cycle

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

        sut = nil
        try super.tearDownWithError()
    }

    // MARK: - Test Methods

    func testInitialization() {
        let restaurant = RestaurantModel(id: 1, name: "Pizza Hut", address1: "Address 1", address2: "Address 2", latitude: 80.00, longitude: 90.00)
        let restaurantViewModel = RestaurantViewModel(withModel: restaurant)

        XCTAssertNotNil(restaurantViewModel, "The restaurant view model should not be nil.")
        XCTAssertEqual(restaurantViewModel.id, restaurant.id)
        XCTAssertEqual(restaurantViewModel.name, restaurant.name)
        XCTAssertEqual(restaurantViewModel.address1, restaurant.address1)
        XCTAssertEqual(restaurantViewModel.address2, restaurant.address2)
        XCTAssertEqual(restaurantViewModel.latitude, restaurant.latitude)
        XCTAssertEqual(restaurantViewModel.longitude, restaurant.longitude)
    }
}

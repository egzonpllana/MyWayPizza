//
//  MenuItemViewModelTests.swift
//  MyWayPizzaTests
//
//  Created by Egzon Pllana on 20.10.21.
//

@testable import MyWayPizza
import XCTest

class MenuItemViewModelTests: XCTestCase {

    // MARK: - Properties

    var sut: MenuItemViewModel!

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
        let menuItem = MenuItemModel(id: 1, category: "Pizza", name: "Pizza Margarita", topping: ["Broccolini"], price: 7.50, rank: 5)
        let menuItemViewModel = MenuItemViewModel(withModel: menuItem)

        XCTAssertNotNil(menuItemViewModel, "The menu item view model should not be nil.")
        XCTAssertEqual(menuItemViewModel.id, menuItem.id)
        XCTAssertEqual(menuItemViewModel.category, menuItem.category)
        XCTAssertEqual(menuItemViewModel.name, menuItem.name)
        XCTAssertEqual(menuItemViewModel.topping, menuItem.topping)
        XCTAssertEqual(menuItemViewModel.price, menuItem.price)
        XCTAssertEqual(menuItemViewModel.rank, menuItem.rank)
    }

    func testToppings() {
        let menuItem = MenuItemModel(id: 1, category: "Pizza", name: "Pizza Margarita", topping: nil, price: 7.50, rank: 5)
        let menuItemViewModel = MenuItemViewModel(withModel: menuItem)
        XCTAssertNil(menuItemViewModel.topping, "Topping should be empty!")
    }

    func testRank() {
        let menuItem = MenuItemModel(id: 1, category: "Pizza", name: "Pizza Margarita", topping: ["Broccolini"], price: 7.50, rank: nil)
        let menuItemViewModel = MenuItemViewModel(withModel: menuItem)
        XCTAssertNil(menuItemViewModel.rank, "Rank should be empty!")
    }

    func testReadableTopping() {
        let menuItem = MenuItemModel(id: 1, category: "Pizza", name: "Pizza Margarita", topping: ["Broccolini", "Potato"], price: 7.50, rank: 5)
        let menuItemViewModel = MenuItemViewModel(withModel: menuItem)
        let readableTopping = menuItem.topping?.joined(separator: ", ") ?? "No topping yet."
        XCTAssertEqual(menuItemViewModel.readableTopping, readableTopping, "Readable topping should be equal!")
    }

    func testReadableRanking() {
        let menuItem = MenuItemModel(id: 1, category: "Pizza", name: "Pizza Margarita", topping: nil, price: 7.50, rank: 5)
        let menuItemViewModel = MenuItemViewModel(withModel: menuItem)
        let readableRank = (menuItem.rank != nil) ? ("★ " + String(menuItem.rank!)) : "No rating yet."

        XCTAssertEqual(menuItemViewModel.readableRank, readableRank)
    }
}

//
//  RestaurantMenuTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantMenuTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet var emptyView: UIView!

    // MARK: - Properties

    var isFavourite: Bool = false // should be inside viewModel

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add favourite button
        addFavouriteNavigationItem()
    }

    // MARK: - Methods

    private func addFavouriteNavigationItem() {
        let buttonImage = isFavourite ? SystemIcons.heartFill.image : SystemIcons.heart.image
        let favouriteButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(RestaurantMenuTableViewController.favouriteRestaurant))
        self.navigationItem.rightBarButtonItem  = favouriteButton
    }

    @objc private func favouriteRestaurant() {
        isFavourite.toggle()
        addFavouriteNavigationItem()
    }
}

// MARK: - TableView Datasource & Delegates

extension RestaurantMenuTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let menuCell: MenuItemTableViewCell = tableView.dequeueReusableCell()
        return menuCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        // sender: viewModel
        self.performSegue(withIdentifier: .restaurantItemDetails, sender: nil)
    }
}

// MARK: - Navigation

extension RestaurantMenuTableViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case restaurantItemDetails
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierForSegue(segue: segue) {
        case .restaurantItemDetails:
            print("Segue -> restaurantItemDetails")
            /*
            guard let restaurantMenuTableViewController = segue.destination as? RestaurantMenuTableViewController else {
                assertionFailure()
                return
            }

            guard let menuItem = sender as? MenuItemViewModel else {
                assertionFailure()
                return
            }

             restaurantMenuTableViewController.item = menuItem
             */
        }
    }
}

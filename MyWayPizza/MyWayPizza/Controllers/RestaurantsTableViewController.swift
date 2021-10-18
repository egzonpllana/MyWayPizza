//
//  RestaurantsTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

    @IBOutlet weak var searchBarView: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBarView.backgroundImage = UIImage()
    }
}

// MARK: - TableView Datasource & Delegates

extension RestaurantsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // configure cell
        let restaurantCell: RestaurantTableViewCell = tableView.dequeueReusableCell()

        return restaurantCell
    }
}

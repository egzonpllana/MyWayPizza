//
//  RestaurantsTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

    // MARK: - Outlets

    @IBOutlet weak var searchBarView: UISearchBar!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBarView.backgroundImage = UIImage()
        self.navigationController?.setTintColor(.black)
    }

    // MARK: - Actions

    @IBAction func cartButtonPressed(_ sender: Any) {
        // favourite restaurant with id
    }
}

// MARK: - TableView Datasource & Delegates

extension RestaurantsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let restaurantCell: RestaurantTableViewCell = tableView.dequeueReusableCell()
        return restaurantCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        // sender: viewModel
        self.performSegue(withIdentifier: .restaurantMenu, sender: nil)
    }
}

// MARK: - Navigation

extension RestaurantsTableViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case restaurantMenu
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierForSegue(segue: segue) {
        case .restaurantMenu:
            print("Segue -> restaurantMenu")
            /*
            guard let restaurantMenuTableViewController = segue.destination as? RestaurantMenuTableViewController else {
                assertionFailure()
                return
            }

            guard let restaurant = sender as? RestaurantViewModel else {
                assertionFailure()
                return
            }

             restaurantMenuTableViewController.restaurant = restaurant
             */
        }
    }
}

//
//  RestaurantsTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {

    // MARK: - Outlets

    @IBOutlet var emptyView: UIView!
    @IBOutlet private weak var searchBarView: UISearchBar!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBarView.backgroundImage = UIImage()
        self.navigationController?.setTintColor(.black)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFooterView()
    }

    // MARK: - Methods

    private func setFooterView() {
        let safeArea = 200 +
        self.navigationController!.navigationBar.frame.height + 70 // 70 header size
        emptyView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - safeArea)
        tableView.tableFooterView = emptyView
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
        return 0
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

//
//  RestaurantsTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantsTableViewController: UITableViewController, HasDependencies {

    // MARK: - Dependencies

    private lazy var restaurantService: RestaurantService = dependencies.restaurantService()

    // MARK: - Properties

    private var tableViewDataSourceState = DataSourceState<RestaurantViewModel>.loading {
        didSet {
            // Update footer view
            setFooterView()
            tableView.reloadData()
        }
    }

    // MARK: - Outlets

    @IBOutlet var emptyView: UIView!
    @IBOutlet private weak var searchBarView: UISearchBar!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom Search Bar
        self.searchBarView.backgroundImage = UIImage()

        // Navigation Bar tint color
        self.navigationController?.setTintColor(.black)

        // Get restaurants from API
        // Fake network response to see loading screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getRestaurntsList()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFooterView()
    }

    // MARK: - Methods

    func getRestaurntsList() {
        restaurantService.getRestaurantsList { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                let viewModels = restaurants.map { RestaurantViewModel(withModel: $0) }
                self.tableViewDataSourceState = .populated(viewModels)
            case .failure(let error):
                assertionFailure(error.localizedDescription)
            }
        }
    }

    private func setFooterView() {
        switch tableViewDataSourceState {
            // You can customize view for different cases
        case .empty, .loading, .error:
            let safeArea = 200 +
            self.navigationController!.navigationBar.frame.height + 70 // 70 header size
            emptyView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - safeArea)
            tableView.tableFooterView = emptyView
        case .populated:
            tableView.tableFooterView = nil
        }
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
        return tableViewDataSourceState.currentItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let restaurantCell: RestaurantTableViewCell = tableView.dequeueReusableCell()
        let viewModel = tableViewDataSourceState.currentItems[indexPath.row]
        restaurantCell.configure(withViewModel: viewModel)
        return restaurantCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = tableViewDataSourceState.currentItems[indexPath.row]
        self.performSegue(withIdentifier: .restaurantMenu, sender: viewModel)
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
            guard let restaurantMenuTableViewController = segue.destination as? RestaurantMenuTableViewController else {
                assertionFailure()
                return
            }

            guard let restaurant = sender as? RestaurantViewModel else {
                assertionFailure()
                return
            }

            restaurantMenuTableViewController.restaurantViewModel = restaurant
        }
    }
}

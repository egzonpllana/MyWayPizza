//
//  RestaurantMenuTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantMenuTableViewController: UITableViewController, HasDependencies {

    // MARK: - Dependencies

    private lazy var restaurantService: RestaurantService = dependencies.restaurantService()

    // MARK: - Outlets

    @IBOutlet var emptyView: UIView!
    @IBOutlet private weak var restaurantNameLabel: UILabel!
    @IBOutlet private weak var firstLocationLabel: UILabel!
    @IBOutlet private weak var secondLocationLabel: UILabel!

    // MARK: - Properties

    var isFavourite: Bool = false // should be inside viewModel
    var restaurantViewModel: RestaurantViewModel!

    private var tableViewDataSourceState = DataSourceState<MenuItemViewModel>.loading {
        didSet {
            // Update footer view
            setFooterView()
            tableView.reloadData()
        }
    }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add favourite button
        addFavouriteNavigationItem()

        // Load UI
        loadUI()

        // Get restaurant menu from API
        // Fake network response to see loading screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getRestaurntMenu()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFooterView()
    }

    // MARK: - Methods

    private func loadUI() {
        restaurantNameLabel.text = restaurantViewModel.name
        firstLocationLabel.text = restaurantViewModel.address1
        secondLocationLabel.text = restaurantViewModel.address2
    }

    func getRestaurntMenu() {
        restaurantService.getRestaurantMenu(withId: restaurantViewModel.id) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let menu):
                let viewModels = menu.map { MenuItemViewModel(withModel: $0) }
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
        return tableViewDataSourceState.currentItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell: MenuItemTableViewCell = tableView.dequeueReusableCell()
        let viewModel = tableViewDataSourceState.currentItems[indexPath.row]
        menuCell.configure(withViewModel: viewModel)
        return menuCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = tableViewDataSourceState.currentItems[indexPath.row]
        self.performSegue(withIdentifier: .restaurantItemDetails, sender: viewModel)
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
            guard let menuItemDetailsViewController = segue.destination as? MenuItemDetailsViewController else {
                assertionFailure()
                return
            }

            guard let menuItem = sender as? MenuItemViewModel else {
                assertionFailure()
                return
            }

            menuItemDetailsViewController.menuItemViewModel = menuItem
        }
    }
}

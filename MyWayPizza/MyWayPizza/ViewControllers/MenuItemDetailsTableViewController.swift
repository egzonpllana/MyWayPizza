//
//  MenuItemDetailsTableViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class MenuItemDetailsTableViewController: UITableViewController {

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
        let favouriteButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(MenuItemDetailsTableViewController.favouriteItem))
        self.navigationItem.rightBarButtonItem  = favouriteButton
    }

    @objc private func favouriteItem() {
        isFavourite.toggle()
        addFavouriteNavigationItem()
    }
}

// MARK: - TableView Datasource & Delegates

extension MenuItemDetailsTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}

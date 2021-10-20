//
//  MenuItemTableViewCell.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var toppingLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!

    // MARK: - Methods

    func configure(withViewModel viewModel: MenuItemViewModel) {
        nameLabel.text = viewModel.name
        // TODO: move to view model as computed property: readableTopping
        toppingLabel.text = viewModel.readableTopping

        // Note: static, missing on api,
        // would be nice to have these from server..
        let imageName = "meal" + String(viewModel.id) // ex. meal1
        coverImageView.image = UIImage(named: imageName)

        // Get rank, if any
        // TODO: move to view model as computed property: readableRating
        rankLabel.text = viewModel.rank != 0 ? "★ " + String(viewModel.rank) : "No rating yet."
    }
}

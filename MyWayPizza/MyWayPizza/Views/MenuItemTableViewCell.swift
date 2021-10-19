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
    @IBOutlet private weak var toppingsLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!

    // MARK: - Methods

    func configure(withViewModel viewModel: MenuItemViewModel) {
        nameLabel.text = viewModel.name
        toppingsLabel.text = viewModel.topping?.joined(separator: ", ") ?? "No toppings"

        // Note: static, missing on api,
        // would be nice to have these from server..
        let imageName = "meal" + String(viewModel.id) // ex. meal1
        coverImageView.image = UIImage(named: imageName)

        // Get rank, if any
        if let rank = viewModel.rank {
            rankLabel.text = "★ " + String(rank)
        } else {
            rankLabel.text = "No rank yet."
        }
    }
}

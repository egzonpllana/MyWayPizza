//
//  RestaurantTableViewCell.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 18.10.21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var firstAddressLabel: UILabel!
    @IBOutlet private weak var secondAddressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!

    // MARK: - Methods

    func configure(withViewModel viewModel: RestaurantViewModel) {
        nameLabel.text = viewModel.name
        firstAddressLabel.text = viewModel.address1
        secondAddressLabel.text = viewModel.address2

        // Note: static, missing on api,
        // would be nice to have these from server..
        coverImageView.image = viewModel.id == 1 ? StaticImages.restaurant1.image : StaticImages.restaurant2.image
        ratingLabel.text = (viewModel.id == 1) ? ("★ " + String(4.7)) : ("★ " + String(4.3))
    }
}

//
//  MenuItemDetailsViewController.swift
//  MyWayPizza
//
//  Created by Egzon Pllana on 19.10.21.
//

import UIKit

private enum StringLiterals: String {
    case total = "Total "
    case spaceAndKR = " kr"
}

class MenuItemDetailsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var restaurantBackgroundImageView: UIImageView!
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var toppingLabel: UILabel!
    @IBOutlet private weak var itemsCountLabel: UILabel!
    @IBOutlet private weak var totalPriceLabel: UILabel!

    // MARK: - Properties

    var menuItemViewModel: MenuItemViewModel!
    var isFavourite: Bool = false // should be inside viewModel
    var itemsCounter: Int = 1 {
        didSet {
            itemsCountLabel.text = String(itemsCounter)
            totalPriceLabel.text = StringLiterals.total.rawValue + String(Double(itemsCounter) * menuItemViewModel.price) + StringLiterals.spaceAndKR.rawValue
        }
    }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // Setup UI
        setupUI()

        // Configure navigation bar items
        addFavouriteNavigationItem()
    }

    // MARK: - Methods

    private func setupUI() {

        itemNameLabel.text = menuItemViewModel.name
        categoryLabel.text = menuItemViewModel.category
        toppingLabel.text = menuItemViewModel.topping
        totalPriceLabel.text = "Total: " + String(menuItemViewModel.price) + "kr"

        // Loading static images
        restaurantBackgroundImageView.image = StaticImages.restaurant1.image
        itemImageView.image = StaticImages.meal1.image
    }

    private func addFavouriteNavigationItem() {
        let buttonImage = isFavourite ? SystemIcons.heartFill.image : SystemIcons.heart.image
        let favouriteButton = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(MenuItemDetailsViewController.favouriteItem))
        self.navigationItem.rightBarButtonItem  = favouriteButton
    }

    @objc private func favouriteItem() {
        isFavourite.toggle()
        addFavouriteNavigationItem()
    }

    // MARK: - Actions

    @IBAction func stepperButtonPressed(_ sender: UIButton) {
        // 0: down, 1: up
        if sender.tag == 0 && itemsCounter == 1 { return }
        (sender.tag == 0) ? (itemsCounter -= 1) : (itemsCounter += 1)
    }

    @IBAction func placeOrderPressed(_ sender: Any) {

    }
}

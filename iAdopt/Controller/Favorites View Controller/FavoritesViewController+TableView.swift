//
//  FavoritesViewController+TableView.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

	// MARK: Number of sections in table view
	func numberOfSections(in tableView: UITableView) -> Int {
		if let sections = favoriteFetchedResultsController.sections {
			return sections.count
		}

		return 0
    }

	// MARK: Number of rows in section
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let sections = favoriteFetchedResultsController.sections {
			let currentSection = sections[section]
			return currentSection.numberOfObjects
		}

		return 0
    }

	// MARK: Cell for row at index path
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let petFavorite = favoriteFetchedResultsController.object(at: indexPath)

		let petTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PetTableViewCell

		petTableViewCell.petFavorite = petFavorite

		petTableViewCell.setUpCell()

        return petTableViewCell
    }

	// MARK: Title for header in section
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let sections = favoriteFetchedResultsController.sections {
			let currentSection = sections[section]
			return currentSection.name
		}

		return nil
	}

	// MARK: Hight for row at index path
	// The image height of the cell is constrained to 75. This function will always return 75.
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 75
	}

	// MARK:
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			PetFavoriteStore.shared.deleteFavorite(usingContext: DataController.shared.viewContext, petFavorite: favoriteFetchedResultsController.object(at: indexPath))
		}
	}

	// MARK: Did select row at
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let petCell = tableView.cellForRow(at: indexPath) as! PetTableViewCell
		performSegue(withIdentifier: "showPetDetailsView", sender: petCell)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

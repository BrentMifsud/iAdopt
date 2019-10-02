//
//  PetSearchResultsViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-29.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import CoreData

class PetSearchResultsViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var getYourPetButton: UIButton!
	@IBOutlet weak var tableView: UITableView!

	// MARK: - Class properties

	let reuseId = "petCell"

	var petType: SearchResults.PetTypeShown!

	// MARK: - View lifecycle methods

	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: reuseId)
    }

	// MARK: - IBActions

	@IBAction func getYourPetButtonPressed(_ sender: UIButton) {
		let app = UIApplication.shared
		if let toOpen = GetYourPetClient.UrlConstants.homePageUrl {
			app.open(toOpen, options: [:], completionHandler: nil)
		}
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		let petCell = sender as! PetTableViewCell
		let pet: Pet = petCell.pet

		let petDetailsView = segue.destination as! PetDetailsViewController

		petDetailsView.pet = pet
		petDetailsView.petFavorite = PetFavoriteStore.shared.fetchFavorite(byPet: pet)
		petDetailsView.petImages = [petCell.petImageView.image!]
	}
	
}

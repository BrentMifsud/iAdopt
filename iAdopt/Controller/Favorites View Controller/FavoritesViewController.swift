//
//  FavoritesViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var navigationBar: UINavigationBar!
	@IBOutlet weak var getYourPetButton: UIButton!
	@IBOutlet weak var tableView: UITableView!

	let reuseId = "petCell"

	var favoriteFetchedResultsController: NSFetchedResultsController<PetFavorite>!

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationBar.prefersLargeTitles = true
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "PetTableViewCell", bundle: nil), forCellReuseIdentifier: reuseId)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setUpFetchedResultsControllers()

		refreshTable()
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

		let petDetailsView = segue.destination as! PetDetailsViewController

		petDetailsView.pet = petCell.pet

		petDetailsView.petFavorite = petCell.petFavorite

		petDetailsView.petImages = [petCell.petImageView.image!]
	}

	// MARK: - Class Functions

	/// Fetch persisted favorites from Core Data.
	func refreshTable(){
		do {
			try favoriteFetchedResultsController.performFetch()
		} catch {
			fatalError("Unable to fetch favorites: \(error.localizedDescription)")
		}

		tableView.reloadData()
	}
}





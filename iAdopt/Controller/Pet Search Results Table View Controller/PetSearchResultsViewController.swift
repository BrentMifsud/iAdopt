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
	@IBOutlet weak var getYourPetView: UIView!

	// MARK: - Class properties

	let reuseId = "petCell"

	var petType: SearchResults.PetTypeShown!

	var viewControllerType: ViewControllerType = .searchResults

	var favoriteFetchedResultsController: NSFetchedResultsController<PetFavorite>!

	enum ViewControllerType {
		case favorites
		case searchResults
	}

	// MARK: - View lifecycle methods

	override func viewDidLoad() {
        super.viewDidLoad()
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

		petDetailsView.pet = petCell.petDetails
		petDetailsView.petImages = [petCell.petImageView.image!]
	}

	// MARK: - Class Functions

	/// Fetch persisted favorites from Core Data.
	fileprivate func refreshTable(){
		do {
			try favoriteFetchedResultsController.performFetch()
		} catch {
			fatalError("Unable to fetch favorites: \(error.localizedDescription)")
		}

		tableView.reloadData()
	}
}

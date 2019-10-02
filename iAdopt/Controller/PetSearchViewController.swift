//
//  PetSearchViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-25.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetSearchViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var speciesSelector: UISegmentedControl!
	@IBOutlet weak var zipCodeTextField: UITextField!
	@IBOutlet weak var distanceSlider: UISlider!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var searchButton: UIButton!

	// MARK: - Class Properties
	private var selectionString: String? = GetYourPetClient.PetType.Cat
	private var activityView = UIView()

	// MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.subscribeToKeyboardNotifications()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.unsubscribeFromKeyboardNotifications()
	}

	// MARK: - IBActions
	@IBAction func distanceSliderDidChangeValue(_ sender: UISlider) {
		let intValue = Int(sender.value)
		let stringValue = String(intValue)
		distanceLabel.text = stringValue
	}

	@IBAction func speciesSelectorDidChange(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			selectionString = GetYourPetClient.PetType.Cat
			SearchResults.shared.petTypeShown = .cat
		case 1:
			selectionString = GetYourPetClient.PetType.Dog
			SearchResults.shared.petTypeShown = .dog
		default:
			selectionString = nil
			SearchResults.shared.petTypeShown = .both
		}
	}


	@IBAction func beginSearchPressed(_ sender: UIButton) {
		enableUI(false)

		SearchResults.shared.clearResults()

		guard let zipCode = zipCodeTextField.text else {
			self.enableUI(true)
			return
		}

		guard !zipCode.isEmpty, zipCode.count == 5 else {
			presentErrorAlert(title: "Search Failed", message: "Please Ensure you have entered a valid zip code.")
			self.enableUI(true)
			return
		}

		let searchDistance = UInt(distanceSlider.value)

		let request = GetYourPetRequest(zipCode: zipCode, searchRadiusInMiles: searchDistance, pageNumber: 1, orderBy: GetYourPetClient.OrderBy.Distance, petType: selectionString)

		GetYourPetClient.shared.postPetsBySearch(requestBody: request, completion: handleSearchResults(responseBody:error:))
	}

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let searchResultsTabBarController = segue.destination as! UITabBarController

		SearchResults.shared.zipCode = zipCodeTextField.text!
		SearchResults.shared.distance = UInt(distanceSlider.value)
		SearchResults.shared.currentPage = 1
		SearchResults.shared.endOfResults = false

		let catViewController = searchResultsTabBarController.viewControllers![0] as! PetSearchResultsViewController
		let dogViewController = searchResultsTabBarController.viewControllers![1] as! PetSearchResultsViewController

		catViewController.petType = .cat
		dogViewController.petType = .dog

		switch SearchResults.shared.petTypeShown {
		case .both:
			break
		case .cat:
			searchResultsTabBarController.tabBar.items![1].isEnabled = false
			searchResultsTabBarController.selectedIndex = 0
		case .dog:
			searchResultsTabBarController.tabBar.items![0].isEnabled = false
			searchResultsTabBarController.selectedIndex = 1
		}
    }

	// MARK: - Class Methods

	fileprivate func enableUI(_ enabled: Bool){
		speciesSelector.isEnabled = enabled
		zipCodeTextField.isEnabled = enabled
		distanceSlider.isEnabled = enabled
		searchButton.isEnabled = enabled
		showActivityIndicator(activityView: &activityView, !enabled)
	}

	/// Handler for search results.
	/// - Parameter responseBody: Collection of Pet response data.
	/// - Parameter error: Any error that occured.
	fileprivate func handleSearchResults(responseBody: [Pet]?, error: Error?) {
		guard let responseBody = responseBody, error == nil else {
			DispatchQueue.main.async {
				self.presentErrorAlert(title: "Unable to retrieve adoption listings.", message: "\(String(describing: error!.localizedDescription))")
				self.enableUI(true)
			}
			return
		}

		guard responseBody.count > 0 else {
			DispatchQueue.main.async {
				self.presentErrorAlert(title: "Unable to retrieve adoption listings.", message: "\(String(describing: error!.localizedDescription))")
				self.enableUI(true)
			}
			return
		}

		DispatchQueue.main.async {
			SearchResults.shared.searchResults = responseBody
			self.performSegue(withIdentifier: Segues.searchResults, sender: self)
			self.enableUI(true)
		}
	}
}

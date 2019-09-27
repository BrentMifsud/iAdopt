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
	private var activityView: UIView!

	// MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
		case 1:
			selectionString = GetYourPetClient.PetType.Dog
		default:
			selectionString = nil
		}
	}


	@IBAction func beginSearchPressed(_ sender: UIButton) {
		guard let zipCode = zipCodeTextField.text else {
			#warning("Present Error alert saying zipcode must be populated")
			self.enableUI(true)
			return
		}

		let searchDistance = UInt(distanceSlider.value)

		enableUI(false)

		let request = GetYourPetRequest(zipCode: zipCode, searchRadiusInMiles: searchDistance, pageNumber: 1, orderBy: GetYourPetClient.OrderBy.Distance, petType: selectionString)

		GetYourPetClient.shared.postPetsBySearch(requestBody: request) { (data, error) in
			guard let data = data, error == nil else {
				#warning("Present Error Alert")
				self.enableUI(true)
				return
			}


			self.enableUI(true)
		}
	}

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

	// MARK: - Class Methods
	fileprivate func enableUI(_ enabled: Bool){
		speciesSelector.isEnabled = enabled
		zipCodeTextField.isEnabled = enabled
		distanceSlider.isEnabled = enabled
		searchButton.isEnabled = enabled
		showActivityIndicator(!enabled)
	}

	fileprivate func showActivityIndicator(_ enabled: Bool){
		if enabled {
			// Set up Activity View
			activityView = UIView(frame: view.frame)
			activityView.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(activityView)
			activityView.backgroundColor = UIColor(white: 0, alpha: 0.5)

			// Set up Activity Indicator
			let activityIndicator = UIActivityIndicatorView(style: .large)
			activityIndicator.translatesAutoresizingMaskIntoConstraints = false
			activityView.addSubview(activityIndicator)
			activityIndicator.center = activityView.center
			activityIndicator.startAnimating()

			// Set up constraints
			NSLayoutConstraint.activate([
				activityView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
				activityView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
				activityView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
				activityView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
				activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
				activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
			])
		} else {
			activityView.removeFromSuperview()
			activityView = nil
		}
	}

}

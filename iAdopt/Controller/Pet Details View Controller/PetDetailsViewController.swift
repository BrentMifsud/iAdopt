//
//  PetDetailsViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import MapKit

class PetDetailsViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var petImageCollectionView: UICollectionView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var adoptionDeadlineLabel: UILabel!
	@IBOutlet weak var genderLabel: UILabel!
	@IBOutlet weak var ageLabel: UILabel!
	@IBOutlet weak var sizeLabel: UILabel!
	@IBOutlet weak var activityLabel: UILabel!
	@IBOutlet weak var spayedNeuteredLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var locationMapView: MKMapView!
	@IBOutlet weak var storyTextView: UITextView!
	@IBOutlet weak var goodWithCatsLabel: UILabel!
	@IBOutlet weak var goodWithDogsLabel: UILabel!
	@IBOutlet weak var goodWithChildrenUnder5Label: UILabel!
	@IBOutlet weak var goodWithChildren5to10Label: UILabel!
	@IBOutlet weak var goodWithChildrenOver10Label: UILabel!
	@IBOutlet weak var coatLabel: UILabel!
	@IBOutlet weak var clawsLabel: UILabel!


	// MARK: - Class Properties
	var selectedPet: Pet!
	var petImages: [UIImage]!

	override func viewDidLoad() {
        super.viewDidLoad()
		petImageCollectionView.delegate = self
		petImageCollectionView.dataSource = self
		locationMapView.delegate = self

		setUpView()
    }

	fileprivate func setUpView() {
		mainImageView.image = petImages.first
		nameLabel.text = selectedPet.name
		breedLabel.text = selectedPet.breedDisplay
		adoptionDeadlineLabel.text = selectedPet.adoptionDeadline
		genderLabel.text = selectedPet.gender
		ageLabel.text = String(selectedPet.ageYears)
		sizeLabel.text = selectedPet.size
		activityLabel.text = selectedPet.activityLevel
		spayedNeuteredLabel.text = selectedPet.spayedNeutered ? "Yes" : "No"
		cityLabel.text = selectedPet.city
		stateLabel.text = selectedPet.state
		distanceLabel.text = selectedPet.distanceDisplay
		storyTextView.text = selectedPet.story ?? "See details below..."
		goodWithCatsLabel.text = selectedPet.goodWith?.contains("cats") ?? false ? "Yes" : "No"
		goodWithDogsLabel.text = selectedPet.goodWith?.contains("dogs") ?? false ? "Yes" : "No"
		goodWithChildrenUnder5Label.text = selectedPet.goodWith?.contains("children under 5") ?? false ? "Yes" : "No"
		goodWithChildren5to10Label.text = selectedPet.goodWith?.contains("children 5 to 10") ?? false ? "Yes" : "No"
		goodWithChildrenOver10Label.text = selectedPet.goodWith?.contains("children over") ?? false ? "Yes" : "No"
		coatLabel.text = selectedPet.coat
		clawsLabel.text = selectedPet.claws ?? "No"
	}

}

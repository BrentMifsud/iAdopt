//
//  PetDetailsViewController.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class PetDetailsViewController: UIViewController {

	// MARK: - IBOutlets

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var favoritesButton: UIButton!
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var adoptionDeadlineLabel: UILabel!
	@IBOutlet weak var genderLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var monthLabel: UILabel!
	@IBOutlet weak var sizeLabel: UILabel!
	@IBOutlet weak var activityLabel: UILabel!
	@IBOutlet weak var spayedNeuteredLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var stateLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var storyTextView: UITextView!
	@IBOutlet weak var goodWithCatsLabel: UILabel!
	@IBOutlet weak var goodWithDogsLabel: UILabel!
	@IBOutlet weak var goodWithChildrenUnder5Label: UILabel!
	@IBOutlet weak var goodWithChildren5to10Label: UILabel!
	@IBOutlet weak var goodWithChildrenOver10Label: UILabel!
	@IBOutlet weak var coatLabel: UILabel!
	@IBOutlet weak var clawsLabel: UILabel!
	@IBOutlet weak var nameToCollectionConstraint: NSLayoutConstraint!

	// MARK: - Class Properties

	var pet: Pet!
	var petImages: [UIImage]!

	var petFavorite: PetFavorite?

	var isFavorite: Bool {
		if let _ = petFavorite {
			return true
		} else {
			return false
		}
	}

	// MARK: - View lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()

		setUpCollectionView()

		setUpMapView()

		setUpDetailsView()
    }

	override func viewWillAppear(_ animated: Bool) {
		collectionView.reloadData()
	}


	// MARK: - IBActions

	@IBAction func favoritesButtonPressed(_ sender: UIButton) {
		if isFavorite {
			// It is safe to force unwrap as the isFavorite variable is a computed property that checks if petFavorite is populated.
			PetFavoriteStore.shared.deleteFavorite(usingContext: DataController.shared.viewContext, petFavorite: petFavorite!)
			petFavorite = nil
		} else {
			saveFavorite(petDetails: pet)
		}
		setButtonState()
	}

	/// Takes the user to the adoption page on get your pet website.
	@IBAction func adoptMeButtonPressed(_ sender: UIButton) {
		let app = UIApplication.shared
		if let toOpen = URL(string: pet.profileUrl) {
			app.open(toOpen, options: [:], completionHandler: nil)
		}
	}


	// MARK: - Class methods

	fileprivate func setUpDetailsView() {
		imageView.image = petImages.first

		if let photos = pet.additionalPhotos {
			photos.forEach { (photoUrl) in
				GetYourPetClient.shared.downloadImage(fromUrl: URL(string: photoUrl)!, completion: handleImageDownloads(image:imageUrl:error:))
			}
		} else {
			collectionView.isHidden = true
			nameToCollectionConstraint.constant = -75
		}

		nameLabel.text = pet.name
		setButtonState()
		breedLabel.text = pet.breedDisplay
		adoptionDeadlineLabel.text = trimTimestamp(string: pet.adoptionDeadline) ?? "Unknown Date"
		genderLabel.text = pet.gender
		yearLabel.text = String(pet.ageYears)
		monthLabel.text = String(pet.ageMonths)
		sizeLabel.text = pet.size ?? "n/a"
		activityLabel.text = pet.activityLevel
		spayedNeuteredLabel.text = pet.spayedNeutered ? "Yes" : "No"
		cityLabel.text = pet.city
		stateLabel.text = pet.state
		distanceLabel.text = pet.distanceDisplay
		storyTextView.text = pet.story ?? "My owner has not provided a story. But you can see more about me below."
		goodWithCatsLabel.text = pet.goodWith?.contains("cats") ?? false ? "Yes" : "No"
		goodWithDogsLabel.text = pet.goodWith?.contains("dogs") ?? false ? "Yes" : "No"
		goodWithChildrenUnder5Label.text = pet.goodWith?.contains("children under 5") ?? false ? "Yes" : "No"
		goodWithChildren5to10Label.text = pet.goodWith?.contains("children 5 to 10") ?? false ? "Yes" : "No"
		goodWithChildrenOver10Label.text = pet.goodWith?.contains("children over") ?? false ? "Yes" : "No"
		coatLabel.text = pet.coat
		clawsLabel.text = pet.claws ?? "No"
	}

	fileprivate func handleImageDownloads(image: UIImage?, imageUrl: String?, error: Error?){
		guard let image = image, error == nil else {
			DispatchQueue.main.async {
				let image = UIImage(systemName: "photo")
				self.petImages.append(image!)
			}
			return
		}

		DispatchQueue.main.async {
			self.petImages.append(image)
			self.collectionView.reloadData()
		}

	}

	fileprivate func trimTimestamp(string: String) -> String? {
		guard string.count >= 20 else { return nil }

		let trimmedDate: String.SubSequence = string.prefix(10)

		return String(trimmedDate)
	}

	fileprivate func setButtonState(){
		let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .medium)

		if isFavorite {
			favoritesButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: config)!, for: .normal)
		} else {
			favoritesButton.setImage(UIImage(systemName: "heart", withConfiguration: config)!, for: .normal)
		}
	}
}

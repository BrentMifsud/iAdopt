//
//  PetTableViewCell.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-28.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {

	// MARK: - IBOutlets
	@IBOutlet weak var petImageView: UIImageView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var breedLabel: UILabel!
	@IBOutlet weak var distanceLabel: UILabel!

	// MARK: - Class properties
	var pet: Pet!
	var petFavorite: PetFavorite!


	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


	// MARK: Set Up Cell
	func setUpCell() {
		activityIndicator.startAnimating()

		if let _ = petFavorite {
			setUpByPetFavorite()
			activityIndicator.stopAnimating()
		} else {
			breedLabel.text = pet.breedDisplay
			distanceLabel.text = pet.distanceDisplay
			nameLabel.text = pet.name

			downloadImage()
		}
	}


	// MARK: Set up by Pet Favorite
	fileprivate func setUpByPetFavorite() {
		let decoder = JSONDecoder()

		do {
			let petDetails = try decoder.decode(Pet.self, from: petFavorite.petFavorite!)

			self.pet = petDetails
		} catch {
			fatalError("Cannot populate favorite cell from PetFavorite data.")
		}

		petImageView.image = fetchPersistedPetImage()
		breedLabel.text = pet.breedDisplay
		distanceLabel.text = pet.distanceDisplay
		nameLabel.text = pet.name
	}

	// MARK: Fetch Persisted Pet Image
	fileprivate func fetchPersistedPetImage() -> UIImage {
		let photoFetchedResultsController = PetFavoriteStore.shared.getFetchedResultsControllerForImages(forFavorite: petFavorite, fromContext: DataController.shared.viewContext)

		do {
			try photoFetchedResultsController.performFetch()
		} catch {
			fatalError("Unable to fetch PetImages")
		}

		let fetchedPhotos = photoFetchedResultsController.fetchedObjects

		if let petImages = fetchedPhotos {
			return petImages.map { (petImage) -> UIImage in
				return UIImage(data: petImage.imageData!)!
			}.first ?? UIImage(systemName: "photo")!
		} else {
			return UIImage(systemName: "photo")!
		}
	}


	// MARK: Download image
	fileprivate func downloadImage() {
		GetYourPetClient.shared.downloadImage(fromUrl: URL(string: pet.primaryPhoto)!) { [weak self] (image, url, error) in
			guard let weakSelf = self else { return }

			guard let image = image, error == nil else {
				DispatchQueue.main.async {
					weakSelf.petImageView.image = UIImage(systemName: "photo")
					weakSelf.petImageView.contentMode = .scaleAspectFit
					weakSelf.activityIndicator.stopAnimating()
				}
				return
			}

			DispatchQueue.main.async {
				weakSelf.petImageView.image = image
				weakSelf.activityIndicator.stopAnimating()
			}
		}
	}
}

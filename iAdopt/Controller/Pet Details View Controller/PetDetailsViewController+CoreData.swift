//
//  PetDetailsViewController+CoreData.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

extension PetDetailsViewController {
	func saveFavorite(petDetails: Pet) {
		let petFavorite = PetFavoriteStore.shared.createFavorite(usingContext: DataController.shared.viewContext, pet: petDetails)

		var images: [UIImage] = [imageView.image!]
		images.append(contentsOf: petImages)

		PetFavoriteStore.shared.addImages(images: images, usingContext: DataController.shared.viewContext, toFavorite: petFavorite)
	}
}

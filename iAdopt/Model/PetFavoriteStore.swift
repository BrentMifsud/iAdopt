//
//  PetFavoriteStore.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct PetFavoriteStore: PetFavoriteStoreProtocol{
	static let shared = PetFavoriteStore()

	private init() {

	}

	func createFavorite(usingContext context: NSManagedObjectContext, pet: Pet) -> PetFavorite {

		var petFavorite = PetFavorite(context: context)

		addPetData(pet: pet, toPetFavorite: &petFavorite)

		try? context.save()

		return petFavorite
	}

	func addImages(images: [UIImage], usingContext context: NSManagedObjectContext, toFavorite favorite: PetFavorite) {

		for image in images {
			let petImage = PetImages(context: context)
			petImage.imageData = image.pngData()
			favorite.addToPetImage(petImage)
		}

		try? context.save()
	}

	func getFetchedResultsControllerForFavorites(fromContext context: NSManagedObjectContext) -> NSFetchedResultsController<PetFavorite> {
		let fetchRequest: NSFetchRequest<PetFavorite> = PetFavorite.fetchRequest()

		let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: false)

		fetchRequest.sortDescriptors = [sortDescriptor]

		return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
	}

	func getFetchedResultsControllerForImages(forFavorite favorite: PetFavorite, fromContext context: NSManagedObjectContext) -> NSFetchedResultsController<PetImages> {
		let fetchRequest: NSFetchRequest<PetImages> = PetImages.fetchRequest()

		let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: true)

		let predicate = NSPredicate(format: "petImages == $@", favorite)

		fetchRequest.predicate = predicate
		fetchRequest.sortDescriptors = [sortDescriptor]

		return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
	}

	/// Encode petResult data into a PetFavorite managed object.
	/// - Parameter petFavorite: (By reference) PetFavorite object to be updates.
	/// - Parameter pet: Pet data to be added to favorite.
	fileprivate func addPetData(pet: Pet, toPetFavorite petFavorite: inout PetFavorite) {
		petFavorite.dateAdded = Date()

		let encoder = JSONEncoder()

		do {
			petFavorite.petFavorite = try encoder.encode(pet)
		} catch {
			fatalError("Unable to encode petResult into PetFavorite")
		}
	}
}

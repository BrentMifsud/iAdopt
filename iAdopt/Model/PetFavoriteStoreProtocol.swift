//
//  PetFavoriteStoreProtocol.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/// For saving and accessing persisted favorites.
protocol PetFavoriteStoreProtocol {
	/// Creates a new favorite pet.
	/// - Parameter context: Managed object context.
	/// - Parameter pet: A single pet response item from Get Your Pet API.
	/// - Returns: Favorite Pet.
	func createFavorite(usingContext context: NSManagedObjectContext, pet: Pet) -> PetFavorite

	/// Delete an existing favorite pet.
	/// - Parameter context: Managed object context.
	/// - Parameter petFavorite: Pet Favorite NS Managed Object.
	func deleteFavorite(usingContext context: NSManagedObjectContext, petFavorite: PetFavorite)

	/// Fetch a favorite pet using a Pet type.
	/// - Parameter pet: Get Your Pet pet struct.
	/// - Returns: (Optional) Favorite Pet.
	func fetchFavorite(byPet pet: Pet) -> PetFavorite?

	/// Add images to the specified favorite.
	/// - Parameter images: UIImages to add.
	/// - Parameter context: Managed object context.
	/// - Parameter petFavorite: Pet Favorite NS Managed Object.
	func addImages(images: [UIImage], usingContext context: NSManagedObjectContext, toFavorite petFavorite: PetFavorite)

	/// Retrieve fetched results controller for all favorites.
	/// - Parameter context: Managed object context.
	/// - Returns: NSFetchedResultsController for PetFavorites
	func getFetchedResultsControllerForFavorites(fromContext context: NSManagedObjectContext) -> NSFetchedResultsController<PetFavorite>

	/// Retrieve fetched results controller for images saved to an individual PetFavorite.
	/// - Parameter favorite: Pet Favorite NS Managed Object.
	/// - Parameter context: Managed object context.
	/// - Returns: NSFetchedResultsController for PetImages.
	func getFetchedResultsControllerForImages(forFavorite favorite: PetFavorite, fromContext context: NSManagedObjectContext) -> NSFetchedResultsController<PetImages>
}

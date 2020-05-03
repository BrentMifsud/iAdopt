//
//  FavoritesViewController+CoreData.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import CoreData
import UIKit

extension FavoritesViewController: NSFetchedResultsControllerDelegate {
	// MARK: Controller will change content
	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}

	// MARK: Controller did change content
	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()
	}

	// MARK: Controller did change section
	func controller(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		didChange sectionInfo: NSFetchedResultsSectionInfo,
		atSectionIndex sectionIndex: Int,
		for type: NSFetchedResultsChangeType
	) {
		let indexSet = IndexSet(integer: sectionIndex)
		switch type {
		case .insert: tableView.insertSections(indexSet, with: .fade)
		case .delete: tableView.deleteSections(indexSet, with: .fade)
		case .update, .move:
			fatalError("Invalid change type in controller(_:didChange:atSectionIndex:for:). Only .insert or .delete should be possible.")
		@unknown default:
			break
		}
	}

	// MARK: Controller did change an object at index path
	func controller(
		_ controller: NSFetchedResultsController<NSFetchRequestResult>,
		didChange anObject: Any,
		at indexPath: IndexPath?,
		for type: NSFetchedResultsChangeType,
		newIndexPath: IndexPath?
	) {

		switch type {
		case .insert:
			tableView.insertRows(at: [newIndexPath!], with: .fade)
		case .delete:
			tableView.deleteRows(at: [indexPath!], with: .left)
		case .update:
			tableView.reloadRows(at: [indexPath!], with: .fade)
		case .move:
			tableView.moveRow(at: indexPath!, to: newIndexPath!)
		@unknown default:
			break
		}
	}

	// MARK: - Helper functions
	/// Set up the favorites fetched results controller.
	func setUpFetchedResultsControllers(){
		favoriteFetchedResultsController = PetFavoriteStore.shared.getFetchedResultsControllerForFavorites(
			fromContext: DataController.shared.viewContext)

		favoriteFetchedResultsController.delegate = self
	}
}

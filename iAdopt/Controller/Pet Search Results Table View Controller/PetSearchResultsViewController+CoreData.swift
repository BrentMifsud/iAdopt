//
//  PetSearchResultsViewController+CoreData.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-30.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import CoreData

extension PetSearchResultsViewController: NSFetchedResultsControllerDelegate {

	// MARK: Controller did change content
	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()
	}

	// MARK: Controller will change content
	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}

	// MARK: Did change an object at index path
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {

		switch type {
		case .insert:
			tableView.insertRows(at: [newIndexPath!], with: .fade)
		case .delete:
			tableView.deleteRows(at: [indexPath!], with: .fade)
		case .update:
			tableView.reloadRows(at: [indexPath!], with: .fade)
		case .move:
			tableView.moveRow(at: indexPath!, to: newIndexPath!)
		@unknown default:
			break
		}
	}
}

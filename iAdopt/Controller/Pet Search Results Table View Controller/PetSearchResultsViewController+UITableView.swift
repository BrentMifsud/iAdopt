//
//  PetSearchResultsViewController+UITableView.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-29.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

extension PetSearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let catLabel = "Cats"
		let dogLabel = "Dogs"

		let label = UILabel()
		label.backgroundColor = .secondarySystemFill

		switch sectionCount {
		case 1:
			if catResults.count > 0 {
				label.text = catLabel
			} else {
				label.text = dogLabel
			}
		case 2:
			if section == 0 {
				label.text = catLabel
			} else {
				label.text = dogLabel
			}
		default:
			return UIView()
		}

		return label
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return sectionCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch sectionCount {
		case 1:
			if catResults.count > 0 {
				return catResults.count
			} else {
				return dogResults.count
			}
		case 2:
			if section == 0 {
				return catResults.count
			} else {
				return dogResults.count
			}
		default:
			return 0
		}
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard sectionCount > 0 else {
			return UITableViewCell()
		}

		let petTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PetTableViewCell

		switch sectionCount {
		case 1:
			if catResults.count > 0 {
				petTableViewCell.petDetails = catResults[indexPath.row]
			} else {
				petTableViewCell.petDetails = dogResults[indexPath.row]
			}
		case 2:
			if indexPath.section == 0 {
				petTableViewCell.petDetails = catResults[indexPath.row]
			} else {
				petTableViewCell.petDetails = dogResults[indexPath.row]
			}
		default:
			break
		}

		petTableViewCell.setUpCell()

        return petTableViewCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */
}

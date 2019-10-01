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
	func numberOfSections(in tableView: UITableView) -> Int {
		guard SearchResults.shared.searchResults.count > 0 else {
			return 0
		}

		return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		var rowCount: Int

		switch petType {
			case .cat: rowCount = SearchResults.shared.catResults.count
			case .dog: rowCount = SearchResults.shared.dogResults.count
			default: rowCount = 0
		}

		return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let petTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PetTableViewCell

		switch petType {
			case .cat: petTableViewCell.petDetails = SearchResults.shared.catResults[indexPath.row]
			case .dog: petTableViewCell.petDetails = SearchResults.shared.dogResults[indexPath.row]
			default: break
		}

		petTableViewCell.setUpCell()

        return petTableViewCell
    }

	// The image height of the cell is constrained to 75. This function will always return 75.
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 75
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard !SearchResults.shared.endOfResults else { return }

		switch petType {
			case .cat:
				guard indexPath.row == SearchResults.shared.catResults.count - 3 else { return }
				if SearchResults.shared.petTypeShown == .both{
					fetchMoreListings()
				} else {
					fetchMoreCatListings()
				}
				fetchMoreCatListings()
			case .dog:
				guard indexPath.row == SearchResults.shared.dogResults.count - 3 else { return }
				if SearchResults.shared.petTypeShown == .both{
					fetchMoreListings()
				} else {
					fetchMoreCatListings()
				}
			default: break
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		let petCell = tableView.cellForRow(at: indexPath) as! PetTableViewCell

		performSegue(withIdentifier: "showPetDetailsView", sender: petCell)
	}


	// MARK: - Helper functions

	fileprivate func fetchMoreCatListings() {
		SearchResults.shared.currentPage += 1
		downloadListings(petType: GetYourPetClient.PetType.Cat)
	}

	fileprivate func fetchMoreDogListings() {
		SearchResults.shared.currentPage += 1
		downloadListings(petType: GetYourPetClient.PetType.Dog)
	}

	fileprivate func fetchMoreListings() {
		SearchResults.shared.currentPage += 1
		downloadListings(petType: nil)
	}

	fileprivate func downloadListings(petType: String?){
		let zipCode = SearchResults.shared.zipCode
		let distance = SearchResults.shared.distance
		let currentPage = SearchResults.shared.currentPage

		let request = GetYourPetRequest(
			zipCode: zipCode,
			searchRadiusInMiles: distance,
			pageNumber: currentPage,
			orderBy: GetYourPetClient.OrderBy.Distance,
			petType: petType
		)

		GetYourPetClient.shared.postPetsBySearch(requestBody: request) { [weak self] (responseBody, error) in
			guard let weakSelf = self else { return }

			guard let responseBody = responseBody, error == nil else {
				DispatchQueue.main.async {
					weakSelf.presentErrorAlert(title: "Unable to retrieve adoption listings.", message: "\(error!.localizedDescription)")
				}
				return
			}

			guard responseBody.count != 0 else {
				SearchResults.shared.endOfResults = true
				return
			}

			DispatchQueue.main.async {
				SearchResults.shared.searchResults.append(contentsOf: responseBody)
				weakSelf.tableView.reloadData()
			}
		}
	}
}

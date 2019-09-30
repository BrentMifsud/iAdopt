//
//  SearchResults.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-29.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

/// Singleton class that holds search results.
class SearchResults {

	static let shared = SearchResults()

	var searchResults: [Pet] = []

	var catResults: [Pet] {
		return searchResults.filter { (pet) in
			pet.petType == GetYourPetClient.PetType.Cat
		}
	}

	var dogResults: [Pet] {
		return searchResults.filter { (pet) -> Bool in
			pet.petType == GetYourPetClient.PetType.Dog
		}
	}

	enum PetTypeShown: String {
		case cat = "cat"
		case dog = "dog"
		case both = "both"
	}

	var petTypeShown: PetTypeShown = .cat

	var zipCode: String  = ""

	var distance: UInt = 0

	var endOfResults: Bool = false

	var currentPage: UInt = 1


	private init() {}
	

	func clearResults() {
		searchResults = []
		currentPage = 1
		endOfResults = false
		zipCode = ""
		distance = 0
	}
}

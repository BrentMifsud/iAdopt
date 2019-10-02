//
//  Breed.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-01.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct Breed: Codable {
	let breedId: UInt
	let breedName: String

	enum CodingKeys: String, CodingKey {
		case breedId = "BreedId"
		case breedName = "BreedName"
	}
}

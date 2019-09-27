//
//  GetYourPetRequest.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct GetYourPetRequest: Codable {
	let zipCode: String
	let searchRadiusInMiles: UInt = 10
	let pageNumber: UInt = 1
	let orderBy: String?
	let petType: String?
	let gender: String?
	let ageYearsMin: UInt?
	let ageYearsMax: UInt?
	let activityLevelMin: String?
	let activityLevelMax: String?
	let goodWithChildrenUnder5: String?
	let goodWithChildren5to10: String?
	let goodWithChildrenOver10: String?
	let goodWithCats: String?
	let goodWithDogs: String?
	let sizeMin: String?
	let sizeMax: String?
	let coatShort: String?
	let coatMedium: String?
	let coatLong: String?
	let coatHairless: String?
	let coatWire: String?
	let coatCurly: String?
	let claws: String?
	let newlyAvailable: String?

	enum CodingKeys: String, CodingKey {
		case zipCode = "ZipCode"
		case searchRadiusInMiles = "SearchRadiusInMiles"
		case pageNumber = "PageNumber"
		case orderBy = "OrderBy"
		case petType = "PetType"
		case gender = "Gender"
		case ageYearsMin = "AgeYearsMin"
		case ageYearsMax = "AgeYearsMax"
		case activityLevelMin = "ActivityLevelMin"
		case activityLevelMax = "ActivityLevelMax"
		case goodWithChildrenUnder5 = "GoodWithChildrenUnder5"
		case goodWithChildren5to10 = "GoodWithChildren5to10"
		case goodWithChildrenOver10 = "GoodWithChildrenOver10"
		case goodWithCats = "GoodWithCats"
		case goodWithDogs = "GoodWithDogs"
		case sizeMin = "SizeMin"
		case sizeMax = "SizeMax"
		case coatShort = "CoatShort"
		case coatMedium = "CoatMedium"
		case coatLong = "CoatLong"
		case coatHairless = "CoatHairless"
		case coatWire = "CoatWire"
		case coatCurly = "CoatCurly"
		case claws = "Claws"
		case newlyAvailable = "NewlyAvailable"
	}
}

//
//  GetYourPetRequest.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

//All request fields are included for additional search filtering functionality in the future.
struct GetYourPetRequest: Codable {
	let zipCode: String
	let searchRadiusInMiles: UInt
	let pageNumber: UInt
	let orderBy: String?
	let petType: String?
	let gender: String? = nil
	let ageYearsMin: UInt? = nil
	let ageYearsMax: UInt? = nil
	let activityLevelMin: String? = nil
	let activityLevelMax: String? = nil
	let goodWithChildrenUnder5: String? = nil
	let goodWithChildren5to10: String? = nil
	let goodWithChildrenOver10: String? = nil
	let goodWithCats: String? = nil
	let goodWithDogs: String? = nil
	let sizeMin: String? = nil
	let sizeMax: String? = nil
	let coatShort: String? = nil
	let coatMedium: String? = nil
	let coatLong: String? = nil
	let coatHairless: String? = nil
	let coatWire: String? = nil
	let coatCurly: String? = nil
	let claws: String? = nil
	let newlyAvailable: String? = nil

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

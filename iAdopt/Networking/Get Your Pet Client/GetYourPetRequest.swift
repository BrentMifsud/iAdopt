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
	let searchRadiusInMiles: UInt
	let pageNumber: UInt
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

	init(
		zipCode: String,
		searchRadiusInMiles: UInt,
		pageNumber: UInt,
		orderBy: String? = nil,
		petType: String? = nil,
		gender: String? = nil,
		ageYearsMin: UInt? = nil,
		ageYearsMax: UInt? = nil,
		activityLevelMin: String? = nil,
		activityLevelMax: String? = nil,
		goodWithChildrenUnder5: String? = nil,
		goodWithChildren5to10: String? = nil,
		goodWithChildrenOver10: String? = nil,
		goodWithCats: String? = nil,
		goodWithDogs: String? = nil,
		sizeMin: String? = nil,
		sizeMax: String? = nil,
		coatShort: String? = nil,
		coatMedium: String? = nil,
		coatLong: String? = nil,
		coatHairless: String? = nil,
		coatWire: String? = nil,
		coatCurly: String? = nil,
		claws: String? = nil,
		newlyAvailable: String? = nil
	) {
		self.zipCode = zipCode
		self.searchRadiusInMiles = searchRadiusInMiles
		self.pageNumber = pageNumber
		self.orderBy = orderBy
		self.petType = petType
		self.gender = gender
		self.ageYearsMin = ageYearsMin
		self.ageYearsMax = ageYearsMax
		self.activityLevelMin = activityLevelMin
		self.activityLevelMax = activityLevelMax
		self.goodWithChildrenUnder5 = goodWithChildrenUnder5
		self.goodWithChildren5to10 = goodWithChildren5to10
		self.goodWithChildrenOver10 = goodWithChildrenOver10
		self.goodWithCats = goodWithCats
		self.goodWithDogs = goodWithDogs
		self.sizeMin = sizeMin
		self.sizeMax = sizeMax
		self.coatShort = coatShort
		self.coatMedium = coatMedium
		self.coatLong = coatLong
		self.coatHairless = coatHairless
		self.coatWire = coatWire
		self.coatCurly = coatCurly
		self.claws = claws
		self.newlyAvailable = newlyAvailable
	}










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

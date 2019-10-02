//
//  GetYourPetClient+Constants.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

extension GetYourPetClient {
	/// Constants for populating Get Your Pet API Url and Path.
	enum UrlConstants {
		static let baseUrl = URL(string: "https://getyourpet.com/")
		static let homePageUrl = URL(string: "https://getyourpet.com")
		static let apiPath = "api"
		static let partnerSearchPath = "partnerpetsearch"
	}

	/// Constants for populating Get Your Pet API Header.
	enum Header {
		static let ApiKey = "api-key"
		#warning("Add API Key Here")
		static let ApiValue = ""
	}

	/// Constants for populating Get Your Pet API request body.
	enum ParametersKey {
		static let ZipCode = "ZipCode" // Required
		static let SearchRadiusInMiles = "SearchRadiusInMiles" // Required - [10, 500]
		static let PageNumber = "PageNumber" // Required - [1, 50]
		static let OrderBy = "OrderBy"
		static let PetType = "PetType"
		static let Gender = "Gender"
		static let AgeYearsMin = "AgeYearsMin"
		static let AgeYearsMax = "AgeYearsMax"
		static let ActivityLevelMin = "ActivityLevelMin"
		static let ActivityLevelMax = "ActivityLevelMax"
		static let GoodWithChildrenUnder5 = "GoodWithChildrenUnder5"
		static let GoodWithChildren5to10 = "GoodWithChildren5to10"
		static let GoodWithChildrenOver10 = "GoodWithChildrenOver10"
		static let GoodWithCats = "GoodWithCats"
		static let GoodWithDogs = "GoodWithDogs"
		static let SizeMin = "SizeMin"
		static let SizeMax = "SizeMax"
		static let CoatShort = "CoatShort"
		static let CoatMedium = "CoatMedium"
		static let CoatLong = "CoatLong"
		static let CoatHairless = "CoatHairless"
		static let CoatWire = "CoatWire"
		static let CoatCurly = "CoatCurly"
		static let Claws = "Claws"
		static let NewlyAvailable = "NewlyAvailable"
	}

	// If not provided, default is adoption deadline descending.

	/// Constants for populating OrderBy field.
	enum OrderBy {
		static let AdoptionDeadline = "adoptiondeadline"
		static let Distance = "distance"
	}

	// If not provided, all animal types will show.
	enum PetType {
		static let Cat = "cat"
		static let Dog = "dog"
	}

	// If not provided, Results will not be filtered by Gender.
	/// Constants for populating Gender field.
	enum Gender {
		static let Male = "male"
		static let Female = "Female"
	}

	// TODO: - Add a picker view for age in future release.
	// AgeYearsMin - [ 0, 18 ] - Optional. When provided, the response will contain pets at least the specified number of years old.

	// AgeYearsMax - [ 1, 20 ] - Optional. When provided, the response will contain pets no more than the specified number of years old.

	// Both Min and Max or neither must be provided.
	/// Constants for populating ActivityLevel field.
	enum ActivityLevel {
		static let Low = "low"
		static let Average = "average"
		static let High = "high"
	}

	// "GoodWith" parameters can be submitted together for additional filtering.
	/// Constants for populating GoodWith fields.
	enum GoodWith {
		static let True = "true"
		static let False = "false"
	}

	// SizeMin and Max must be submitted together, or neither.
	/// Constants for populating Size field.
	enum Size {
		static let ExtraSmall = "xs"
		static let Small = "s"
		static let Medium = "m"
		static let Large = "l"
		static let ExtraLarge = "xl"
	}

	// "Coat" parameters can be submitted together for additional filtering.

	/// Constants for populating Coat field.
	enum Coat {
		static let True = "true"
		static let False = "false"
	}

	// Cats only
	/// Constants for populating Claws field.
	enum Claws {
		static let All = "all"
		static let None = "none"
		static let RearOnly = "rearonly"
		static let NoneOrRearOnly = "noneorrearonly"
	}

	// Whether the pet is newly listed or not.

	/// Constants for populating NewlyAvailable field.
	enum NewlyAvailable {
		static let True = "true"
		static let False = "false"
	}
}

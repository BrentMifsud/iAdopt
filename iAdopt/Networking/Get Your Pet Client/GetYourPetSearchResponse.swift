//
//  GetYourPetResponse.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct GetYourPetSearchResponse: Codable {
	let pets: [Pet]
}

struct Pet: Codable {
	let petId: UInt
	let name: String
	let petType: String
	let breeds: [Breed]?
	let breedDisplay: String
	let gender: String
	let spayedNeutered: Bool
	let ageYears: UInt
	let ageMonths: UInt
	let activityLevel: String
	let goodWith: [String]?
	let zipCode: String
	let latitude: Double
	let longitude: Double
	let distance: Double?
	let distanceDisplay: String?
	let city: String
	let state: String
	let adoptionDeadline: String
	let primaryPhoto: String
	let additionalPhotos: [String]?
	let hasVideo: Bool
	let videoType: String?
	let videoUrl: String?
	let newlyAvailable: Bool
	let size: String?
	let coat: String
	let claws: String?
	let story: String
	let profileUrl: String

	enum CodingKeys: String, CodingKey {
		case petId = "PetId"
		case name = "Name"
		case petType = "PetType"
		case breeds = "Breeds"
		case breedDisplay = "BreedsForDisplay"
		case gender = "Gender"
		case spayedNeutered = "SpayedNeutered"
		case ageYears = "AgeYears"
		case ageMonths = "AgeMonths"
		case activityLevel = "ActivityLevel"
		case goodWith = "GoodWith"
		case zipCode = "ZipCode"
		case latitude = "Latitude"
		case longitude = "Longitude"
		case distance = "DistanceInMiles"
		case distanceDisplay = "DistanceInMilesForDisplay"
		case city = "City"
		case state = "State"
		case adoptionDeadline = "AdoptionDeadline"
		case primaryPhoto = "PrimaryPhotoUrl"
		case additionalPhotos = "AdditionalPhotoUrls"
		case hasVideo = "HasVideo"
		case videoType = "VideoContentType"
		case videoUrl = "VideoUrl"
		case newlyAvailable = "NewlyAvailable"
		case size = "Size"
		case coat = "Coat"
		case claws = "Claws"
		case story = "Story"
		case profileUrl = "ProfileUrl"
	}
}

struct Breed: Codable {
	let breedId: UInt
	let breedName: String

	enum CodingKeys: String, CodingKey {
		case breedId = "BreedId"
		case breedName = "BreedName"
	}
}

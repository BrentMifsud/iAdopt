//
//  GetYourPetClient.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct GetYourPetClient: GetYourPetClientProtocol {
	// MARK: - Class Properties
	var httpClient: HttpClientProtocol

	static let shared: GetYourPetClientProtocol = GetYourPetClient(httpClient: HttpClient.shared)

	// MARK: - Class Methods
	private init (httpClient: HttpClientProtocol) {
		self.httpClient = httpClient
	}

	func postPetsBySearch(requestBody: GetYourPetRequest, completion: @escaping (GetYourPetSearchResponse?, Int?, Error?) -> Void) {
		#warning("Not Implemented")
	}

	func getPetsByPetId(petId: Int, distanceFrom zipCode: String?, completion: @escaping (Pet?, Int?, Error?) -> Void) {
		#warning("Not Implemented")
	}

}

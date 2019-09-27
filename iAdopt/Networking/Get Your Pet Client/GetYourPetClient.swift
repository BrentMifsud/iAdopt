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

	func postPetsBySearch(requestBody: GetYourPetRequest, completion: @escaping ([GetYourPetResponse]?, Error?) -> Void) {
		let encoder = JSONEncoder()

		var request: Data!

		do {
			request = try encoder.encode(requestBody)
		} catch {
			DispatchQueue.main.async {
				completion(nil, error)
			}
		}

		let postSession = httpClient.createPostRequest(
			withURL: UrlConstants.baseUrl!,
			andPath: [UrlConstants.apiPath, UrlConstants.partnerSearchPath],
			queryParms: nil,
			headers: [Header.ApiKey : Header.ApiValue],
			requestBody: request
		) { (data, error) in
			guard let data = data, error == nil else {
				DispatchQueue.main.async {
					completion(nil, error)
				}
				return
			}

			let decoder = JSONDecoder()

			do {
				let response = try decoder.decode([GetYourPetResponse].self, from: data)
				DispatchQueue.main.async {
					completion(response, nil)
				}
			} catch {
				DispatchQueue.main.async {
					completion(nil, error)
				}
			}
		}
		postSession.resume()
	}

	func getPetsByPetId(petId: Int, distanceFrom zipCode: String?, completion: @escaping (GetYourPetResponse?, Error?) -> Void) {
		#warning("Not Implemented")
	}
}

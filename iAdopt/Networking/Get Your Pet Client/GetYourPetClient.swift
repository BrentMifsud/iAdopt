//
//  GetYourPetClient.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

/// Implementation of GetYourPetClientProtocol
struct GetYourPetClient: GetYourPetClientProtocol {
	// MARK: - Class Properties
	var httpClient: HttpClientProtocol

	static let shared: GetYourPetClientProtocol = GetYourPetClient(httpClient: HttpClient.shared)

	// MARK: - Class Methods
	private init (httpClient: HttpClientProtocol) {
		self.httpClient = httpClient
	}

	// MARK: - Post Pets By Search
	func postPetsBySearch(requestBody: GetYourPetRequest, completion: @escaping ([Pet]?, Error?) -> Void) {
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
				let response = try decoder.decode([Pet].self, from: data)
				DispatchQueue.main.async {
					completion(response, nil)
				}
			} catch {
				do {
					let errorResponse = try decoder.decode(GetYourPetErrorResponse.self, from: data)
					DispatchQueue.main.async {
						completion(nil, errorResponse)
					}
				} catch {
					DispatchQueue.main.async {
						completion(nil, error)
					}
				}
			}
		}
		postSession.resume()
	}

	// MARK: - Get Pet By PetId
	func getPetByPetId(petId: Int, distanceFrom zipCode: String? = nil, completion: @escaping (Pet?, Error?) -> Void) {
		#warning("Not Implemented")
	}

	func downloadImage(fromUrl url: URL, completion: @escaping (UIImage?, String?, Error?) -> Void) {
		let dataTask = httpClient.createGetRequest(withURL: url, andPath: nil, queryParms: nil, headers: nil) { (data, error) in
			guard let imageData = data, error == nil else {
				DispatchQueue.main.async {
					completion(nil, nil, error)
				}
				return
			}

			guard let image = UIImage(data: imageData) else {
				DispatchQueue.main.async {
					completion(nil, nil, error)
				}
				return
			}

			DispatchQueue.main.async {
				completion(image, url.absoluteString, nil)
			}
		}
		dataTask.resume()
	}
}

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

	// MARK: - Implemented methods
	// MARK: Post Pets By Search
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

	// MARK: Download Image
	
	func downloadImage(fromUrl url: URL, completion: @escaping (UIImage?, String?, Error?) -> Void) {
		let dataTask = httpClient.createGetRequest(withURL: url, andPath: nil, queryParms: nil, headers: nil) { (data, error) in
			guard let imageData = data, error == nil else {
				completion(nil, nil, error)
				return
			}

			/*
			* Occasionally, the image url returned from the API does not contain an image.
			* This is not an error, so we dont want to fail here.
			* This handles those occurances.
			*/
			guard imageData.count > 10000 else {
				completion(nil,nil,nil)
				return
			}

			guard let image = UIImage(data: imageData) else {
				completion(nil, nil, error)
				return
			}

			completion(image, url.absoluteString, nil)
		}
		dataTask.resume()
	}
}

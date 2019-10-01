//
//  GetYourPetClientProtocol.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation
import UIKit

/// Protocol for accessing Get Your Pet Apis.
protocol GetYourPetClientProtocol {
	var httpClient: HttpClientProtocol { get }

	/// Return a list of pets based on get your pet search criteria.
	/// - Parameter searchParameters: Get your pet request body search criteria.
	/// - Parameter completion: Block of code to be executed after this method completes.
	func postPetsBySearch(
		requestBody: GetYourPetRequest,
		completion: @escaping ([Pet]?, Error?) -> Void
	)

	/// Downloads an image by its URL.
	/// - Parameter url: URL for the image.
	/// - Parameter completion: Block of code to be executed after this method completes.
	func downloadImage(fromUrl url: URL, completion: @escaping (UIImage?, String?, Error?) -> Void)
}

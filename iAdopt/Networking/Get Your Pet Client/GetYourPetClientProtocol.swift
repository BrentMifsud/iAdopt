//
//  GetYourPetClientProtocol.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

/// Protocol for accessing Get Your Pet Apis.
protocol GetYourPetClientProtocol {
	var httpClient: HttpClientProtocol { get }

	/// Return a list of pets based on get your pet search criteria.
	/// - Parameter searchParameters: Get your pet request body search criteria.
	/// - Parameter completion: Block of code to be executed after after this method completes.
	func postPetsBySearchParameters<T: Codable>(searchParameters: [String : String], completion: @escaping (T?, Int?, Error?) -> Void)

	/// Return a specific pet by its Id
	/// - Parameter petId: Get your pet Id.
	/// - Parameter completion: Block of code to be executed after after this method completes.
	func getPetsByPetId<T: Codable>(petId: Int, completion: @escaping (T?, Int? , Error?) -> Void)
}

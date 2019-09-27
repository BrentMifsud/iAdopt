//
//  GetYourPetErrorResponse.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-27.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct GetYourPetErrorResponse: Codable {
	let errorMessages: [String]

	enum CodingKeys: String, CodingKey {
		case errorMessages = "ErrorMessages"
	}
}

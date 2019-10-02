//
//  HTTPError.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-10-02.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

/// HTTP Error struct.
struct HTTPError: LocalizedError {
	let errorCode: Int!
	private var message: String! {
		switch String(errorCode).first {
		case "2":
			break
		case "4":
			return "Invalid request sent to server. Please contact iAdopt support."
		case "5":
			return "Get Your Pet Internal Server Error. Please try again later."
		default:
			return "An Unknown error has occured."
		}
		return ""
	}

	var errorDescription: String? {
		return """
		Status Code: \(String(describing: errorCode!))
		Message: \(String(describing: message!))
		"""
	}

	init(errorCode: Int) {
		self.errorCode = errorCode
	}
}

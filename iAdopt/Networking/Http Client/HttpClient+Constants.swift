//
//  HttpClient+Constants.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

extension HttpClient {
	enum HTTPMethods {
		static let GET = "GET"
		static let POST = "POST"
	}

	enum HeaderKeys {
		static let ContentType = "Content-Type"
		static let Accept = "Accept"
	}

	enum HeaderValues {
		static let ContentType = "application/json"
		static let Accept = "application/json"
	}
}

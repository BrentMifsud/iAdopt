//
//  HttpClient.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

struct HttpClient: HttpClientProtocol {
	var urlSession: URLSession

	static let shared: HttpClientProtocol = HttpClient(urlSession: URLSession.shared)

	private init(urlSession: URLSession) {
		self.urlSession = URLSession.shared
	}

	func createGetRequest<T: Codable>(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		completion: @escaping (T?, Int?, Error?) -> Void
	) -> URLSessionDataTask {
		print("enter HttpClient -> createGetRequest")
		preconditionFailure("Not yet implemented")
	}

	func createPostRequest<I: Codable, O: Codable>(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		requestBody: I,
		completion: @escaping (O?, Int?, Error?) -> Void
	) -> URLSessionDataTask {
		print("enter HttpClient -> createPostRequest")
		preconditionFailure("Not yet implemented")
	}
}

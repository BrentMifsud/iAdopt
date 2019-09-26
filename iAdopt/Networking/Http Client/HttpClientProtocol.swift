//
//  HttpClientProtocol.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

/// HTTP Client protocol. Simplifies the creation of new HTTP Clients.
protocol HttpClientProtocol {
	var urlSession: URLSession { get }

	/// Construct an HTTP GET request.
	/// - Parameters:
	/// 	- baseUrl: the base URL for the request.
	/// 	- pathComponents: any additional path resources.
	/// 	- queryParms: url query parameters to be included.
	/// 	- headers: HTTP header values.
	/// 	- completion: code that will be executed after this function is called.
	/// - Returns: A  URLSessionDataTask that is ready to be run.
	func createGetRequest(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		completion: @escaping (Data?, Error?) -> Void
	) -> URLSessionDataTask

	/// Construct a HTTP Post request.
	/// - Parameters:
	/// 	- baseUrl: the base URL for the request.
	/// 	- pathComponents: any additional path resources.
	/// 	- queryParms: url query parameters to be included.
	/// 	- headers: HTTP header values.
	/// 	- requestBody: Request object that conforms to the codable protocol.
	/// 	- completion: code that will be executed after this function is called.
	/// - Returns: A  URLSessionDataTask that is ready to be run.
	func createPostRequest<T: Codable>(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		requestBody: T,
		completion: @escaping (Data?, Error?) -> Void
	) -> URLSessionDataTask
}

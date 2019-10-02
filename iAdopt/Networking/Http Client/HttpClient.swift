//
//  HttpClient.swift
//  iAdopt
//
//  Created by Brent Mifsud on 2019-09-26.
//  Copyright © 2019 Brent Mifsud. All rights reserved.
//

import Foundation

/// Implementation of Http Protocol.
struct HttpClient: HttpClientProtocol {
	// MARK: - Class Properties
	var urlSession: URLSession

	static let shared: HttpClientProtocol = HttpClient(urlSession: URLSession.shared)

	private init(urlSession: URLSession) {
		self.urlSession = URLSession.shared
	}

	// MARK: - Implemented Methods

	// MARK: Create GET Request
	func createGetRequest(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		completion: @escaping (Data?, Error?) -> Void
	) -> URLSessionDataTask {
		var urlComponents = buildURLComponents(pathComponents, baseUrl)

		appendQueryParms(queryParms, toUrlComponents: &urlComponents)

		// Create Request.
		var urlRequest = URLRequest(url: urlComponents.url!)

		// Set HTTP Method.
		urlRequest.httpMethod = HTTPMethods.GET

		applyHeaders(headers: headers, toRequest: &urlRequest)

		return urlSession.dataTask(with: urlRequest) { (data, response, error) in
			guard let data = data, error == nil else {
				completion(nil, error)
				return
			}

			completion(data, nil)
		}
	}

	// MARK: Create POST Request
	func createPostRequest(
		withURL baseUrl: URL,
		andPath pathComponents: [String]?,
		queryParms: [String : String]?,
		headers: [String : String]?,
		requestBody: Data,
		completion: @escaping (Data?, Error?) -> Void
	) -> URLSessionDataTask {
		var urlComponents = buildURLComponents(pathComponents, baseUrl)

		appendQueryParms(queryParms, toUrlComponents: &urlComponents)

		// Create Request.
		var urlRequest = URLRequest(url: urlComponents.url!)

		// Set HTTP Method.
		urlRequest.httpMethod = HTTPMethods.POST

		applyHeaders(headers: headers, toRequest: &urlRequest)

		urlRequest.httpBody = requestBody

		return urlSession.dataTask(with: urlRequest) { (data, response, error) in
			guard let data = data, error == nil else {
				completion(nil, error)
				return
			}

			if let response = response as! HTTPURLResponse? {
				let statusCode = String(response.statusCode)
				if statusCode.first != "2" {
					completion(data, HTTPError(errorCode: response.statusCode))
				}
			}


			completion(data, nil)
		}

	}


	// MARK: - Helper Functions

	/// Appends path components to base URL and returns a URLComponents object..
	/// - Parameter pathComponents: path components to be added.
	/// - Parameter baseUrl: base url without path components.
	fileprivate func buildURLComponents(_ pathComponents: [String]?, _ baseUrl: URL) -> URLComponents {
		var fullUrl = baseUrl

		if let pathComponents = pathComponents {
			for path in pathComponents {
				fullUrl = fullUrl.appendingPathComponent(path)
			}
		}

		// Convert URL to URLComponents
		guard let urlComponents = URLComponents(url: fullUrl, resolvingAgainstBaseURL: false) else {
			fatalError("Invalid URL: \(fullUrl)")
		}

		return urlComponents
	}

	/// Append Query Parms to the provided urlComponents.
	/// - Parameter queryParms: query parms to be added.
	/// - Parameter urlComponents: url components to have query parms added.
	fileprivate func appendQueryParms(
		_ queryParms: [String : String]?,
		toUrlComponents urlComponents: inout URLComponents
	) {
		// Append Query Parms
		if let queryParms = queryParms {
			urlComponents.queryItems = queryParms.map { key, value in
				URLQueryItem(name: key, value: value)
			}
		}
	}

	/// Apply given headers to the provided url request.
	/// - Parameter headers: headers to apply to request.
	/// - Parameter urlRequest: url request in which we want to add headers to.
	fileprivate func applyHeaders(headers: [String : String]?, toRequest urlRequest: inout URLRequest) {

		if let headers = headers {
			urlRequest.addValue(HeaderValues.ContentType, forHTTPHeaderField: HeaderKeys.ContentType)
			urlRequest.addValue(HeaderValues.Accept, forHTTPHeaderField: HeaderKeys.Accept)

			headers.forEach { key, value in
				urlRequest.addValue(value, forHTTPHeaderField: key)
			}
		} else {
			urlRequest.addValue(HeaderValues.ContentType, forHTTPHeaderField: HeaderKeys.ContentType)
			urlRequest.addValue(HeaderValues.Accept, forHTTPHeaderField: HeaderKeys.Accept)
		}
	}

}

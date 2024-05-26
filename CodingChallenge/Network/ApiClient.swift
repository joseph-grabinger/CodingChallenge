//
//  ApiClient.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation
import Combine

class ApiClient: ApiProtocol {
	static let shared = ApiClient()

	private init() {}

	func fetchPhotos(completion: @escaping(Result<[Photo], ApiError>) -> Void) {
		guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
			completion(Result.failure(ApiError.badUrl))
			return
		}
        
		let task = URLSession.shared.dataTask(with: url) {(data, response, error) in

			if let error = error as? URLError {
				completion(Result.failure(ApiError.url(error)))

			} else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
				completion(Result.failure(ApiError.badResponse(statusCode: response.statusCode)))

			} else if let data = data {
				do {
					let photos = try JSONDecoder().decode([Photo].self, from: data)
					completion(Result.success(photos))
				} catch {
					completion(Result.failure(ApiError.parsing(error as? DecodingError)))
				}


			}
		}

		task.resume()
	}
}

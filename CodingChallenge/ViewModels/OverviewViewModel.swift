//
//  OverviewViewModel.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation
import Combine

class OverviewViewModel: ObservableObject {

	@Published var photos = [Photo]()
	@Published var isLoading: Bool = false
	@Published var errorMessage: String? = nil

	let client: ApiProtocol

	init(client: ApiProtocol = ApiClient.shared) {
		self.client = client
		self.fetchAllPhotos()
	}

	func fetchAllPhotos() {

		isLoading = true
		errorMessage = nil

		client.fetchPhotos() { [unowned self] result in

			DispatchQueue.main.async {

				self.isLoading = false
				switch result {
				case .failure(let error):
					self.errorMessage = error.localizedDescription
					print(error)
				case .success(let photos):
					self.photos = photos
				}
			}
		}
	}
}

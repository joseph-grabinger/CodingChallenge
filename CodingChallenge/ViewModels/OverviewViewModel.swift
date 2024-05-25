//
//  OverviewViewModel.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation
import Combine

class OverviewViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    private var cancellables = Set<AnyCancellable>()
    
    func getPhotos() {
        ApiClient.shared.fetchPhotos()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching photos: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellables)
    }
}

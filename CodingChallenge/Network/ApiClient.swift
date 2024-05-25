//
//  ApiClient.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation
import Combine

class ApiClient {
    static let shared = ApiClient()
    
    private init() {}
    
    func fetchPhotos() -> AnyPublisher<[Photo], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

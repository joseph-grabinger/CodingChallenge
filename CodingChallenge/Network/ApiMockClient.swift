//
//  ApiMockClient.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 27.05.24.
//

import Foundation

struct ApiMockClient: ApiProtocol {
    
    var result: Result<[Photo], ApiError>
    
    func fetchPhotos(completion: @escaping (Result<[Photo], ApiError>) -> Void) {
        completion(result)
    }
}

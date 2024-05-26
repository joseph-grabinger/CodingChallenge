//
//  ApiProtocol.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 26.05.24.
//

import Foundation

protocol ApiProtocol {
	func fetchPhotos(completion: @escaping(Result<[Photo], ApiError>) -> Void)
}

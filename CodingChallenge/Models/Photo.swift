//
//  Photo.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation

struct Photo: Decodable, Identifiable {
    typealias Identifier = Int

    let id: Identifier
    let title: String
    let url: String
    let thumbnailUrl: String
    let albumId: Int
}

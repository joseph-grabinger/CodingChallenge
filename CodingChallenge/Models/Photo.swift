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
    
    static func example() -> Photo {
        return Photo(
            id: 1,
            title: "accusamus beatae ad facilis cum similique qui sunt",
            url: "https://via.placeholder.com/600/92c952",
            thumbnailUrl: "https://via.placeholder.com/150/92c952",
            albumId: 1
        )
    }
}

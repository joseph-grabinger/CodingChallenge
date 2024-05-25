//
//  DetailViewModel.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
}

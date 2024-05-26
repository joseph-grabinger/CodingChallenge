//
//  OverviewView.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import SwiftUI

struct OverviewView: View {
    @StateObject private var viewModel = OverviewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.photos) { photo in
                NavigationLink(destination: DetailView(viewModel: DetailViewModel(photo: photo))) {
                    HStack {
                        AsyncImageView(url: photo.thumbnailUrl)
                        Text(photo.title)
                    }
                }
            }
            .navigationTitle("Overview")
        }
    }
}

#Preview {
    OverviewView()
}

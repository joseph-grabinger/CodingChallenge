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
                        AsyncImageView(
                            url: URL(string: photo.thumbnailUrl),
                            size: CGSize(width: 50, height: 50)
                        )
                        Text(photo.title)
                    }
                }
            }
            .navigationTitle("Overview")
            .onAppear() {
                viewModel.getPhotos()
            }
        }
    }
}

#Preview {
    OverviewView()
}

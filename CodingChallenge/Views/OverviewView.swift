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
                        AsyncImage(
                            url: URL(string: photo.thumbnailUrl),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 50, maxHeight: 50)
                            },
                            placeholder: {
                                ProgressView().progressViewStyle(.circular)
                           }
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

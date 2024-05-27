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
        
        if viewModel.isLoading {
            VStack(spacing: 20)  {
                ProgressView()
                Text("Getting the photos ...")
                    .foregroundColor(.gray)
            }
        } else if viewModel.errorMessage != nil {
            VStack {
                Text(viewModel.errorMessage ?? "")
                
                Button {
                    viewModel.fetchAllPhotos()
                } label: {
                    Text("Try again")
                }
            }
        } else {
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
}

#Preview {
    OverviewView()
}

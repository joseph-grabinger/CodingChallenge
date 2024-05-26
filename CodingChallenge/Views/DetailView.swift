//
//  DetailView.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            AsyncImageView(
                url: viewModel.photo.url,
                imageSize: 600,
                cacheImage: false
            )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack (alignment: .top) {
                    Text("Title: ")
                        .foregroundColor(.gray)
                    Text(viewModel.photo.title)
                        .lineLimit(nil)
                }
                
                HStack {
                    Text("Album No.: ")
                        .foregroundColor(.gray)
                    Text("\(viewModel.photo.albumId)")
                        .lineLimit(nil)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.photo.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

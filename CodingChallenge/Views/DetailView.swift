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
                url: URL(string: viewModel.photo.url),
                size: CGSize(width: 600, height: 600)
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

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
        VStack() {
            AsyncImageView(
                url: URL(string: viewModel.photo.url),
                size: CGSize(width: 600, height: 600)
            )
            
            Text(viewModel.photo.title)
                .padding(.bottom)
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.photo.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

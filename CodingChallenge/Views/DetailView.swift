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
        VStack(alignment: .leading) {
            AsyncImage(
                url: URL(string: viewModel.photo.url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 600, maxHeight: 600)
                },
                placeholder: {
                    ProgressView().progressViewStyle(.circular)
               }
            )
            
            Text(viewModel.photo.title)
                .font(.largeTitle)
                .padding(.bottom)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
    }
}

//
//  AsyncImageView.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let size: CGSize
        
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure(let error):
                let _ = print("AsyncImageError: \(error)")
                Image(systemName: "exclamationmark.triangle")
                    .padding()
                    .foregroundStyle(.tint)
            @unknown default:
                fatalError()
            }
        }
        .frame(width: size.height, height: size.width)
    }
}

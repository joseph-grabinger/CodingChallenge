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
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.height, height: size.width)
            },
            placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: size.width, height: size.height)
           }
        )
    }
}

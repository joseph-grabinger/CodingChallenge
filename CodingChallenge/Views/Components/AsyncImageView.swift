//
//  AsyncImageView.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 25.05.24.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject var imageLoader: ImageLoader
    let imageSize: CGFloat
    
    init(url: String?, imageSize: CGFloat = 50, cacheImage: Bool = true) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url, useCacheData: cacheImage))
        self.imageSize = imageSize
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()
                
            } else if imageLoader.errorMessage != nil {
                Text(imageLoader.errorMessage!)
                    .foregroundColor(Color.orange)
                    .frame(width: imageSize, height: imageSize)
                
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
                
            }
        }
        .onAppear {
            imageLoader.fetch()
        }
        .onDisappear {
            imageLoader.cancel()
        }
    }
}

#Preview {
    AsyncImageView(url: nil)
}


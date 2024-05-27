//
//  ImageLoader.swift
//  CodingChallenge
//
//  Created by Joseph Grabinger on 26.05.24.
//

import SwiftUI


class ImageLoader: ObservableObject {

    private let url: String?
    private let cacheAndDontCancel: Bool
    private var cancellable: URLSessionDataTask?

    @Published var image: UIImage? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    init(url: String?, useCacheData: Bool = true) {
        self.url = url
        self.cacheAndDontCancel = useCacheData
    }
    
    func fetch() {
        guard image == nil && !isLoading else {
            print("ImageLoader has image!")
            return
        }
        
        guard let url = url, let fetchURL = URL(string: url) else {
            errorMessage = ApiError.badUrl.localizedDescription
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let request = URLRequest(
            url: fetchURL,
            cachePolicy: cacheAndDontCancel ? .returnCacheDataElseLoad : .reloadIgnoringLocalAndRemoteCacheData
        )
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self?.errorMessage = ApiError.badResponse(statusCode: response.statusCode).localizedDescription
                } else if let data = data, let image = UIImage(data: data) {
                    print(data)
                    self?.image = image
                } else {
                    self?.errorMessage = ApiError.unknown.localizedDescription
                }

            }
        }
        
        task.resume()
        cancellable = task
    }
    
    func cancel() {
        if (!cacheAndDontCancel) {
            cancellable?.cancel()
            cancellable = nil
        }
   }
}

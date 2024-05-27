//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Joseph Grabinger on 25.05.24.
//

import XCTest
import Combine
@testable import CodingChallenge

final class CodingChallengeTests: XCTestCase {

    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()

    func test_fetch_photos_success() {
        let result = Result<[Photo], ApiError>.success([Photo.example()])

        let fetcher = OverviewViewModel(client: ApiMockClient(result: result))

        let promise = expectation(description: "getting photos")

        fetcher.$photos.sink { photos in
            if photos.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        wait(for: [promise], timeout: 2)
    }
    
    func test_fetch_photos_error() {
        let result = Result<[Photo], ApiError>.failure(ApiError.badUrl)
        let fetcher = OverviewViewModel(client: ApiMockClient(result: result))

        let promise = expectation(description: "show error message")
        fetcher.$photos.sink { photos in
            if !photos.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }

}

//
//  ContentViewModel.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 15/03/2023.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var content: [TweetModel] = []
    @Published var error: RequestError? = nil
    
    private let requester = HTTPRequester.shared
    private var fetchCancellables = Set<AnyCancellable>()
    
    func fetchContent() {
        let url = URL(string: "https://raw.githubusercontent.com/AveMonti/Twitter-SwiftUI/main/TwitterTest/Resources/twitterData.json")!
        requester.request(url: url)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.error = error
                case .finished:
                    self.error = nil
                }
            } receiveValue: { content in
                self.content = content
            }
            .store(in: &fetchCancellables)
    }
    
}

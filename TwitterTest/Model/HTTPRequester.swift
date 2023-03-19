//
//  HTTPRequester.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 15/03/2023.
//

import Foundation
import Combine

enum RequestError: Error {
    case invalidURL
    case invalidResponse
    case networkError(Error)
    case decodingError(Error)
}

class HTTPRequester {
    
    private let session = URLSession.shared
    
    private init() {}
    
    static let shared = HTTPRequester()
    
    func request<T: Decodable>(url: URL, method: String = "GET", parameters: [String: String] = [:], headers: [String: String] = [:]) -> AnyPublisher<T, RequestError> {
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return Fail(error: RequestError.invalidURL).eraseToAnyPublisher()
        }
        
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let requestURL = urlComponents.url else {
            return Fail(error: RequestError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw RequestError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? DecodingError {
                    return RequestError.decodingError(error)
                } else {
                    return RequestError.networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}



/*
 
 let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
 HTTPRequester.shared.request(url: url)
     .sink(receiveCompletion: { completion in
         switch completion {
         case .failure(let error):
             print("Error: \(error)")
         case .finished:
             break
         }
     }, receiveValue: { response in
         print("Response: \(response)")
     })
     .store(in: &cancellables)
 
 */


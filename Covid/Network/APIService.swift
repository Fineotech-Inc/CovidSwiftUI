//
//  APIService.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation
import Combine

struct APIService {
    
    private let urlSession: URLSession
    private var logger: NetworkLogger = NetworkLogger()
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        logger = NetworkLogger(logFileName: "com.covid.api.log")

    }
    
    struct Response<T> {
        let value: T // Parse Value
        let response: URLResponse // URL Response
    }
    
    func run<T: Decodable>(_ request: Requestable, _ decoder: JSONDecoder = JSONDecoder()) ->AnyPublisher<Response<T>, NetworkError> {
        self.logger.log(request: request.urlRequest)
        return self.urlSession.dataTaskPublisher(for: request.urlRequest)
            .tryMap { result -> Response<T> in
                // Logging the response data
                self.logger.log(response: result.response as? HTTPURLResponse, data: result.data)
                // handle various Error scenarios
                guard let response = result.response as? HTTPURLResponse else {
                    throw NetworkError.restAPIError(data: nil)
                }
                guard response.isSuccessful else {
                    throw NetworkError.restAPIError(data: result.data)
                }
                let value = try result.data.decoded() as T
                return Response(value: value, response: response)
        }.mapError { error in
            self.logger.logError(error: error)
            if let error = error as? NetworkError {
                return error
            } else {
                return .networkError(error)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970

      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
          .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Internals
extension HTTPURLResponse {
    
    var isSuccessful: Bool {
        return 200 ... 299 ~= statusCode
    }

}


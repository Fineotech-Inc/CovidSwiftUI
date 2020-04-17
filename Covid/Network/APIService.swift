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
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    struct Response<T> {
        let value: T // Parse Value
        let response: URLResponse // URL Response
    }
    
    func run<T: Decodable>(_ request: Requestable, _ decoder: JSONDecoder = JSONDecoder()) ->AnyPublisher<Response<T>, Error> {
        return self.urlSession.dataTaskPublisher(for: request.urlRequest)
            .tryMap { result -> Response<T> in
                let value = try result.data.decoded() as T
                return Response(value: value, response: result.response)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

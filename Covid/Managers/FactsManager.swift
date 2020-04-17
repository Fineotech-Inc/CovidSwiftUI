//
//  FactManager.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation
import Combine

protocol FactsManagerProtocol {
    
    func fetchFacts() -> AnyPublisher<FactsModel, Error>
}


final class FactsManager: FactsManagerProtocol {
    
    func fetchFacts() -> AnyPublisher<FactsModel, Error> {
        let factRequest = FactRequest()
        // Need to check how to pass APIService to all Managers
        return APIService().run(factRequest)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

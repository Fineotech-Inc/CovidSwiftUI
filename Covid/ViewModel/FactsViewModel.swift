//
//  FactViewModel.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation

struct FactsViewModel: ManagerInjected {
    
    func fetchFacts() {
        let facts = factsManager.fetchFacts()
            .print().sink(receiveCompletion: { _ in }, receiveValue: { print($0)})
    }
}

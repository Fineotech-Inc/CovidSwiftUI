//
//  FactViewModel.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Combine
import Foundation

final class FactsViewModel: ManagerInjected, ViewModel {
    
    @Published
    private(set) var state: FactsState = FactsState(facts: FactsModel())
    // Call FetchFacts on On Appear
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    

    
    func fetchFacts() {
        let facts = factsManager.fetchFacts()
            .mapError { error -> NetworkError in
                error
            }.sink(receiveCompletion: { _ in
                print("Error")
            }, receiveValue: { factsModel in
                self.state = FactsState(facts: factsModel)
            })
        cancellables += [facts]
    }
    

//
//    private func bindOutputs() {
//
//    }
    
    func trigger(_ input: FactsInput) {
        switch input {
            case .onAppear:
                fetchFacts()
        }
    }
}

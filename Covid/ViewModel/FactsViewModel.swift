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
            }.sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // no associdate data, but you can react to knowing the requess have been completed
                    break
                case .failure(let error):
                    print("received the error", error)
                }
            }, receiveValue: { factsModel in
                // do what you want with the resulting value passed down
                // be aware that depending on the publisher, this closure
                // may be invoked multiple times.
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

//
//  CountriesViewModel.swift
//  Covid
//
//  Created by smitesh patel on 2020-05-14.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation
import Combine

final class CountriesViewModel: ViewModel, ManagerInjected {
    
    @Published
    var state: CountryListState = CountryListState(countries: [])
    private var cancellables: [AnyCancellable] = []
    
    func fetchCountries() {
        let countries = factsManager.fetchCountries()
            .mapError { error -> NetworkError in
                error
            }.sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // no associdate data, but you can react to knowing the request have been completed
                    break
                case .failure(let error):
                    print("received the error", error)
                }
            }, receiveValue: { countries in
                // do what you want with the resulting value passed down
                // be aware that depending on the publisher, this closure
                // may be invoked multiple times.
                self.state = CountryListState(countries: countries)
            })
        cancellables += [countries]
    }
    
    func trigger(_ input: CountryListInput) {
        switch input {
            case .onAppear:
                fetchCountries()
        }
    }
}

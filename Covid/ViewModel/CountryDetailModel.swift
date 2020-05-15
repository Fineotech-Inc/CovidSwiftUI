//
//  CountryDetailModel.swift
//  Covid
//
//  Created by smitesh patel on 2020-05-15.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation

final class CountryDetailModel: ViewModel {
    
    @Published
    var state: CountryDetailState
    
    private let country: Country
    init(country: Country) {
        self.state = CountryDetailState(country: country)
        self.country = country
    }
    
    func trigger(_ input: Never) {

    }
}

extension CountryDetailModel {
    
    var countryName: String {
        return state.country?.country ?? ""
    }
}

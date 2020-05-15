//
//  CaseDetails.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct CountryDetailState {
    
    var country: Country?
}


struct CountryDetails: View {
    
    @EnvironmentObject
    var viewModel: AnyViewModel<CountryDetailState, Never>
    
    var body: some View {
        Text(viewModel.country?.country ?? "").navigationBarTitle(Text(viewModel.country?.country ?? ""))
    }
}

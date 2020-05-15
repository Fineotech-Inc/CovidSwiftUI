//
//  Countries.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct CountryListState {
    var countries: [Country]
}

// MARK: Input
enum CountryListInput {
    case onAppear
}

struct CountriesView: View {
    @EnvironmentObject
    var viewModel: AnyViewModel<CountryListState, CountryListInput>
    var body: some View {
        NavigationView {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetails(country: country)) {
                    CountryCell(country: country)
                }
            }.navigationBarTitle(Text("Countries"), displayMode: .inline)
            .onAppear(perform: { self.viewModel.trigger(.onAppear)})
        }

    }
}

struct CountryCell: View {
    var country: Country
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(country.country)").font(.title)
            Text("\(country.infoText)").font(.caption)
        }.background(Color("bgColor"))
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("textColor")/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}

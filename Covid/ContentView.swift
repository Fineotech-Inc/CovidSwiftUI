//
//  ContentView.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selectedTab: Tab = .global
    
    //let facts = FactsModel(cases: 1924635, deaths: 119686, recovered: 444836)
    let viewModel = AnyViewModel(FactsViewModel())
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                GlobalView().environmentObject(viewModel).tabItem {
                    Text("Global")
                    Image(systemName: "globe")
                }.tag(Tab.global)
            }
            NavigationView {
            CountriesView(countries: []).tabItem {
                Text("Countries")
                Image(systemName: "list.dash")
            }.tag(Tab.countries)
            }
            
            AboutView().tabItem {
                Text("Countries")
                Image(systemName: "list.dash")
            }.tag(Tab.about)
        }
    }
}

private extension ContentView {
    
    enum Tab: Int {
        case global
        case countries
        case about
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

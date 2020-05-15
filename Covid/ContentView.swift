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
    
    let viewModel = AnyViewModel(FactsViewModel())
    let countriesviewModel = AnyViewModel(CountriesViewModel())
    var body: some View {
        TabView(selection: $selectedTab) {
                GlobalView().environmentObject(viewModel).tabItem {
                    Text("Global")
                    Image(systemName: "globe")
                }.tag(Tab.global)

                CountriesView().environmentObject(countriesviewModel).tabItem {
                    Text("Countries")
                    Image(systemName: "list.dash")
                }.tag(Tab.countries)
            
            
                AboutView().tabItem {
                    Text("About")
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

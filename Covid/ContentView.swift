//
//  ContentView.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            GlobalView().tabItem {
                Text("Global")
                Image(systemName: "globe")
            }.tag(1)
            Countries().tabItem {
                Text("Countries")
                Image(systemName: "list.dash")
            }.tag(2)
            AboutView().tabItem {
                Text("Countries")
                Image(systemName: "a.cirlce")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

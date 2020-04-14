//
//  GlobalView.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct GlobalView: View {
    
    var factsModel: FactsModel
    
    var body: some View {
        VStack(spacing: 15) {
            if factsModel.cases > 0 {
                InfoView(numOfCases: factsModel.cases, subtitle: "Cases")
            }
            if factsModel.deaths > 0 {
                InfoView(numOfCases: factsModel.deaths, subtitle: "Deaths")
            }
            if factsModel.recovered > 0 {
                InfoView(numOfCases: factsModel.recovered, subtitle: "Recovered")
            }
            Spacer()
        }.background(Color.green)
        .navigationBarTitle(Text("Global"), displayMode: .inline)
    }
}

struct InfoView: View {
    
    var numOfCases: Int
    var subtitle: String
    var body: some View {
        VStack {
            Text("\(numOfCases)").font(.title)
            Text("\(subtitle)").font(.caption).foregroundColor(.accentColor)
        }
    }
}


struct GlobalView_Previews: PreviewProvider {
    static let facts = FactsModel(cases: 1924635, deaths: 119686, recovered: 444836)
    static var previews: some View {
        GlobalView(factsModel: facts)
    }
}

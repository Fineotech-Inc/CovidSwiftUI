//
//  GlobalView.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct FactsState {
    var facts: FactsModel?
}

// MARK: Input
enum FactsInput {
    case onAppear
}


struct GlobalView: View {
    // Make is local object instaed of ENV
    @EnvironmentObject
    private var viewModel: AnyViewModel<FactsState, FactsInput>
    
    var body: some View {
        VStack(spacing: 15) {
            if viewModel.facts?.cases ?? 0 > 0 {
                InfoView(numOfCases: viewModel.facts?.cases ?? 0, subtitle: "Cases")
            }
            if viewModel.facts?.deaths ?? 0 > 0 {
                InfoView(numOfCases: viewModel.facts?.deaths ?? 0, subtitle: "Deaths")
            }
            if viewModel.facts?.recovered ?? 0 > 0 {
                InfoView(numOfCases: viewModel.facts?.recovered ?? 0, subtitle: "Recovered")
            }
            Spacer()
        }.background(Color.green)
        .navigationBarTitle(Text("Global"), displayMode: .inline)
        .onAppear(perform: { self.viewModel.trigger(.onAppear)})
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
    static var previews: some View {
        GlobalView()
    }
}

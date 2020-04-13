//
//  GlobalView.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct GlobalView: View {
    var body: some View {
        List {
            VStack {
                Text("Global")
                Text("CoronaVirus Cases")
                Text("150,052")
            }
        }.navigationBarTitle(Text("Quick Facts"))
    }
}


struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}

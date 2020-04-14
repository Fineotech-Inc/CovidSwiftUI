//
//  CaseDetails.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import SwiftUI

struct CountryDetails: View {
    var country: Country
    
    var body: some View {
        Text(country.country).navigationBarTitle(Text(country.country))
    }
}

struct CaseDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        CountryDetails(country: testData[0])
    }
}

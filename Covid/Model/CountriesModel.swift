//
//  CountriesModel.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation
struct Country:Identifiable {
    var id = UUID()
    var country: String
    var cases: Int
    var todaysCases: Int
    var deaths: Int
    var todayDeaths: Int
    var recoverd: Int
    var active: Int
    var critical: Int
    var casesPerOneMillion: Int
    var deathsPerOneMillion: Int
    var totalTest: Int
    var testsPerOneMillion: Int
}


extension Country {
    
    var infoText: String {
        let countryMirror = Mirror(reflecting: self)
        let mutableString = NSMutableString()
        for (name, value) in countryMirror.children {
            guard let name = name, name != "id" else { continue }
            mutableString.append(name)
            mutableString.append(":\(value)")
            if name != "testsPerOneMillion" {
                mutableString.append("|")
            }
        }
        return String(mutableString)
    }
}
#if DEBUG

let testData = [
    Country(country:"North America",cases:627428,todaysCases:364,deaths:25148,todayDeaths:36,recoverd:47414,active:554866,critical:13863,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"Europe",cases:907386,todaysCases:0,deaths:79989,todayDeaths:0,recoverd:231946,active:595451,critical:29807,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"Asia",cases:310329,todaysCases:89,deaths:11351,todayDeaths:0,recoverd:150686,active:148292,critical:6650,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"South America",cases:55011,todaysCases:317,deaths:2276,todayDeaths:28,recoverd:7065,active:45670,critical:1153,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"Oceania",cases:7816,todaysCases:17,deaths:70,todayDeaths:4,recoverd:4123,active:3623,critical:84,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"Africa",cases:15944,todaysCases:0,deaths:838,todayDeaths:0,recoverd:3045,active:12061,critical:178,casesPerOneMillion:0,deathsPerOneMillion:0,totalTest:0,testsPerOneMillion:0),
    Country(country:"World",cases:1924635,todaysCases:787,deaths:119686,todayDeaths:68,recoverd:444918,active:1360031,critical:51742,casesPerOneMillion:247,deathsPerOneMillion:15,totalTest:0,testsPerOneMillion:0)]
#endif

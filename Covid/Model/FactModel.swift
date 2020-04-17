//
//  FactModel.swift
//  Covid
//
//  Created by Visha Shanghvi on 2020-04-13.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation

struct FactsModel: Codable {
    
    var cases: Int
    var deaths: Int
    var recovered: Int
}

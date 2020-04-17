//
//  FactRequest.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation
struct FactRequest: Requestable {
    
    var urlPath: String {
        return "/all"
    }
}

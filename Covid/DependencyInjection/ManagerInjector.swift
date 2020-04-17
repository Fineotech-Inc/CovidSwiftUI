//
//  ManagerInjector.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation

protocol ManagerInjected {}

extension ManagerInjected {
    
    var factsManager: FactsManagerProtocol {
        return ManagerInjector.factsManager
    }
}

struct ManagerInjector {
    
    static let factsManager: FactsManagerProtocol = FactsManager()
}

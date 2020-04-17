//
//  APIError.swift
//  Covid
//
//  Created by smitesh patel on 2020-04-16.
//  Copyright © 2020 Fineotech Inc. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case networkError(Error)
    case parsing(description: String)
    case restAPIError(data: Data?)
}

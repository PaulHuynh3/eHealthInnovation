//
//  FetchService.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-12-06.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case error(Error)
    case invalidURL
    case noData
}

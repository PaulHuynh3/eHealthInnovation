//
//  Patient.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

//Move to seprate Models later
struct PatientData: Codable {
    let entry: [Entry]
}

struct Entry: Codable, Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.resource?.id == rhs.resource?.id
    }

    let fullUrl: String?
    let resource: Resource?
}

struct Resource: Codable {
    let id: String?
    let name: [GivenName]?
    let gender: String?
    let birthDate: String?
}

struct GivenName: Codable {
    let family: String?
    let given: [String]?
}


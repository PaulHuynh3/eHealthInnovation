//
//  PatientInformationRepository.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

protocol PatientInformationRepository {
    func getPatientData(success: @escaping (PatientData) -> Void, failure: @escaping (NetworkError) -> Void)
}

class PatientRepository: NetworkService, PatientInformationRepository {

    static let sharedInstance = PatientRepository()

    private override init() {}

    func getPatientData(success: @escaping (PatientData) -> Void, failure: @escaping (NetworkError) -> Void) {
        let url = URL(string:"http://hapi.fhir.org/baseDstu3/Patient?_pretty=true")
        fetch(method: .get, url: url, success: { (patientData: PatientData) in
            success(patientData)
        }) { error in
            failure(error)
        }
    }
}

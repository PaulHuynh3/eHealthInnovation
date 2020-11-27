//
//  PatientInformationService.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

protocol PatientInformation {
    func getPatientEntry(success: @escaping ([Entry]) -> Void, failure: @escaping (NetworkError) -> Void)
}

class PatientInformationService: PatientInformation {

    static let sharedInstance = PatientInformationService()

    private init() {}

    var patientRepository: PatientInformationRepository = PatientRepository.sharedInstance

    func getPatientEntry(success: @escaping ([Entry]) -> Void, failure: @escaping (NetworkError) -> Void) {
        patientRepository.getPatientData(success: { patientData in
            success(patientData.entry)
        }, failure: failure)
    }
}

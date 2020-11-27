//
//  PatientInformationService.swift
//  eHealthInnovation-TestTests
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import XCTest
@testable import eHealthInnovation_Test

class PatientInformationServiceTest: XCTestCase {

    var patientInformationService = PatientInformationService.sharedInstance

    func testGivenMockRepoFetchEntrySuccessfully() {
        // GIVEN
        let mockPatientRepository = MockPatientRepository()
        patientInformationService.patientRepository = mockPatientRepository

        // WHEN
        mockPatientRepository.shouldFailRequest = false
        var patientEntry = [Entry]()
        patientInformationService.getPatientEntry(success: { entry in
            patientEntry = entry
        }) { error in
            print(error)
        }

        // THEN
        XCTAssertEqual(patientEntry, [mockPatientRepository.entry()])
    }

    func testGivenMockRepoFetchEntryWithError() {
        // GIVEN
        let mockPatientRepository = MockPatientRepository()
        patientInformationService.patientRepository = mockPatientRepository

        // WHEN
        mockPatientRepository.shouldFailRequest = true
        var networkError: NetworkError?
        patientInformationService.getPatientEntry(success: { entry in

        }) { error in
            networkError = error
        }

        // THEN
        XCTAssertNotNil(networkError)
    }


}

extension PatientInformationServiceTest {
    class MockPatientRepository: PatientInformationRepository {
        var shouldFailRequest = false

        var entry = { () -> Entry in
            let givenName = GivenName(family: "Huynh", given: ["Paul"])
            let resource = Resource(id: "123456", name: [givenName], gender: "male", birthDate: "1991-06-05")
            return Entry(fullUrl: "www.google.com", resource: resource)
        }

        func getPatientData(success: @escaping (PatientData) -> Void, failure: @escaping (NetworkError) -> Void) {
            shouldFailRequest ? failure(.noData) : success(PatientData(entry: [entry()]))
        }
    }
}



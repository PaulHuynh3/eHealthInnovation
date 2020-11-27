//
//  eHealthInnovation_TestTests.swift
//  eHealthInnovation-TestTests
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import XCTest
@testable import eHealthInnovation_Test

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var patientInformationService = PatientInformationService.sharedInstance
    var mockHomeDelegate = MockHomeDelegate()

    override func setUp() {
        viewModel = HomeViewModel()
        viewModel.delegate = mockHomeDelegate
    }

    func testTitleGivenLoadedState() {
        // Given
        let loadedStateTitle = viewModel.setTitle(.success)

        // Then
        XCTAssertEqual(loadedStateTitle, "Patient Information")
    }

    func testTitleGivenLoadingState() {
        // Given
        let loadingStateTitle = viewModel.setTitle(.loading)

        // Then
        XCTAssertEqual(loadingStateTitle, "Loading Information")
    }

    func testTitleGivenFailedState() {
        // Given
        let failedStateTitle = viewModel.setTitle(.failure)

        // Then
        XCTAssertEqual(failedStateTitle, "Please try again")
    }

    func testOpenAlertWasCalledGivenFailedRequest() {
        //GIVEN
        let mockPatientRepository = MockPatientRepository()
        patientInformationService.patientRepository = mockPatientRepository
        mockPatientRepository.shouldFailRequest = true

        //WHEN
        viewModel.fetchPatientInformation(success: {}) {}

        //THEN

        XCTAssertTrue(mockHomeDelegate.openAlertWasCalled)
    }
}

extension HomeViewModelTests {
    class MockHomeDelegate: HomeViewModelDelegate {
        var openAlertWasCalled = false

        func openAlert(data: AlertManager.Data) {
            openAlertWasCalled = true
        }
    }
}

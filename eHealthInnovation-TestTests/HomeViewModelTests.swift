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

    override func setUp() {
        viewModel = HomeViewModel()
    }

    func testTitleGivenLoadedState() {
        // Given
        let loadedStateTitle = viewModel.setTitle(.loaded)

        // Then
        XCTAssertEqual(loadedStateTitle, "Patient Information")
    }

    func testTitleGivenLoadingState() {
        // Given
        let loadingStateTitle = viewModel.setTitle(.loading)

        // Then
        XCTAssertEqual(loadingStateTitle, "Loading Information")
    }

}

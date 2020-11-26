//
//  HomeViewModel.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import UIKit

class HomeViewModel {
    // MARK: - Properties

    var delegate: HomeViewModelDelegate?

    // MARK: - Setup

    func configure(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }

    var setTitle: (State) -> String = {
        switch $0 {
        case .loading:
            return "Loading Information"
        case .loaded:
            return "Patient Information"
        }
    }
}

enum State {
    case loading
    case loaded
}

protocol HomeViewModelDelegate: class {

}

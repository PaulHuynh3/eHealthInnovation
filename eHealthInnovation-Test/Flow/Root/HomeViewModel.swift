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

    var patientService = PatientInformationService.sharedInstance
    let builder = HomeBuilder()
    var delegate: HomeViewModelDelegate?
    var entries = [Entry]()

    var setTitle: (State) -> String = {
        switch $0 {
        case .loading:
            return "Loading Information"
        case .success:
            return "Patient Information"
        case .failure:
            return "Please try again"
        }
    }

    // MARK: - Configuration

    func configure(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }

    func fetchPatientInformation(success: @escaping () -> Void, failure: @escaping () -> Void) {
        patientService.getPatientEntry(success: { [weak self] entry in
            self?.entries = entry
            DispatchQueue.main.async {
                success()
            }
        }) { [weak self] networkError in
            guard let self = self else { return }
            self.delegate?.openAlert(data: self.builder.buildErrorAlert(error: networkError))
            DispatchQueue.main.async {
                failure()
            }
        }
    }

    func didSelectPatient(entry: Entry) -> PatientSelectedViewController? {
        guard let patientSelectedViewController = UIStoryboard(name: "PatientSelectedViewController", bundle: nil).instantiateViewController(withIdentifier: String(describing: PatientSelectedViewController.self)) as? PatientSelectedViewController else { return nil }
        patientSelectedViewController.configure(entry: entry)
        return patientSelectedViewController
    }

    func buildPatientData(entry: Entry) -> PatientNameCell.Data {
        return builder.buildPatientData(entry: entry)
    }
}

enum State {
    case loading
    case success
    case failure
}

protocol HomeViewModelDelegate: class {
    func openAlert(data: AlertManager.Data)
}

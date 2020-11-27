//
//  HomeBuilder.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import Foundation

class HomeBuilder {

    func buildErrorAlert(error: NetworkError) -> AlertManager.Data {
        switch error {
        case let .error(err):
            return AlertManager.Data(
                title: "Unexpected Error",
                message: err.localizedDescription,
                actions: nil)
        default:
            return AlertManager.Data(
                title: "Unexpected Error",
                message: "We are having some technical dificulties",
                actions: nil)
        }
    }

    func buildPatientData(entry: Entry) -> PatientNameCell.Data {
        let name = entry.resource?.name?.first?.given?.first
        let id = entry.resource?.id ?? "User not found"
        return PatientNameCell.Data(name: name, id: id)
    }
}

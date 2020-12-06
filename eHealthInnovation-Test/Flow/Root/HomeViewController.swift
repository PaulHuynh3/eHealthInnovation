//
//  HomeViewController.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = HomeViewModel()

    // MARK: - ViewController Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self)
        setup()
    }

    // MARK: - Setup

    func setup() {
        registerNibForTableView(cellType: String(describing: PatientNameCell.self), tableView: tableView)
        titleLabel.text = viewModel.setTitle(.loading)
        fetchPatientData()
    }

    private func fetchPatientData() {
        viewModel.fetchPatientInformation(success: { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.titleLabel.text = self.viewModel.setTitle(.success)
            }, failure: { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
                self.titleLabel.text = self.viewModel.setTitle(.failure)
            })
    }
}

extension HomeViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.entries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: PatientNameCell.self, in: tableView, for: indexPath)
        cell.configure(data: viewModel.buildPatientData(entry: viewModel.entries[indexPath.row]))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let patientSelectedViewController = viewModel.didSelectPatient(entry: viewModel.entries[indexPath.row]) else { return }
        navigationController?.pushViewController(patientSelectedViewController, animated: true)
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func openAlert(data: AlertManager.Data) {
        AlertManager.show(in: self, with: data)
    }
}

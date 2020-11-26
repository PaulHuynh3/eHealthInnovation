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

    let viewModel = HomeViewModel()

    // MARK: - ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(delegate: self)
    }
}

extension HomeViewController: TableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 70
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

}

extension HomeViewController: HomeViewModelDelegate {

}

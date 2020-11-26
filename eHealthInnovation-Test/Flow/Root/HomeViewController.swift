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

extension HomeViewController: HomeViewModelDelegate {

}


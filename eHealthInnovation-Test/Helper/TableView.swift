//
//  TableView.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import UIKit

protocol TableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func registerNibForTableView(cellType: String, tableView: UITableView)
}

extension TableView {
    func registerNibForTableView(cellType: String, tableView: UITableView) {
        let nib = UINib(nibName: cellType, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellType)
    }
}

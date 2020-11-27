//
//  Extensions.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cell identifier: T.Type, in tableView: UITableView, for indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: identifier), for: indexPath) as! T
    }
}

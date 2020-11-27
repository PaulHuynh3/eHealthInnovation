//
//  PatientNameCell.swift
//  eHealthInnovation-Test
//
//  Created by Paul Huynh on 2020-11-26.
//  Copyright © 2020 Paul Corp. All rights reserved.
//

import UIKit

class PatientNameCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(data: Data) {
        nameLabel.text = data.name == nil ? data.id : data.name
    }

    struct Data {
        let name: String?
        let id: String
    }
}


//
//  StatCell.swift
//  NumberData
//
//  Created by Kun Huang on 11/3/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class StatCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    var draw: (key: String, value: Int)? {
        didSet {
            numberLabel.text = "\(draw!.key): \(draw!.value)"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

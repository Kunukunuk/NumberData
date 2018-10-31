//
//  LottoCell.swift
//  NumberData
//
//  Created by Kun Huang on 10/29/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class LottoCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var drawingNumbers: UILabel!
    
    var draw: DrawResult! {
        didSet {
            dateLabel.text = draw.date
            drawingNumbers.text = draw.winningNumbers
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

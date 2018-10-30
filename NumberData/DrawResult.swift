//
//  DrawResult.swift
//  NumberData
//
//  Created by Kun Huang on 10/29/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class DrawResult {
    var date: String?
    var winningNumbers: String?
    var multiplier: Int?
    
    init(dictionary: [String: Any]) {
        date = dictionary["draw_date"] as? String
        winningNumbers = dictionary["winning_numbers"] as? String
        bouns = dictionary["multiplier"] as? Int
    }
}

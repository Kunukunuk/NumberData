//
//  MegaNumbers.swift
//  NumberData
//
//  Created by Kun Huang on 10/30/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class MegaNumbers {
    var date: String?
    var winningNumbers: String?
    var megaBall: Int?
    
    init(dictionary: [String: Any]) {
        let dateWithZero = dictionary["draw_date"] as? String
        let dateArray = dateWithZero?.components(separatedBy: "T")
        date = dateArray![0]
        winningNumbers = dictionary["winning_numbers"] as? String
        megaBall = dictionary["mega_ball"] as? Int
    }
}

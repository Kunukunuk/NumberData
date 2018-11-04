//
//  StatsViewController.swift
//  NumberData
//
//  Created by Kun Huang on 11/3/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var mega: [MegaNumbers]?
    var power: [PowerNumbers]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(mega?.count) \n\(power?.count)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

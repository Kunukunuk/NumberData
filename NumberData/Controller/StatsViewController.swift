//
//  StatsViewController.swift
//  NumberData
//
//  Created by Kun Huang on 11/3/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mega: [MegaNumbers]?
    var power: [PowerNumbers]?
    var numbers: [String: Int] = [:]
    var numbersInt: [Int]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if mega != nil {
            getMegaStats()
        } else if power != nil {
            getPowerStats()
        } else {
            print("No Data")
        }
    }
    
    func getMegaStats() {
        
        for singleDraw in mega! {
            let stringArray = singleDraw.winningNumbers?.components(separatedBy: " ")
            for single in stringArray! {
                if numbers[single] == nil {
                    numbers[single] = 1
                } else {
                    numbers[single]! += 1
                }
            }
        }
        sortArray()
    }
    
    func getPowerStats() {
        for singleDraw in power! {
            let numArray = singleDraw.winningNumbers?.components(separatedBy: " ")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath) as! StatCell
        
        cell.numbers = numbers
        
        return cell
    }
    
    func sortArray() {
        
        //numbers = numbers.sorted(by: { $0.value > $1.value})
        
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

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
    var dictArray: [(key: String, value: Int)] = []
    var probability: [Double] = []
    
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
        calculateProb()
    }
    
    func getPowerStats() {
        for singleDraw in power! {
            let stringArray = singleDraw.winningNumbers?.components(separatedBy: " ")
            for index in 0..<stringArray!.count-1 {
                let number = stringArray![index]
                if numbers[number] == nil {
                    numbers[number] = 1
                } else {
                    numbers[number]! += 1
                }
            }
        }
        sortArray()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath) as! StatCell
        
        cell.draw = dictArray[indexPath.row]
        
        return cell
    }
    
    func sortArray() {
        
        dictArray = numbers.sorted(by: { $0.value > $1.value})
        tableView.reloadData()
        
    }
    
    func calculateProb() {
        let totalDraw = (mega?.count)!
        for dict in dictArray {
            probability.append( (Double(dict.value) / Double(totalDraw)) * 100)
        }
        
        for each in probability {
            print("each: \(each)")
        }
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

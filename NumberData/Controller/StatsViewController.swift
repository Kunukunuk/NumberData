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
        let doubleString = String(format: "%.2f", probability[indexPath.row])
        cell.numberLabel.text = cell.numberLabel.text! + " \(doubleString)%"
        
        return cell
    }
    
    func sortArray() {
        
        dictArray = numbers.sorted(by: { $0.value > $1.value})
        tableView.reloadData()
        
        calculateProb()
        
    }
    
    func calculateProb() {
        var totalDraw = 0
        
        if mega != nil {
            totalDraw = (mega?.count)!
        } else if power != nil {
            totalDraw = (power?.count)!
        }
        
        for dict in dictArray {
            probability.append( (Double(dict.value) / Double(totalDraw)) * 100)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let destinationVC = segue.destination as! EachNumberViewController
            if let indextPath = tableView.indexPathForSelectedRow {
                destinationVC.dictArray = dictArray[indextPath.row]
            }
        }
    }

}

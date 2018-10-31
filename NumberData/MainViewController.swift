//
//  ViewController.swift
//  NumberData
//
//  Created by Kun Huang on 10/29/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tableArray: [DrawResult] = []
    var megaTable: [MegaNumbers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getMegaData()
        //getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tableArray?.count ?? 1
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LottoCell", for: indexPath) as! LottoCell
        
        cell.draw = tableArray[indexPath.row]
        
        return cell
    }

    func getPowerData() {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://data.ny.gov/resource/8vkr-v8vh.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let drawDict = draw as! [String: Any]
                    let drawResult = DrawResult(dictionary: drawDict)
                    self.tableArray.append(drawResult)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        task.resume()
    }

    func getMegaData() {
        
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://data.ny.gov/resource/h6w8-42p9.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let megaDict = draw as! [String: Any]
                    let megaNumber = MegaNumbers(dictionary: megaDict)
                    self.megaTable.append(megaNumber)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        task.resume()
    }
}


//
//  LottoAPIManager.swift
//  NumberData
//
//  Created by Kun Huang on 11/1/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class LottoAPIManager {
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getPowerballNumbers() {
        
        let url = URL(string: "https://data.ny.gov/resource/8vkr-v8vh.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let drawDict = draw as! [String: Any]
                    let drawResult = DrawResult(dictionary: drawDict)
                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getMegamillionNumbers() {
        
        let url = URL(string: "https://data.ny.gov/resource/h6w8-42p9.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let megaDict = draw as! [String: Any]
                    let megaNumber = MegaNumbers(dictionary: megaDict)
                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        task.resume()
    }
    
}

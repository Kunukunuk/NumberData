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
    
    func getPowerballNumbers(completion: @escaping ([PowerNumbers]?, Error?) -> ()) {
        
        var powerball: [PowerNumbers] = []
        
        let url = URL(string: "https://data.ny.gov/resource/8vkr-v8vh.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let drawDict = draw as! [String: Any]
                    let drawResult = PowerNumbers(dictionary: drawDict)
                    powerball.append(drawResult)
                }
                completion(powerball, nil)
            } else {
                print("error: \(error?.localizedDescription)")
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getMegamillionNumbers(completion: @escaping ([MegaNumbers]?, Error?) -> ()) {
        
        var megamillion: [MegaNumbers] = []
        let url = URL(string: "https://data.ny.gov/resource/h6w8-42p9.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                for draw in dataDict {
                    let megaDict = draw as! [String: Any]
                    let megaNumber = MegaNumbers(dictionary: megaDict)
                    megamillion.append(megaNumber)
                }
                completion(megamillion, nil)
            } else {
                print("error: \(error?.localizedDescription)")
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}

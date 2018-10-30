//
//  ViewController.swift
//  NumberData
//
//  Created by Kun Huang on 10/29/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }

    func getData() {
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://data.ny.gov/resource/etu4-7qqz.json")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let dataDict = try! JSONSerialization.jsonObject(with: data, options: [])
                print("data: \(dataDict)")
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
        task.resume()
    }

}


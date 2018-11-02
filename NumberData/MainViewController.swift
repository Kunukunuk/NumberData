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
    var tableArray: [PowerNumbers] = []
    var megaTable: [MegaNumbers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
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
    
    func getData() {
        
        LottoAPIManager().getPowerballNumbers { (powernumbers, error) in
            if let powernumbers = powernumbers {
                self.tableArray = powernumbers
                self.tableView.reloadData()
            }
        }
        
    }
}


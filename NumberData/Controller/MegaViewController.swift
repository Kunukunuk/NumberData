//
//  MegaViewController.swift
//  NumberData
//
//  Created by Kun Huang on 11/1/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class MegaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var megaArray: [MegaNumbers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getNumbers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return megaArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LottoCell", for: indexPath) as! LottoCell
        cell.mega = megaArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func getNumbers() {
        
        LottoAPIManager().getMegamillionNumbers { (meganumbers, error) in
            if let meganumbers = meganumbers {
                self.megaArray = meganumbers
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotostats" {
            let destinationVC = segue.destination as! StatsViewController
            destinationVC.mega = self.megaArray
        }
    }

}

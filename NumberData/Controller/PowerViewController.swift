//
//  PowerViewController.swift
//  NumberData
//
//  Created by Kun Huang on 11/1/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class PowerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var powerArray: [PowerNumbers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getNumbers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return powerArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LottoCell", for: indexPath) as! LottoCell
        
        cell.power = powerArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func getNumbers() {
        
        LottoAPIManager().getPowerballNumbers { (powernumbers, error) in
            if let powernumbers = powernumbers {
                self.powerArray = powernumbers
                self.tableView.reloadData()
            }
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

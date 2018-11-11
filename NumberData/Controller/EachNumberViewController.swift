//
//  EachNumberViewController.swift
//  NumberData
//
//  Created by Kun Huang on 11/4/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class EachNumberViewController: UIViewController {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var stillInUse: UILabel!
    @IBOutlet weak var occurrenceLabel: UILabel!
    var dictArray: (key: String, value: Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.text = dictArray?.key
        stillInUse.text = "Yes"
        occurrenceLabel.text = "\(String(describing: (dictArray?.value)!))"
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
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

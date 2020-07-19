//
//  ResultViewController.swift
//  Tipsy
//
//  Created by DAPL-Asset-290 on 16/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var amount : String?
    var status : String?
    
    @IBOutlet weak var splitedAmountLabel : UILabel!
    @IBOutlet weak var splitDetailsLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitedAmountLabel.text = amount
        splitDetailsLabel.text = status
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedTitle()
       
    }
    
    private func animatedTitle() {
        var counter = 0.0
        titleLabel.text = ""
        let title = Constants.appName
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * counter, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            counter += 1
        }
    }
}

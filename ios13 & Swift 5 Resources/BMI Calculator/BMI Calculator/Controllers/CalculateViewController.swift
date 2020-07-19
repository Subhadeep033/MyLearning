//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculateBMI = CalculateBMI()
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderValueChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.1fm", sender.value)
    }
    
    @IBAction func weightSliderValueChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        calculateBMI.calculateBMI(weight : weightSlider.value, height: heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculateBMI.getBMI()
            resultVC.advice = calculateBMI.getAdvice()
            resultVC.color = calculateBMI.getColor()
        }
    }
}


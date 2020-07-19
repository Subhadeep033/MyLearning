//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var personNumberLabel: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.becomeFirstResponder()
        deselectButton()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectTipButtonTap(_ sender: UIButton) {
        deselectButton()
        sender.isSelected = true
        
        calculateBrain.calculateTip(sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if sender.value <= sender.maximumValue{
            personNumberLabel.text = String(format: "%d",Int(sender.value))
        }
    }
    
    @IBAction func calculateButtonTap(_ sender: UIButton) {
        if billTextField.text != "" {
            calculateBrain.splitAmountAmongPeople(amount: billTextField.text!,people : Int(personNumberLabel.text!)!)

            self.performSegue(withIdentifier: "goToResult", sender: self)
        }else{
            print("Enter Bill Amount.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.amount = calculateBrain.getSplitedAmount()
            resultVC.status = calculateBrain.getSplitText()
        }
    }
    
    private func deselectButton(){
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        billTextField.endEditing(true)
    }
    
}


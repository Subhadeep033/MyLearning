//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    var lastValue = Float()
    var isDecimalPointClick = Bool()
    var actionType = String()
    var isInAction = Bool()
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- All Numbers Button ------
    @IBAction func sevenButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 7)
    }
    
    @IBAction func eightButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 8)
    }
    
    @IBAction func nineButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 9)
    }
    
    @IBAction func fourButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 4)
    }
    
    @IBAction func fiveButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 5)
    }
    
    @IBAction func sixButtonTap(_ sender: UIButton) {
        
        updateAnswerLabel(withValue: 6)
    }
    
    @IBAction func oneButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 1)
    }
    
    @IBAction func twoButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 2)
    }
    
    @IBAction func threeButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 3)
    }
    
    @IBAction func zeroButtonTap(_ sender: UIButton) {
        updateAnswerLabel(withValue: 0)
    }
    
    @IBAction func decimalButtonTap(_ sender: UIButton) {
        isDecimalPointClick = true
        updateAnswerLabel(withDecimal: ".")
    }
    
    //MARK:- Operations Button Tap
    @IBAction func equalButtonTap(_ sender: UIButton) {
        isDecimalPointClick = false
        isInAction = false
        calculate(value: Float(answerLabel.text ?? "0")!, actionType: actionType)
        actionType = ""
    }
    
    @IBAction func plusButtonTap(_ sender: UIButton) {
        
        lastValue = Float(answerLabel.text ?? "0")!
        answerLabel.text = ""
        isInAction = true
        actionType = "+"
    }
    
    @IBAction func minusButtonTap(_ sender: UIButton) {
        lastValue = Float(answerLabel.text ?? "0")!
        answerLabel.text = ""
        isInAction = true
        actionType = "-"
    }
    
    @IBAction func multiplicationButtonTap(_ sender: UIButton) {
        lastValue = Float(answerLabel.text ?? "0")!
        answerLabel.text = ""
        isInAction = true
        actionType = "*"
    }
    
    @IBAction func divisionButtonTap(_ sender: UIButton) {
        lastValue = Float(answerLabel.text ?? "0")!
        answerLabel.text = ""
        isInAction = true
        actionType = "/"
    }
    
    @IBAction func resetButtonTap(_ sender: UIButton) {
        resetButton.setTitle("AC", for: .normal)
        isDecimalPointClick = false
        answerLabel.text = "0"
        lastValue = 0
    }
    
    @IBAction func plusMinusButtonTap(_ sender: UIButton) {
        if isDecimalPointClick{
           answerLabel.text = "\((-1) * lastValue)"
        }
        else{
            answerLabel.text = "\(Int((-1) * lastValue))"
        }
    }
    
    @IBAction func percentageButtonTap(_ sender: UIButton) {
        lastValue = Float(answerLabel.text ?? "0")!
        answerLabel.text = ""
        isInAction = true
        actionType = "%"
    }
}

extension ViewController{
    
    private func updateAnswerLabel(withValue : Float){
        resetButton.setTitle("C", for: .normal)
        
            if (answerLabel.text == "0") {
                answerLabel.text = ""
                answerLabel.text = "\(Int(withValue))"
                lastValue = Float(answerLabel.text ?? "0")!
                
            }
            else{
                answerLabel.text = (answerLabel.text ?? "") + "\(Int(withValue))"
                if !isInAction{
                lastValue = Float(answerLabel.text ?? "0")!
                }
            }
        
    }
    
    private func updateAnswerLabel(withDecimal:String){
        resetButton.setTitle("C", for: .normal)
        answerLabel.text = (answerLabel.text ?? "0") + withDecimal
    }
    
    private func calculate(value: Float, actionType : String){
        switch actionType {
        case "+":
            
            lastValue = lastValue + value
            answerLabel.text = "\(lastValue)"
            break
        case "-":
            lastValue = lastValue - value
            answerLabel.text = "\(lastValue)"
            break
            
        case "*":
            lastValue = lastValue * value
            answerLabel.text = "\(lastValue)"
            break
            
        case "/":
            lastValue = lastValue / value
            answerLabel.text = "\(lastValue)"
            break
            
        case "%":
            lastValue = (lastValue * value)/100
            answerLabel.text = "\(lastValue)"
        break
        default:
            break
        }
    }
    
    
}

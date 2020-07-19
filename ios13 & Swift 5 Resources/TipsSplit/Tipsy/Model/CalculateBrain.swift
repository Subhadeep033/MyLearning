//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by DAPL-Asset-290 on 16/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var tipPercentage = 0.0
    var split : Split?
    
    mutating func calculateTip(_ percentage: String) {
        let buttonTitleWithOutPercentage = String(percentage.dropLast())
        tipPercentage = Double(buttonTitleWithOutPercentage)! / 100
        
        print(tipPercentage)
    }
    
    mutating func splitAmountAmongPeople(amount : String, people : Int) {
        guard let totalAmount = Double(amount) else { return }
        let tip = totalAmount * tipPercentage
        
        let totalBill = totalAmount + tip
        let splitedAmount = totalBill/Double(people)
        split = Split(value: splitedAmount, text: "Split between \(people) people, with \(tipPercentage * 100)% tip.")
    }
    
    func getSplitedAmount() -> String{
        return String(format: "%.2f", split?.value ?? 0.0)
    }
    
    func getSplitText() -> String {
        return split?.text ?? ""
    }
}

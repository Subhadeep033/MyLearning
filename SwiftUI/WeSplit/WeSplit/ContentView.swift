//
//  ContentView.swift
//  WeSplit
//
//  Created by DAPL-Asset-290 on 19/05/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [0, 5, 10, 15, 20, 25, 30]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipAmount = Double(tipPercentages[tipPercentage])
        let amount = Double(checkoutAmount) ?? 0
        
        let tipValue = (amount/100) * tipAmount
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",text: $checkoutAmount).keyboardType(.decimalPad)
                    Picker("Number of people",selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage",selection: $tipPercentage){
                    ForEach(0..<tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

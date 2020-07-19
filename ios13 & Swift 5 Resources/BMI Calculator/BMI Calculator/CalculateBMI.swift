//
//  CalculateBMI.swift
//  BMI Calculator
//
//  Created by DAPL-Asset-290 on 15/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBMI {
    var bmi : BMI?
    
    mutating func calculateBMI(weight: Float,height:Float) {
       let calculatedBMI = weight / pow(height, 2)
    
        if calculatedBMI < 18.5{
            bmi = BMI(value: calculatedBMI, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if calculatedBMI < 24.9{
            bmi = BMI(value: calculatedBMI, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else{
            bmi = BMI(value: calculatedBMI, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No Advice."
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func getBMI() -> String{
        return String(format: "%.1f", bmi?.value ?? "0.0" )
    }
}

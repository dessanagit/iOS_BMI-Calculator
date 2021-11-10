//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dessana Santos on 01/10/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
  
    var bmi: BMI?
    
    func getBMIValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "There's no Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.systemRed
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight/pow(height, 2)
      
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemIndigo)
            print("Underweight")
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
            print("Normal weight")
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.magenta)
            print("Overweight")
        }
        
      
}
    
}

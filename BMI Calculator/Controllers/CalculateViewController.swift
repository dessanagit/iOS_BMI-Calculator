//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
                    
                    ////round the number - two decimal places
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
                    
                    ////round the number - no decimal places
        let weight = String(format: "%.f", sender.value)
        weightLabel.text = "\(weight)kg"
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
       
            ///power func
        bmi = weight/pow(height, 2)
        
        
        //Perform Segue to go to ResultViewController when button got clicked.
        self.performSegue(withIdentifier: "goToResult", sender: self)
                                                        ////who's gonna initiate the segue. In this case is self because it's the CalculateViewController itself.
    }
    
    var bmi: Float = 0.0
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String(format: "%.1f", bmi)
        }
    }
    
   

}


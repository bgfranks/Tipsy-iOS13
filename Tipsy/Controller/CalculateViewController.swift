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
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 1
    var billTotal = 0.00
    var result = ""
    var buttonTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitNumberLabel.text = String(numberOfPeople)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // mark the button that triggerd the IBA
        sender.isSelected = true
        
        buttonTitle = String(sender.currentTitle!.dropLast())
        let buttonNumber = Double(buttonTitle)!
        
        tip = buttonNumber / 100
           
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperCount = sender.value
        sender.minimumValue = 1
        
        numberOfPeople = Int(stepperCount)
        
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text!
        
        if billText != "" {
            billTotal = Double(billText)!
            
            result = String(format: "%0.2f", billTotal * (1 + tip) / Double(numberOfPeople))
            
            print(result)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = result
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipPercent = buttonTitle
        }
    }
    
}


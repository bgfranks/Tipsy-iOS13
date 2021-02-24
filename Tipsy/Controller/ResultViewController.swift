//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Brandon Franks on 2/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String? = ""
    var tipPercent: String? = ""
    var numberOfPeople: Int? = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercent!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

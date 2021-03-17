//
//  SettingViewController.swift
//  CW01
//
//  Created by user188409 on 3/17/21.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var decimalStepper: UIStepper!
    @IBOutlet weak var decimalLbl: UILabel!
    
    var decimalValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.decimalLbl.text = "0"
    }

    @IBAction func decimalValueChange(_ sender: UIStepper) {
        decimalLbl.text = "\(Int(decimalStepper.value))"
        RoundDecimal.instance.roundDecimal = Int(decimalStepper.value)
    }
    
}
	

//
//  DistanceViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/17/21.
//

import UIKit

enum DistanceScales: Int {
    case metre ,kilometre, miles, centimetre, milimetre, yard, inch
}

class DistanceViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    @IBOutlet weak var metreTextField: UITextField!
    @IBOutlet weak var kmTextField: UITextField!
    @IBOutlet weak var milesTextField: UITextField!
    @IBOutlet weak var cmTextField: UITextField!
    @IBOutlet weak var mmTextField: UITextField!
    @IBOutlet weak var yardTextField: UITextField!
    @IBOutlet weak var inchTextField: UITextField!
    
    //creating an object - Distance
    
    var distance : Distance = Distance(metre: 0.0, kilometre: 0.0, miles: 0.0, centimetre: 0.0, milimetre: 0.0, yard: 0.0, inch: 0.0)
    
    var historyStringArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allocateDelegate()
    }
    
    func allocateDelegate(){
        metreTextField.delegate = self
        kmTextField.delegate = self
        milesTextField.delegate = self
        cmTextField.delegate = self
        mmTextField.delegate = self
        yardTextField.delegate = self
        inchTextField.delegate = self        
    }
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    @IBAction func handleTextChange(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            metreTextField.text = ""
            kmTextField.text = ""
            milesTextField.text = ""
            cmTextField.text = ""
            mmTextField.text = ""
            yardTextField.text = ""
            inchTextField.text = ""
            return}
        
        switch DistanceScales(rawValue: sender.tag)! {
        
        case .metre :
            distance.metre = doubleTextFieldValue
            distance.kilometre = doubleTextFieldValue / 1000
            distance.miles = doubleTextFieldValue / 1609.244
            distance.centimetre = doubleTextFieldValue * 100
            distance.milimetre = doubleTextFieldValue * 1000
            distance.yard = doubleTextFieldValue * 1.094
            distance.inch = doubleTextFieldValue * 39.37
            
            
            kmTextField.text = "\(distance.kilometre)"
            milesTextField.text = "\(distance.miles)"
            cmTextField.text = "\(distance.centimetre)"
            mmTextField.text = "\(distance.milimetre)"
            yardTextField.text = "\(distance.yard)"
            inchTextField.text = "\(distance.inch)"
            
        case .kilometre :
            distance.metre = doubleTextFieldValue * 1000
            distance.kilometre = doubleTextFieldValue
            distance.miles = doubleTextFieldValue / 1.609
            distance.centimetre = doubleTextFieldValue * 100000
            distance.milimetre = doubleTextFieldValue * 1000000
            distance.yard = doubleTextFieldValue * 1093.61
            distance.inch = doubleTextFieldValue * 39370.1
            
            
            metreTextField.text = "\(distance.metre)"
            milesTextField.text = "\(distance.miles)"
            cmTextField.text = "\(distance.centimetre)"
            mmTextField.text = "\(distance.milimetre)"
            yardTextField.text = "\(distance.yard)"
            inchTextField.text = "\(distance.inch)"
        
        case .miles :
            distance.metre = doubleTextFieldValue * 1609.344
            distance.kilometre = doubleTextFieldValue * 1.60934
            distance.miles = doubleTextFieldValue
            distance.centimetre = doubleTextFieldValue * 160934.4
            distance.milimetre = doubleTextFieldValue * 1.609e+6
            distance.yard = doubleTextFieldValue * 1760
            distance.inch = doubleTextFieldValue * 63360
            
            
            kmTextField.text = "\(distance.kilometre)"
            metreTextField.text = "\(distance.metre)"
            cmTextField.text = "\(distance.centimetre)"
            mmTextField.text = "\(distance.milimetre)"
            yardTextField.text = "\(distance.yard)"
            inchTextField.text = "\(distance.inch)"
            
        case .centimetre :
            distance.metre = doubleTextFieldValue / 100
            distance.kilometre = doubleTextFieldValue / 100000
            distance.miles = doubleTextFieldValue / 160934.4
            distance.centimetre = doubleTextFieldValue
            distance.milimetre = doubleTextFieldValue * 10
            distance.yard = doubleTextFieldValue / 91.44
            distance.inch = doubleTextFieldValue / 2.54
            
            
            kmTextField.text = "\(distance.kilometre)"
            milesTextField.text = "\(distance.miles)"
            metreTextField.text = "\(distance.metre)"
            mmTextField.text = "\(distance.milimetre)"
            yardTextField.text = "\(distance.yard)"
            inchTextField.text = "\(distance.inch)"
            
        case .milimetre :
            distance.metre = doubleTextFieldValue / 1000
            distance.kilometre = doubleTextFieldValue / 1e-6
            distance.centimetre = doubleTextFieldValue / 10
            distance.milimetre = doubleTextFieldValue
            distance.yard = doubleTextFieldValue / 914.4
            distance.inch = doubleTextFieldValue / 25.4
            
            
            kmTextField.text = "\(distance.kilometre)"
            milesTextField.text = "\(distance.miles)"
            cmTextField.text = "\(distance.centimetre)"
            metreTextField.text = "\(distance.metre)"
            yardTextField.text = "\(distance.yard)"
            inchTextField.text = "\(distance.inch)"
            
        case .yard :
            distance.metre = doubleTextFieldValue / 1.094
            distance.kilometre = doubleTextFieldValue / 1094
            distance.miles = doubleTextFieldValue / 1760
            distance.centimetre = doubleTextFieldValue * 91.44
            distance.milimetre = doubleTextFieldValue * 914.4
            distance.yard = doubleTextFieldValue
            distance.inch = doubleTextFieldValue * 36
            
            
            kmTextField.text = "\(distance.kilometre)"
            milesTextField.text = "\(distance.miles)"
            cmTextField.text = "\(distance.centimetre)"
            mmTextField.text = "\(distance.milimetre)"
            metreTextField.text = "\(distance.metre)"
            inchTextField.text = "\(distance.inch)"
            
        case .inch :
            distance.metre = doubleTextFieldValue / 39.37
            distance.kilometre = doubleTextFieldValue / 39370
            distance.miles = doubleTextFieldValue / 63360
            distance.centimetre = doubleTextFieldValue * 2.54
            distance.milimetre = doubleTextFieldValue * 25.4
            distance.yard = doubleTextFieldValue / 36
            distance.inch = doubleTextFieldValue
            
            
            kmTextField.text = "\(distance.kilometre)"
            milesTextField.text = "\(distance.miles)"
            cmTextField.text = "\(distance.centimetre)"
            mmTextField.text = "\(distance.milimetre)"
            yardTextField.text = "\(distance.yard)"
            metreTextField.text = "\(distance.metre)"
            
        }
    }
}

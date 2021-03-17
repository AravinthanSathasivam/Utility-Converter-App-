//
//  SpeedViewController.swift
//  CW01
//
//  Created by user188409 on 3/16/21.
//

import UIKit

enum SpeedScales: Int {
    case metre_Sec ,kilometre_Hour, miles_Hour ,knot
}

class SpeedViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    @IBOutlet weak var metre_SecTextField: UITextField!
    @IBOutlet weak var km_HourTextField: UITextField!
    @IBOutlet weak var miles_HourTextField: UITextField!
    @IBOutlet weak var knotTextField: UITextField!
    
    //creating an object - Speed
    var speed : Speed = Speed(metre_Sec: 0.0, kilometre_Hour: 0.0, miles_Hour: 0.0, knot: 0.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allocateDelegate()
    }
    
    func allocateDelegate(){
        metre_SecTextField.delegate = self
        km_HourTextField.delegate = self
        miles_HourTextField.delegate = self
        knotTextField.delegate = self

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    @IBAction func handleTextField(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            metre_SecTextField.text = ""
            km_HourTextField.text = ""
            miles_HourTextField.text = ""
            knotTextField.text = ""
            return}
        
        switch SpeedScales(rawValue: sender.tag)! {
        
        case .metre_Sec:
            speed.metre_Sec = doubleTextFieldValue
            speed.kilometre_Hour = doubleTextFieldValue * 3.6
            speed.miles_Hour = doubleTextFieldValue * 2.237
            speed.knot = doubleTextFieldValue * 1.944
            
            km_HourTextField.text = "\(speed.kilometre_Hour)"
            miles_HourTextField.text = "\(speed.miles_Hour)"
            knotTextField.text = "\(speed.knot)"
            
        case .kilometre_Hour:
            speed.metre_Sec = doubleTextFieldValue * 0.278
            speed.kilometre_Hour = doubleTextFieldValue
            speed.miles_Hour = doubleTextFieldValue * 0.621
            speed.knot = doubleTextFieldValue * 0.54
            
            metre_SecTextField.text = "\(speed.metre_Sec)"
            miles_HourTextField.text = "\(speed.miles_Hour)"
            knotTextField.text = "\(speed.knot)"
            
        case .miles_Hour:
            speed.metre_Sec = doubleTextFieldValue * 0.447
            speed.kilometre_Hour = doubleTextFieldValue
            speed.miles_Hour = doubleTextFieldValue * 1.609
            speed.knot = doubleTextFieldValue * 0.869
            
            km_HourTextField.text = "\(speed.kilometre_Hour)"
            miles_HourTextField.text = "\(speed.miles_Hour)"
            knotTextField.text = "\(speed.knot)"
            
        case .knot:
            speed.metre_Sec = doubleTextFieldValue * 0.514
            speed.kilometre_Hour = doubleTextFieldValue * 1.852
            speed.miles_Hour = doubleTextFieldValue * 1.151
            speed.knot = doubleTextFieldValue
            
            metre_SecTextField.text = "\(speed.metre_Sec)"
            km_HourTextField.text = "\(speed.kilometre_Hour)"
            miles_HourTextField.text = "\(speed.miles_Hour)"
            
        }
        
    }
}

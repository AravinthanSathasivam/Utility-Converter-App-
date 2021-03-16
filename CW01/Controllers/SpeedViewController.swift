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
}

//
//  DataViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/17/21.
//

import UIKit

enum DataScales: Int {
    case kilobyte ,megabyte, gigabyte, terabyte
}

class DataViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    @IBOutlet weak var kbTextField: UITextField!
    @IBOutlet weak var mbTextField: UITextField!
    @IBOutlet weak var gbTextField: UITextField!
    @IBOutlet weak var tbTextField: UITextField!
    
    
    //creating an object - Data
    var data : Data = Data(kilobyte: 0.0, megabyte: 0.0, gigabyte: 0.0, terabyte: 0.0)
    
    var historyStringArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allocateDelegate()
    }
    
    func allocateDelegate(){
        kbTextField.delegate = self
        mbTextField.delegate = self
        gbTextField.delegate = self
        tbTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    
    @IBAction func handleTextEdit(_ sender: UITextField) {
        
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            kbTextField.text = ""
            mbTextField.text = ""
            gbTextField.text = ""
            tbTextField.text = ""
            return}
        
        switch DataScales(rawValue: sender.tag)! {
        
        case .kilobyte:
            data.kilobyte = doubleTextFieldValue
            data.megabyte = doubleTextFieldValue / 1024
            data.gigabyte = doubleTextFieldValue / 1048576
            data.terabyte = doubleTextFieldValue / 1073741824
            
            
            mbTextField.text = "\(data.megabyte)"
            gbTextField.text = "\(data.gigabyte)"
            tbTextField.text = "\(data.terabyte)"
            
        case .megabyte:
            data.kilobyte = doubleTextFieldValue * 1024
            data.megabyte = doubleTextFieldValue
            data.gigabyte = doubleTextFieldValue / 1024
            data.terabyte = doubleTextFieldValue / 1048576
            
            
            kbTextField.text = "\(data.kilobyte)"
            gbTextField.text = "\(data.gigabyte)"
            tbTextField.text = "\(data.terabyte)"
        
        case .gigabyte:
            data.kilobyte = doubleTextFieldValue *  1048576
            data.megabyte = doubleTextFieldValue * 1024
            data.gigabyte = doubleTextFieldValue
            data.terabyte = doubleTextFieldValue / 1024
            
            
            mbTextField.text = "\(data.megabyte)"
            kbTextField.text = "\(data.kilobyte)"
            tbTextField.text = "\(data.terabyte)"
            
        case .terabyte:
            data.kilobyte = doubleTextFieldValue * 1073741824
            data.megabyte = doubleTextFieldValue * 1048576
            data.gigabyte = doubleTextFieldValue * 1024
            data.terabyte = doubleTextFieldValue
            
            
            mbTextField.text = "\(data.megabyte)"
            gbTextField.text = "\(data.gigabyte)"
            kbTextField.text = "\(data.kilobyte)"
            
        }
    }
}

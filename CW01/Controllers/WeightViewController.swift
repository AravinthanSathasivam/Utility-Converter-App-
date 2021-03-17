//
//  WeightViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/17/21.
//

import UIKit

enum WeightScales: Int {
    case kg ,gram, ounce, pound, stone, s_pound
}

class WeightViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    @IBOutlet weak var ounceTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var gramTextField: UITextField!
    @IBOutlet weak var stoneTextField: UITextField!
    @IBOutlet weak var sPoundTextField: UITextField!
    @IBOutlet weak var kgTextField: UITextField!
    
    //creating an object - Weight
    
    var weight : Weight = Weight(kg: 0.0, gram: 0.0, ounce: 0.0, pound: 0.0, stone: 0.0, s_pound: 0.0)
    
    var historyStringArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allocateDelegate()
    }
    
    func allocateDelegate(){
        ounceTextField.delegate = self
        poundTextField.delegate = self
        gramTextField.delegate = self
        stoneTextField.delegate = self
        sPoundTextField.delegate = self
        kgTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    
    @IBAction func handleTextEdit(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            ounceTextField.text = ""
            poundTextField.text = ""
            gramTextField.text = ""
            stoneTextField.text = ""
            sPoundTextField.text = ""
            kgTextField.text = ""
            return}
        
        switch WeightScales(rawValue: sender.tag)! {
        
        case .kg:
            weight.kg = doubleTextFieldValue
            weight.gram = doubleTextFieldValue * 1000
            weight.ounce = doubleTextFieldValue * 35.274
            weight.pound = doubleTextFieldValue * 2.20462
            weight.s_pound = doubleTextFieldValue * 2.20462
            weight.stone = doubleTextFieldValue / 6.350
            
            
            ounceTextField.text = "\(weight.ounce)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .gram:
            weight.kg = doubleTextFieldValue / 1000
            weight.gram = doubleTextFieldValue
            weight.ounce = doubleTextFieldValue / 28.35
            weight.pound = doubleTextFieldValue / 453.592
            weight.s_pound = doubleTextFieldValue / 453.592
            weight.stone = doubleTextFieldValue / 6350.293
            
            
            ounceTextField.text = "\(weight.ounce)"
            poundTextField.text = "\(weight.pound)"
            kgTextField.text = "\(weight.kg)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .ounce:
            weight.kg = doubleTextFieldValue / 35.274
            weight.gram = doubleTextFieldValue * 28.35
            weight.ounce = doubleTextFieldValue
            weight.pound = doubleTextFieldValue / 16
            weight.s_pound = doubleTextFieldValue / 16
            weight.stone = doubleTextFieldValue / 224
            
            
            kgTextField.text = "\(weight.kg)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .pound:
            weight.kg = doubleTextFieldValue / 2.205
            weight.gram = doubleTextFieldValue * 453.592
            weight.ounce = doubleTextFieldValue * 16
            weight.pound = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue
            weight.stone = doubleTextFieldValue / 14
            
            
            ounceTextField.text = "\(weight.ounce)"
            kgTextField.text = "\(weight.kg)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .stone:
            weight.kg = doubleTextFieldValue * 6.35
            weight.gram = doubleTextFieldValue * 6350.293
            weight.ounce = doubleTextFieldValue * 224
            weight.pound = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue
            weight.stone = doubleTextFieldValue
            
            
            ounceTextField.text = "\(weight.ounce)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            kgTextField.text = "\(weight.kg)"
            sPoundTextField.text = "\(weight.s_pound)"
        
        case .s_pound:
            weight.kg = doubleTextFieldValue
            weight.gram = doubleTextFieldValue
            weight.ounce = doubleTextFieldValue
            weight.pound = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue
            weight.stone = doubleTextFieldValue
            
            
            ounceTextField.text = "\(weight.ounce)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            kgTextField.text = "\(weight.kg)"
        }
            

    }
    
    
    
}

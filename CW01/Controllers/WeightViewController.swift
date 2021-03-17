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
    
    @IBAction func handleTextField(_ sender: UITextField) {
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
        
        case .ounce:
            weight.ounce = doubleTextFieldValue
            weight.kg = doubleTextFieldValue / 35.274
            weight.gram = doubleTextFieldValue * 28.35
            weight.pound = doubleTextFieldValue / 16
            weight.s_pound = doubleTextFieldValue / 16
            weight.stone = doubleTextFieldValue / 224
            
            kgTextField.text = "\(weight.kg)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .pound:
            weight.ounce = doubleTextFieldValue * 16
            weight.kg = doubleTextFieldValue / 2.205
            weight.gram = doubleTextFieldValue * 453.592
            weight.pound = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue
            weight.stone = doubleTextFieldValue / 14
            
            kgTextField.text = "\(weight.kg)"
            ounceTextField.text = "\(weight.ounce)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
        
        case .gram:
            weight.ounce = doubleTextFieldValue / 28.35
            weight.kg = doubleTextFieldValue / 1000
            weight.gram = doubleTextFieldValue
            weight.pound = doubleTextFieldValue / 453.592
            weight.s_pound = doubleTextFieldValue / 453.592
            weight.stone = doubleTextFieldValue / 6350.293
            
            kgTextField.text = "\(weight.kg)"
            poundTextField.text = "\(weight.pound)"
            ounceTextField.text = "\(weight.ounce)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
            
        case .stone:
            weight.ounce = doubleTextFieldValue * 224
            weight.kg = doubleTextFieldValue * 6.35
            weight.gram = doubleTextFieldValue * 6350.293
            weight.pound = doubleTextFieldValue * 14
            weight.stone = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue * 14
            
            kgTextField.text = "\(weight.kg)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            ounceTextField.text = "\(weight.ounce)"
            sPoundTextField.text = "\(weight.s_pound)"
        
        case .s_pound:
            weight.ounce = doubleTextFieldValue * 16
            weight.kg = doubleTextFieldValue / 2.205
            weight.gram = doubleTextFieldValue * 453.592
            weight.pound = doubleTextFieldValue
            weight.s_pound = doubleTextFieldValue
            weight.stone = doubleTextFieldValue / 14
            
            kgTextField.text = "\(weight.kg)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            ounceTextField.text = "\(weight.ounce)"
            
        case .kg:
            weight.ounce = doubleTextFieldValue * 35.274
            weight.kg = doubleTextFieldValue
            weight.gram = doubleTextFieldValue * 1000
            weight.pound = doubleTextFieldValue * 2.20462
            weight.stone = doubleTextFieldValue / 6.350
            weight.s_pound = doubleTextFieldValue * 2.20462
            
            ounceTextField.text = "\(weight.ounce)"
            poundTextField.text = "\(weight.pound)"
            gramTextField.text = "\(weight.gram)"
            stoneTextField.text = "\(weight.stone)"
            sPoundTextField.text = "\(weight.s_pound)"
        }
    }
    
    
}

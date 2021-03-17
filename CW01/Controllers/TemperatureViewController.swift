//
//  TemperatureViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/14/21.
//

import UIKit

enum TemperatureScales: Int {
    case celsius ,fahrenheit, kelvin
}

class TemperatureViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var keyboardView: CustomKeyboard!
    @IBOutlet weak var celsiusTextField: UITextField!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var kelvinTextField: UITextField!
    
    //creating an object - Temperature
    var temperature : Temperature = Temperature(celsius: 0.0, fahrenheit: 0.0, kelvin: 0.0)
    
    var historyStringArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allocateDelegate()
        historyStringArray.append(contentsOf: loadDefaults("TemperatureHistory"))
    }
    
    func allocateDelegate(){
        celsiusTextField.delegate = self
        fahrenheitTextField.delegate = self
        kelvinTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    
    @IBAction func handleTextField(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            celsiusTextField.text = ""
            fahrenheitTextField.text = ""
            kelvinTextField.text = ""
            return}
        
        switch TemperatureScales(rawValue: sender.tag)! {
        
        case .celsius:
            temperature.celsius = doubleTextFieldValue
            temperature.fahrenheit = (doubleTextFieldValue * 9/5 + 32)
            temperature.kelvin = doubleTextFieldValue + 273.15
            
            fahrenheitTextField.text = "\(temperature.fahrenheit)"
            kelvinTextField.text = "\(temperature.kelvin)"
        
        case .fahrenheit:
            temperature.celsius = (doubleTextFieldValue - 32) * 5/9
            temperature.fahrenheit = doubleTextFieldValue
            temperature.kelvin = (doubleTextFieldValue - 32) * 5/9 + 273.15
            
            celsiusTextField.text = "\(temperature.celsius)"
            kelvinTextField.text = "\(temperature.kelvin)"
        
        case .kelvin:
            temperature.celsius = doubleTextFieldValue - 273.15
            temperature.fahrenheit = (doubleTextFieldValue - 273.15 ) * 9/5 + 32
            temperature.kelvin = doubleTextFieldValue
            
            celsiusTextField.text = "\(temperature.celsius)"
            fahrenheitTextField.text = "\(temperature.fahrenheit)"
            
        }
    }
    
    func saveTemperature(){
        
        let defaults = UserDefaults.standard
        let historyString = temperature.getTemperature()
        
        historyStringArray.append(historyString)
        defaults.setValue(historyStringArray, forKey: "TemperatureHistory")
        
    }
    
    func loadDefaults(_ historyKey: String) -> [String] {
        let defaults = UserDefaults.standard
        
        return defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    @IBAction func onPressSave(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        let historyString = temperature.getTemperature()
        
        historyStringArray.append(historyString)
        defaults.setValue(historyStringArray, forKey: "TemperatureHistory")
    }
    
}



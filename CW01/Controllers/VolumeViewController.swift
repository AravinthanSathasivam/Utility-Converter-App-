//
//  VolumeViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/17/21.
//

import UIKit

enum VolumeScales: Int {
    case ukGallon ,ukPint, f_ounce, litre, mililitre
}

class VolumeViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    @IBOutlet weak var ukGallonTF: UITextField!
    @IBOutlet weak var ukPintTF: UITextField!
    @IBOutlet weak var f_OunceTF: UITextField!
    @IBOutlet weak var litreTF: UITextField!
    @IBOutlet weak var miliLitreTF: UITextField!
    
    //creating an object - Volume
    var volume : Volume = Volume(ukGallon: 0.0, ukPint: 0.0, f_ounce: 0.0, litre: 0.0, stone: 0.0, mililitre: 0.0)
    
    var historyStringArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allocateDelegate()
    }
    
    func allocateDelegate(){
        ukGallonTF.delegate = self
        ukPintTF.delegate = self
        f_OunceTF.delegate = self
        litreTF.delegate = self
        miliLitreTF.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.activeTextField = textField
        textField.inputView = UIView()
    }
    @IBAction func handleText(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else {
            ukGallonTF.text = ""
            ukPintTF.text = ""
            f_OunceTF.text = ""
            litreTF.text = ""
            miliLitreTF.text = ""
            return}
        
        switch VolumeScales(rawValue: sender.tag)! {
        
        case .ukGallon:
            volume.ukGallon = doubleTextFieldValue
            volume.ukPint = doubleTextFieldValue * 8
            volume.f_ounce = doubleTextFieldValue * 160
            volume.litre = doubleTextFieldValue * 4.546
            volume.mililitre = doubleTextFieldValue * 4546.09
            
            ukPintTF.text = "\(volume.ukPint)"
            f_OunceTF.text = "\(volume.f_ounce)"
            litreTF.text = "\(volume.litre)"
            miliLitreTF.text = "\(volume.mililitre)"
            
        case .ukPint:
            volume.ukGallon = doubleTextFieldValue / 8
            volume.ukPint = doubleTextFieldValue
            volume.f_ounce = doubleTextFieldValue * 20
            volume.litre = doubleTextFieldValue / 1.76
            volume.mililitre = doubleTextFieldValue * 568.261
            
            ukGallonTF.text = "\(volume.ukGallon)"
            f_OunceTF.text = "\(volume.f_ounce)"
            litreTF.text = "\(volume.litre)"
            miliLitreTF.text = "\(volume.mililitre)"
            
        case .f_ounce:
            volume.ukGallon = doubleTextFieldValue / 160
            volume.ukPint = doubleTextFieldValue / 20
            volume.f_ounce = doubleTextFieldValue
            volume.litre = doubleTextFieldValue / 35.195
            volume.mililitre = doubleTextFieldValue * 28.413
            
            ukPintTF.text = "\(volume.ukPint)"
            ukGallonTF.text = "\(volume.ukGallon)"
            litreTF.text = "\(volume.litre)"
            miliLitreTF.text = "\(volume.mililitre)"
            
        case .litre:
            volume.ukGallon = doubleTextFieldValue / 3.785
            volume.ukPint = doubleTextFieldValue * 1.76
            volume.f_ounce = doubleTextFieldValue * 35.195
            volume.litre = doubleTextFieldValue
            volume.mililitre = doubleTextFieldValue * 1000
            
            ukPintTF.text = "\(volume.ukPint)"
            f_OunceTF.text = "\(volume.f_ounce)"
            ukGallonTF.text = "\(volume.ukGallon)"
            miliLitreTF.text = "\(volume.mililitre)"
            
        case .mililitre:
            volume.ukGallon = doubleTextFieldValue / 3785.412
            volume.ukPint = doubleTextFieldValue / 568.261
            volume.f_ounce = doubleTextFieldValue / 28.413
            volume.litre = doubleTextFieldValue / 1000
            volume.mililitre = doubleTextFieldValue
            
            ukPintTF.text = "\(volume.ukPint)"
            f_OunceTF.text = "\(volume.f_ounce)"
            litreTF.text = "\(volume.litre)"
            ukGallonTF.text = "\(volume.ukGallon)"
            

        
        }
    }
    
}

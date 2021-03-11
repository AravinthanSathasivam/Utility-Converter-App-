//
//  ConvertionViewController.swift
//  CW01
//
//  Created by user188409 on 3/8/21.
//

import UIKit

class ConvertionViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var keyboardView: CustomKeyboard!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstView.alpha = 1
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
            fifthView.alpha = 0
        }else if sender.selectedSegmentIndex == 1{
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
            fourthView.alpha = 0
            fifthView.alpha = 0
        }else if sender.selectedSegmentIndex == 2{
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
            fourthView.alpha = 0
            fifthView.alpha = 0
            
        }else if sender.selectedSegmentIndex == 3{
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 1
            fifthView.alpha = 0
            
        }else if sender.selectedSegmentIndex == 4{
            
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 0
            fourthView.alpha = 0
            fifthView.alpha = 1
            
        }
        
    }
    

}

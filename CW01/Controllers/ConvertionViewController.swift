//
//  ConvertionViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/8/21.
//

import UIKit

class ConvertionViewController: UIViewController {
    
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var volumeView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var speedView: UIView!
    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var keyboardView: CustomKeyboard!
    
    enum Segues {
        static let  toTemperature = "ToTemperature"
        static let toSpeed = "ToSpeed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing data to temperature View Controller
        if segue.identifier == Segues.toTemperature{
            let tempVC = segue.destination as! TemperatureViewController
            tempVC.keyboardView = keyboardView
        }
        // Passing data to speed View Controller 
        else if segue.identifier == Segues.toSpeed{
            let speedVC = segue.destination as! SpeedViewController
            speedVC.keyboardView = keyboardView
        }
    }
    
    //Segment Control to switch between Views
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            weightView.alpha = 1
            temperatureView.alpha = 0
            volumeView.alpha = 0
            distanceView.alpha = 0
            speedView.alpha = 0
            dataView.alpha = 0
        }else if sender.selectedSegmentIndex == 1{
            weightView.alpha = 0
            temperatureView.alpha = 1
            volumeView.alpha = 0
            distanceView.alpha = 0
            speedView.alpha = 0
            dataView.alpha = 0
        }else if sender.selectedSegmentIndex == 2{
            weightView.alpha = 0
            temperatureView.alpha = 0
            volumeView.alpha = 1
            distanceView.alpha = 0
            speedView.alpha = 0
            dataView.alpha = 0
            
        }else if sender.selectedSegmentIndex == 3{
            weightView.alpha = 0
            temperatureView.alpha = 0
            volumeView.alpha = 0
            distanceView.alpha = 1
            speedView.alpha = 0
            dataView.alpha = 0
            
        }else if sender.selectedSegmentIndex == 4{
            
            weightView.alpha = 0
            temperatureView.alpha = 0
            volumeView.alpha = 0
            distanceView.alpha = 0
            speedView.alpha = 1
            dataView.alpha = 0
            
        }else if sender.selectedSegmentIndex == 5{
            
            weightView.alpha = 0
            temperatureView.alpha = 0
            volumeView.alpha = 0
            distanceView.alpha = 0
            speedView.alpha = 0
            dataView.alpha = 1
            
        }
        
    }
    

}

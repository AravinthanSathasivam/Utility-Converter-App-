//
//  Data.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/15/21.
//

import Foundation


class Data {
    
    var kilobyte : Double
    var megabyte : Double
    var gigabyte : Double
    var terabyte : Double
    
    init(kilobyte: Double, megabyte: Double, gigabyte: Double, terabyte: Double){
        self.kilobyte = kilobyte
        self.megabyte = megabyte
        self.gigabyte = gigabyte
        self.terabyte = terabyte
    }
    
    func getDistance() -> String {
        return "\(self.kilobyte) kilobyte | \(self.megabyte) megabyte | \(self.gigabyte) gigabyte |\(self.terabyte) terabyte "
        
    }
    
}

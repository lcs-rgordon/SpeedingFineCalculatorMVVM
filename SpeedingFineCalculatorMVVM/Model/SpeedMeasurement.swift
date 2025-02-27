//
//  SpeedMeasurement.swift
//  SpeedingFineCalculatorMVVM
//
//  Created by Russell Gordon on 2025-02-26.
//

import Foundation

// MODEL
struct SpeedMeasurement {
    
    // MARK: Stored properties
    let speedLimit: Int
    let speedOfCar: Int
    
    // MARK: Computed properties
    var amountOverLimit: Int {
        return speedOfCar - speedLimit
    }
    
    var report: String {
        
        if amountOverLimit > 30 {
            return "You are speeding and your fine is $500."
        } else if amountOverLimit > 20 {
            return "You are speeding and your fine is $270."
        } else if amountOverLimit > 0 {
            return "You are speeding and your fine is $100."
        } else {
            return "Congratulations, you are within the speed limit!"
        }
        
    }
    
}

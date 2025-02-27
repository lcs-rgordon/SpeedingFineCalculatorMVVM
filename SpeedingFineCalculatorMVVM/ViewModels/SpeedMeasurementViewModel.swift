//
//  SpeedMeasurementViewModel.swift
//  SpeedingFineCalculatorMVVM
//
//  Created by Russell Gordon on 2025-02-26.
//

import Foundation

// VIEW MODEL
@Observable
class SpeedMeasurementViewModel {
    
    // MARK: Stored properties
    var providedSpeedLimit: String
    var providedSpeedOfCar: String
    var recoverySuggestion: String
    
    // MARK: Computed properties
    var measurement: SpeedMeasurement? {
        
        // Ensure provided inputs are integers and more than zero
        guard let speedLimit = Int(providedSpeedLimit), speedLimit > 0 else {
            recoverySuggestion = "Please provide a positive integer for the speed limit."
            return nil
        }
        guard let speedOfCar = Int(providedSpeedOfCar), speedOfCar > 0 else {
            recoverySuggestion = "Please provide a positive integer for the speed of the car."
            return nil
        }
        
        // Return the speed measurement result
        recoverySuggestion = ""
        return SpeedMeasurement(speedLimit: speedLimit, speedOfCar: speedOfCar)
        
    }
    
    // MARK: Initializer
    init(
        providedSpeedLimit: String = "",
        providedSpeedOfCar: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedSpeedLimit = providedSpeedLimit
        self.providedSpeedOfCar = providedSpeedOfCar
        self.recoverySuggestion = recoverySuggestion
    }
    
}

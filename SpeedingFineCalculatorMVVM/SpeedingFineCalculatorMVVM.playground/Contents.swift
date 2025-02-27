import Cocoa

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

// TEST THE MODEL
let exampleOne = SpeedMeasurement(speedLimit: 80, speedOfCar: 75)
exampleOne.amountOverLimit
exampleOne.report

let exampleTwo = SpeedMeasurement(speedLimit: 80, speedOfCar: 87)
exampleTwo.amountOverLimit
exampleTwo.report

let exampleThree = SpeedMeasurement(speedLimit: 80, speedOfCar: 103)
exampleThree.amountOverLimit
exampleThree.report

let exampleFour = SpeedMeasurement(speedLimit: 80, speedOfCar: 141)
exampleFour.amountOverLimit
exampleFour.report

// VIEW MODEL
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

// TEST THE VIEW MODEL

// Create the view model
var viewModel = SpeedMeasurementViewModel()

// Try invalid speed limit
viewModel.providedSpeedLimit = "Eighty"
viewModel.providedSpeedOfCar = "85"
viewModel.measurement?.amountOverLimit
viewModel.measurement?.report
viewModel.recoverySuggestion

// Try invalid speed
viewModel.providedSpeedLimit = "90"
viewModel.providedSpeedOfCar = "One hundred!"
viewModel.measurement?.amountOverLimit
viewModel.measurement?.report
viewModel.recoverySuggestion

// Try invalid speed limit
viewModel.providedSpeedLimit = "-10"
viewModel.providedSpeedOfCar = "70"
viewModel.measurement?.amountOverLimit
viewModel.measurement?.report
viewModel.recoverySuggestion

// Try invalid speed
viewModel.providedSpeedLimit = "60"
viewModel.providedSpeedOfCar = "-70"
viewModel.measurement?.amountOverLimit
viewModel.measurement?.report
viewModel.recoverySuggestion

// Try reasonable inputs
viewModel.providedSpeedLimit = "80"
viewModel.providedSpeedOfCar = "86"
viewModel.measurement?.amountOverLimit
viewModel.measurement?.report
viewModel.recoverySuggestion

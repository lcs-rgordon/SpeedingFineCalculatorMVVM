//
//  SpeedMeasurementItemView.swift
//  SpeedingFineCalculatorMVVM
//
//  Created by Russell Gordon on 2025-02-26.
//

import SwiftUI

struct SpeedMeasurementItemView: View {
    
    // MARK: Stored properties
    let measurement: SpeedMeasurement
    
    var body: some View {
        VStack(alignment: .leading) {
            LabeledContent("Speed limit", value: "\(measurement.speedLimit)")
            LabeledContent("Speed of car", value: "\(measurement.speedOfCar)")
            Text(measurement.report)
                .italic()
        }
    }
}

#Preview {
    SpeedMeasurementItemView(
        measurement: SpeedMeasurement(speedLimit: 80, speedOfCar: 85)
    )
    .padding()
}

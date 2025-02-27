//
//  SpeedMeasurementView.swift
//  SpeedingFineCalculatorMVVM
//
//  Created by Russell Gordon on 2025-02-26.
//

import SwiftUI

struct SpeedMeasurementView: View {
    
    // MARK: Stored properties
    @State var viewModel = SpeedMeasurementViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // OUTPUT
            if let measurement = viewModel.measurement {
                
                VStack(spacing: 0) {
                    
                    Text(measurement.report)
                        .font(.title2)
                    
                }
                .frame(height: 200)
                
            } else {
                
                ContentUnavailableView(
                    "Unable to evaluate speed",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                    .frame(height: 200)

            }
            
            // INPUT
            TextField("Enter the speed limit", text: $viewModel.providedSpeedLimit)
                .textFieldStyle(.roundedBorder)

            TextField("Enter the speed of the car", text: $viewModel.providedSpeedOfCar)
                .textFieldStyle(.roundedBorder)
                        
            Spacer()
        }
        .navigationTitle("Photo Radar Prototype")
        .padding()
    }

}

#Preview {
    NavigationStack {
        SpeedMeasurementView()
    }
}

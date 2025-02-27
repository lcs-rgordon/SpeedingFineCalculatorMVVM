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
                    
                    SpeedMeasurementItemView(measurement: measurement)
                        .font(.title2)
                    
                    // Add a button so that the result can be saved
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical)

                    
                }
                .frame(height: 250)
                
            } else {
                
                ContentUnavailableView(
                    "Unable to evaluate speed",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                    .frame(height: 250)

            }
            
            // INPUT
            TextField("Enter the speed limit", text: $viewModel.providedSpeedLimit)
                .textFieldStyle(.roundedBorder)

            TextField("Enter the speed of the car", text: $viewModel.providedSpeedOfCar)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("History")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
                        
            // Iterate over the list of results
            List(viewModel.resultHistory) { currentResult in
                
                SpeedMeasurementItemView(measurement: currentResult)

            }
            .listStyle(.plain)

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

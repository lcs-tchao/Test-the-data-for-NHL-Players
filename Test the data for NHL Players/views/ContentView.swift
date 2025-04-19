//
//  ContentView.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-04-04.
//

//
//  Created by Yuk Yeung Chao on 2025-03-29.
//

import Foundation
//
//  View.swift
//  Joke
//
//  Created by Yuk Yeung Chao on 2025-03-28.
//

import SwiftUI
struct PlayerView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default joke)
    @State var viewModel = PlayerViewModel()
    
 
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentPlayer = viewModel.currentPlayer {
                
                Group {
                    Text(currentPlayer.name)
                    Text(currentPlayer.positionCode)
                    Text(currentPlayer.teamAbbre ?? "")
                    Text(currentPlayer.lastTeamId ?? "")
                    Text(currentPlayer.lastTeamAbbre ?? "")
                    Text(currentPlayer.lastSeasonId ?? "")
                    
                    if let sweater = currentPlayer.sweaterNumber {
                        Text("Sweater Number: \(sweater)")
                    }
                    
                    Text("Active: \(currentPlayer.active ? "Yes" : "No")")
                    Text("Height: \(currentPlayer.height)")
                    Text("Height in Inches: \(currentPlayer.heightInInches)")
                    Text("Height in cm: \(currentPlayer.heightInCentimeters)")
                    Text("Weight: \(currentPlayer.weightInPounds) lbs / \(currentPlayer.weightInKilograms) kg")
                    Text("Birth City: \(currentPlayer.birthCity)")
                    
                    if let province = currentPlayer.birthStateProvince {
                        Text("Birth Province: \(province)")
                    }
                    
                    Text("Birth Country: \(currentPlayer.birthCountry)")
                } 
                .font(.title)
                .multilineTextAlignment(.center)
                
                
            }
            
        }
    }
}
 
#Preview {
    PlayerView()
}

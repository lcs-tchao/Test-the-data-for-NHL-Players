//
//  Detail View.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-04-17.
//


import SwiftUI
struct PlayerDetailView: View {
    
    // MARK: Stored properties
    
    // Create the view model (temporarily show the default joke)
    @State var viewModelDetail = PlayerDetailViewModel()
    
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let stats = viewModelDetail.currentPlayer {
                
                Group {
//                    Text("Player ID: \(stats.playerId)")
//                    Text("Team: \(stats.fullTeamName["default"] ?? "Unknown Team")")
//                    Text("Goals: \(stats.goals)")
//                    Text("Assists: \(stats.assists)")
//                    Text("Points: \(stats.points)")
//                    Text("Games Played: \(stats.gamesPlayed)")
//                    Text("Goals: \(stats.goals)")
//                    Text("Assists: \(stats.assists)")
//                    Text("Points: \(stats.points)")
//                    Text("Plus/Minus: \(stats.plusMinus)")
//                    Text("Penalty Minutes: \(stats.pim)")
//                    Text("Power Play Goals: \(stats.powerPlayGoals)")
//                    Text("Power Play Points: \(stats.powerPlayPoints)")
//                    Text("Shorthanded Goals: \(stats.shorthandedGoals)")
//                    Text("Shorthanded Points: \(stats.shorthandedPoints)")
//                    Text("Game-Winning Goals: \(stats.gameWinningGoals)")
//                    Text("Overtime Goals: \(stats.otGoals)")
//                    Text("Shots: \(stats.shots)")
//                    Text("Shooting %: \(String(format: "%.2f", stats.shootingPctg * 100))%")
                }
                .font(.title)
                .multilineTextAlignment(.center)
            }
           
        }
    }
}

#Preview {
    PlayerDetailView()
}

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
            if let currentPlayer = viewModelDetail.currentPlayer {
                
                Group {
                    Text(currentPlayer.fullTeamName.english)
                    Text(currentPlayer.fullTeamName.french)
                    Text("Assists: \(currentPlayer.featuredStats.regularSeason.career.assists)")
                    Text("Game Winning Goals: \(currentPlayer.featuredStats.regularSeason.career.gameWinningGoals)")
                    Text("Games Played: \(currentPlayer.featuredStats.regularSeason.career.gamesPlayed)")
                    Text("Goals: \(currentPlayer.featuredStats.regularSeason.career.goals)")
                    Text("Ot Goals: \(currentPlayer.featuredStats.regularSeason.career.otGoals)")
                    Text("Pim: \(currentPlayer.featuredStats.regularSeason.career.pim)")
                    Text("Plus Minus: \(currentPlayer.featuredStats.regularSeason.career.plusMinus)")
                    Text("Points: \(currentPlayer.featuredStats.regularSeason.career.points)")
                    Text("Power Play Goals: \(currentPlayer.featuredStats.regularSeason.career.powerPlayGoals)")
                    Text("Power Play Points: \(currentPlayer.featuredStats.regularSeason.career.powerPlayPoints)")
                    Text("Shooting Percentage: \(currentPlayer.featuredStats.regularSeason.career.shootingPctg)")
                    Text("Short handed Goals: \(currentPlayer.featuredStats.regularSeason.career.shorthandedGoals)")
                    Text("Short handed points: \(currentPlayer.featuredStats.regularSeason.career.shorthandedPoints)")
                    Text("Shots: \(currentPlayer.featuredStats.regularSeason.career.shots)")
                    
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

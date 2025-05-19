//
//  PlayerInterfaceView.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-05-18.
//

import SwiftUI

struct PlayerInterfaceView: View {

    // MARK: Stored properties
    let player: Player
    @State var viewModelInterface = PlayerInterfaceViewModel()

    // MARK: Computed properties
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let currentPlayer = viewModelInterface.currentPlayer {

                    // Team Logo
                    AsyncImage(url: URL(string: currentPlayer.teamLogo)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                    //Learned from Chat gpt ( AsyncImage)
                    // Headshot
                    AsyncImage(url: URL(string: currentPlayer.headshot)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    // Meaning of a placeholder show something temporarily while it's loading
                    
                    Text("#\(currentPlayer.sweaterNumber)  \(currentPlayer.position)")
                        .font(.title2)
                        .bold()

                    // Hero Image
                    AsyncImage(url: URL(string: currentPlayer.heroImage)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }

                    // Height and Weight
                    HStack {
                        VStack {
                            Text("Height")
                                .font(.caption)
                            Text("\(currentPlayer.heightInInches) in / \(currentPlayer.heightInCentimeters) cm")
                        }
                        Spacer()
                        VStack {
                            Text("Weight")
                                .font(.caption)
                            Text("\(currentPlayer.weightInPounds) lbs / \(currentPlayer.weightInKilograms) kg")
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                    // Birth Info
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Born: \(currentPlayer.birthDate)")
                        Text("Birth City: \(currentPlayer.birthCity.default)")
                    }

                }
                NavigationLink(destination: PlayerDetailView(player: player)) {
                    Rectangle()
                        .fill(Color(.systemGray6))
                        .frame(width: 320, height: 80)
                        .cornerRadius(10)
                        .overlay(
                            Text("Career Stats")
                                .foregroundColor(.black)
                                .bold()
                        )
                }
                
            }
            .padding()
        }
        .navigationTitle("Player Info")
        .task {
            await viewModelInterface.fetchPlayer(for: player.playerId)
        }
    }
}

// MARK: - Preview

#Preview {
    let samplePlayer = Player(
        playerId: "8478402",
        name: "Connor McDavid",
        positionCode: "C",
        teamId: "22",
        teamAbbre: "EDM",
        lastTeamId: nil,
        lastTeamAbbre: nil,
        lastSeasonId: nil,
        sweaterNumber: 97,
        active: true,
        height: "6'1\"",
        heightInInches: 73,
        heightInCentimeters: 185,
        weightInPounds: 193,
        weightInKilograms: 88,
        birthCity: "Richmond Hill",
        birthStateProvince: "ON",
        birthCountry: "Canada"
    )

    return NavigationView {
        PlayerInterfaceView(player: samplePlayer)
    }
}


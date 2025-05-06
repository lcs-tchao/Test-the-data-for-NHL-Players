//
//  ContentView.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-04-04.
//

//
//  Created by Yuk Yeung Chao on 2025-03-29.

import SwiftUI

struct PlayerView: View {
    @State var viewModel = PlayerViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.filteredPlayers) { player in
                Text(player.name)
            }
            .navigationTitle("NHL Players")
            .searchable(text: $viewModel.searchText)
            // This runs whenever the searchText changes
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                Task {
                    await viewModel.fetchPlayer(playerName: viewModel.searchText)
                }
            }
        }
    }
}

#Preview {
    PlayerView()
}

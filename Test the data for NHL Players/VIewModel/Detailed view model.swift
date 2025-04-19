//
//  Detailed view model.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-04-16.
//

import Foundation

@Observable
class PlayerViewModelDetail {
    
    // MARK: Stored properties
    
    // Whatever player has most recently been downloaded
    // from the endpoint
    var currentPlayer: PlayerDetail?
    
    
    // Holds a list of favourite jokes
    var favouritePlayer: [PlayerDetail] = []
    
    // MARK: Initializer(s)
    init(currentPlayer: PlayerDetail? = nil) {
        
        // Take whatever joke was provided when an instance of
        // this view model is created, and make it the current joke.
        //
        // Otherwise, the default value for the current joke
        // will be a nil.
        self.currentPlayer = currentPlayer
        
        // Load a joke from the endpoint
        Task {
            await self.fetchPlayer()
        }
    }
    
    // Add the current joke to the list of favourites
    func saveJoke() {
        
        // Save current joke
        if let currentPlayer = self.currentPlayer {
            favouritePlayer.insert(currentPlayer, at: 0)
        }
        
        // How many saved jokes are there now?
        print("There are \(favouritePlayer.count) jokes saved.")
        
    }
    // MARK: Function(s)
    
    // This loads a new joke from the endpoint
    //
    // "async" means it is an asynchronous function.
    //
    // That means it can be run alongside other functionality
    // in our app. Since this function might take a while to complete
    // this ensures that other parts of our app, such as the user
    // interface, won't "freeze up" while this function does it's job.
    //async is a code that allow user do other things on the app when the app is access to the internet.
    
    func fetchPlayer() async {
        
        // 1. Attempt to create a URL from the address provided
        let endpoint = "https://api-web.nhle.com/v1/player/8478402/landing"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        // 2. Fetch the raw data from the URL
        //
        // Network requests can potentially fail (throw errors) so
        // we complete them within a do-catch block to report errors
        // if they occur.
        //
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Print the received data in the debug console
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            // 3. Decode the data into a Swift data type
            
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data
            // into an instance of our Swift data type
            //just the data type is different
            let decodedData = try decoder.decode([PlayerDetail].self, from: data)
            
            // If we got here, decoding succeeded,
            // return the instance of our data type
            self.currentPlayer = decodedData.first!
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error)
            
        }
    }
    
}

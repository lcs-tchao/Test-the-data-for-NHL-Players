//
//  detail model.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-04-16.
//

import Foundation

struct RegularSeason: Codable{
    let subSeason: StatisticsLine
    let career: StatisticsLine
}

struct FeaturedStats: Codable {
    let season: Int
    let regularSeason: RegularSeason
}
struct StatisticsLine: Codable {
    let assists: Int
    let gameWinningGoals: Int
    let gamesPlayed: Int
    let goals: Int
    let otGoals: Int
    let pim: Int
    let plusMinus: Int
    let points: Int
    let powerPlayGoals: Int
    let powerPlayPoints: Int
    let shootingPctg: Double
    let shorthandedGoals: Int
    let shorthandedPoints: Int
    let shots: Int
}

struct FullTeamName: Codable {
    let english: String
    let french: String
   
    //provide ncoding and decoding hints when pulling data from endpoint
    enum CodingKeys: String, CodingKey {
        case english = "default"
        case french = "fr"
    }
}


struct PlayerDetail: Identifiable, Codable {
    
       let id = UUID()
    let playerId: Int
       let isActive: Bool
       let currentTeamId: Int
       let currentTeamAbbrev: String
    let fullTeamName: FullTeamName
    let featuredStats: FeaturedStats
      
}

//let examplePlayer1 = PlayerDetail(
//    playerId: 8478402,
//    isActive: true,
//    currentTeamId: 22,
//    currentTeamAbbrev: "EDM",
//    fullTeamName: ["default": "Edmonton Oilers", "fr": "Oilers d'Edmonton"], // Corrected the closing bracket here
//    assists: 720,
//    gameWinningGoals: 72,
//    gamesPlayed: 711,
//    goals: 361,
//    otGoals: 16,
//    pim: 286,
//    plusMinus: 168,
//    points: 1081,
//    powerPlayGoals: 87,
//    powerPlayPoints: 364,
//    shootingPctg: 0.15,
//    shorthandedGoals: 8,
//    shorthandedPoints: 17,
//    shots: 2406
//)

//
//  Player interface.swift
//  Test the data for NHL Players
//
//  Created by Yuk Yeung Chao on 2025-05-18.
//

import Foundation

struct PlayerInterface: Identifiable, Codable {
    let id = UUID()
    
    let teamLogo: String
    let sweaterNumber: Int
    let position: String
    let headshot: String
    let heroImage: String
    let heightInInches: Int
    let heightInCentimeters: Int
    let weightInPounds: Int
    let weightInKilograms: Int
    let birthDate: String
    let birthCity: BirthCity
}

struct BirthCity: Codable {
    let `default`: String
}

//
//  PokemonList.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/04/21.
//

import Foundation

struct ResponsePokemonList: Codable {
    
    var count: Int
    var next: String
    var results: [PokemonList]
    
}

struct PokemonList: Codable, Identifiable {
    
    var id = UUID()
    var name: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case url
    }
    
}

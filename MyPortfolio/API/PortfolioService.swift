//
//  PortfolioService.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/04/21.
//

import Combine
import Foundation

protocol PortfolioService {
    
    func getPokemons() -> AnyPublisher<ResponsePokemonList, APIError>
}

extension PortfolioService {
    
    func getPokemons() -> AnyPublisher<ResponsePokemonList, APIError> {
        return APISession.request(with: APIEndpoints.getPokemons)
            .eraseToAnyPublisher()
    }
}

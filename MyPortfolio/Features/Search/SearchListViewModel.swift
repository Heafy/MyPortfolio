//
//  SearchListViewModel.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 03/04/21.
//

import Combine
import Foundation

class SearchListViewModel: ObservableObject, PortfolioService {

    @Published var isLoading: Bool = false
    @Published var pokemonList: [PokemonList] = []
    var cancellables = Set<AnyCancellable>()
    
    func getPokemons() {
        let cancellable = self.getPokemons().sink(receiveCompletion: {
            result in
            switch result {
            case .failure(let error):
                self.isLoading = false
                print("Error Get Pokemons: \(error)")
                //self.isAnimating = false
            case .finished:
                break
            }
        }, receiveValue: {
            (responsePokemonList) in
            self.isLoading = false
            self.pokemonList = responsePokemonList.results
        })
        cancellables.insert(cancellable)
    }
}

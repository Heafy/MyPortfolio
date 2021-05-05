//
//  SearchListView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 03/04/21.
//

import SwiftUI

struct SearchListView: View {
    
    @State private var searchText : String = ""
    @ObservedObject var viewModel = SearchListViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            List {
                ForEach( viewModel.pokemonList.filter {
                    pokemon in
                    return searchText.isEmpty ? true : pokemon.name.contains(self.searchText)
                } ) {
                   pokemon in
                    Text(pokemon.name)
                        .textCase(.uppercase)
                } //: ForEach
                .redacted(reason: viewModel.isLoading ? .placeholder: [])
            } //: List
            .onAppear(perform: {
                viewModel.isLoading = true
                viewModel.getPokemons()
            })
            .navigationBarTitle("Search list", displayMode: .inline)
        } //: VStack
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}

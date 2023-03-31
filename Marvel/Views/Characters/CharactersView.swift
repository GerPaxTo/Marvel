//
//  CharactersView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel : viewModelMarvel
    @State private var filter = ""
    
    var body: some View {
        NavigationStack{
            List{
                if let chars = viewModel.characters?.data.results {
                    ForEach(chars) { char in
                        NavigationLink {
                            ListaSeriesView(id: char.id, char: char.name)
                        } label: {
                            //HeroesRowView(hero: hero)
                            charactersRowView(chars: char)
                            //Text(char.name)
                        }
                    }
                }
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: viewModelMarvel(testing: true))
    }
}

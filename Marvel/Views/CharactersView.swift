//
//  CharactersView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel : viewModelCharacters
    @State private var filter = ""
    
    var body: some View {
        NavigationStack{
            List{
                if let chars = viewModel.chars?.data.results {
                    ForEach(chars) { char in
                        NavigationLink {
                            //Detalle view
                            //HeroesDetailView(hero: hero)
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

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: viewModelCharacters(testing: true))
    }
}

//
//  charactersRowView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 29/03/23.
//

import SwiftUI

struct charactersRowView: View {
    var chars: Character
    
    var body: some View {
        VStack{
            //foto del heroe
            AsyncImage(url: URL(string: "\(chars.thumbnail.path).\(chars.thumbnail.extension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 20)
                    .opacity(0.9)

            } placeholder: {
                Text("Cargando foto...")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Text("\(chars.name)")
                .font(.title2)
                .foregroundColor(.red)
                .bold()
        }
    }
}

struct charactersRowView_Previews: PreviewProvider {
    static var previews: some View {
        charactersRowView(chars: Character(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"), urls: [["String" : "String"]]))
    }
}


//
//  MainView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0
    @EnvironmentObject var rootviewModel: RootViewModel
    
    var body: some View {
        
        ZStack {
            VStack{
                Image(decorative: "Logo")
                    .resizable()
                    .frame(width:150, height: 75)
                
                TabView(selection: $selection){
                    //Tab1
                    CharactersView(viewModel: viewModelCharacters())
                    
                    
                }
            }

        }
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(RootViewModel())
    }
}

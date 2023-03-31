//
//  MainView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 0
    @EnvironmentObject var rootviewModel: viewModelMarvel
    
    var body: some View {
        
        ZStack {
            VStack{
                Image(decorative: "Logo")
                    .resizable()
                    .frame(width:150, height: 50)
                
                TabView(selection: $selection){
                    //Tab1
                    CharactersView(viewModel: viewModelMarvel())
                    
                    
                }
            }

        }
    }
}

struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(viewModelMarvel())
    }
}

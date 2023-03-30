//
//  RootView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            MainView()
        case .register:
            Text("Registro")
        case .loaded:
            MainView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .loading:
            LoaderView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}

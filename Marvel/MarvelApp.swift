//
//  MarvelApp.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

@main
struct MarvelApp: App {
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            RootView()
                .environmentObject(rootViewModel)
                
        }
    }
}

//
//  LoaderView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var animationAmount = 0.2
    @State private var animate = false
    
    var body: some View {
        VStack{
            Image(decorative: "Hulk")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 1).repeatForever().repeatForever(autoreverses: true), value: animationAmount)
                .onAppear{
                    animationAmount = 1
                }
            
            Text("Cargando...")
                .font(.title)
                .foregroundColor(.red)
                .padding(.top, 100)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}

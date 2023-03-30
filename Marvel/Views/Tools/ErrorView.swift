//
//  ErrorView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel: RootViewModel
    private var textError:String
    
    init(error:String){
        self.textError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 150, height: 150)
                .padding()
                .offset(x:20) //ajuste maximo.
                .id(0)
            
            Text("\(textError)")
                .foregroundColor(.red)
                .font(.title)
                .id(1)
            
            
            Spacer()
            //boton
            
            
            Button("Volver") {
                //volver al login
                
            }
            .frame(width: 300, height: 50)
            .background(.orange)
            .font(.title2)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10.0, x:20, y: 10)
            .id(2)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error de prueba")
            .environmentObject(RootViewModel())
    }
}

//
//  ListaSeriesView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 30/03/23.
//

import SwiftUI

struct ListaSeriesView: View {
    var id: Int
    var char: String
    @StateObject var viewModel : viewModelSeries
    
    init(id: Int, char: String){
        self.char = char
        self.id = id
        _viewModel = StateObject(wrappedValue: viewModelSeries(id: id))
    }
    
    
    var body: some View {
        ScrollView{
            if let results = viewModel.series?.data.results {
                Text("\(char)")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width: 300, height: 70)
                    .background(Color.red)
                    .cornerRadius(20)
                    .shadow(radius:5, x:10 , y:10)
                    .bold()
                ForEach(results) { result in
                    VStack{
                        SeriesView(result: result)
                    }
                }
            }
            
        }
    }
}

struct ListaSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        ListaSeriesView(id: 1011334, char: "Nombre del Hero")
    }
}

//
//  SeriesView.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 30/03/23.
//

import SwiftUI

struct SeriesView: View {
    var result: Result
    @State private var selection = 0
    @EnvironmentObject var rootviewModel: viewModelSeries
    
    var body: some View {
        
        VStack{
            ZStack{
                AsyncImage(url: URL(string: "\(result.thumbnail.path).\(result.thumbnail.extension)")) { Image in
                    Image
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 300, height: 400)
                        .padding()
                        .id(0)
                        
                } placeholder: {
                    Image(decorative: "Hulk")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 400)
                    .opacity(0.6)
                    .cornerRadius(20)
                    .id(1)
                VStack{
                    Text("\(result.title)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 280)
                        .id(2)
                    
                    Text("\(result.description ?? "")")
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: 280)
                        .id(3)

                }
            }
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(result: Result(id: 3011, title: "3-D Man", description: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)", resourceURI: "", startYear: 2023, endYear: 2023, rating: "", type: "", modified: "", thumbnail: ThumbnailSer(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", extension: "jpg"), creators: Creators(available: 0, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 0, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: "")], returned: 0), comics: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0), events: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0)))
            .environmentObject(viewModelMarvel())
    }
}


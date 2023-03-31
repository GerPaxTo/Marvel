//
//  viewModelSeries.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation
import Combine

final class viewModelSeries: ObservableObject {
    @Published var id: Int = 0
    @Published var series: MarvelSeries?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(id: Int, testing:Bool = false){
        self.id = id
        
        if (testing){
            getSeriesTesting()
        } else{
            getSeries(id: self.id)
        }
    }

    
    func getSeries(id: Int){
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionSeries(id: id))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: MarvelSeries.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let errStr):
                    self.status = .error(error: errStr.localizedDescription)
                    print(errStr)
                case .finished:
                    self.status = .loaded
                }
                
            } receiveValue: { data in
                self.series = data
            }
            .store(in: &suscriptors)
    }
    
    func getSeriesTesting(){
//        let char = MarvelChar(data: ApiCharacterData(count: 1, results: [Character(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"), urls: [["String" : "String"]])]))
//
//        self.chars = char
    }
    
}


//
//  viewModelMarvel.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation
import Combine

final class viewModelMarvel: ObservableObject {
    @Published var status: Status = Status.none
    @Published var characters : MarvelChar?
    
    var suscriptors = Set<AnyCancellable>()
    
    
    init(testing:Bool=false) {
        
        if !testing {
            self.LoadCharacters()
        } else {
            //testing...
            self.LoadCharactersTesting()
        }
    }
    
    func LoadCharacters(){
        self.status = .loading
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionChars(id: ""))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                   
                    throw URLError(.badServerResponse)
                }
                
                //Login OK
                return $0.data
            }
            .decode(type: MarvelChar.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let errStr):
                    self.status = .error(error: errStr.localizedDescription)
                    print(errStr)
                case .finished:
                    self.status = .loaded
                    print("Finalizada carga Characters")
                }
                
            } receiveValue: { data in
                self.characters  = data
            }
            .store(in: &suscriptors)
    }
    
    func LoadCharactersTesting() -> Void {
        let char = MarvelChar(data: ApiCharacterData(count: 1, results: [Character(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"), urls: [["String" : "String"]])]))

        self.characters = char
    }
    
}


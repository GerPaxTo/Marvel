//
//  RootViewModel.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
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
//        let b1 =  Bootcamp(id: UUID().uuidString, name: "Mobile 12")
//        let b2 =  Bootcamp(id: UUID().uuidString, name: "Mobile 11")
//        let b3 =  Bootcamp(id: UUID().uuidString, name: "Web 12")
//        let b4 =  Bootcamp(id: UUID().uuidString, name: "Web 11")
//        let b5 =  Bootcamp(id: UUID().uuidString, name: "Devops 8")
//        let b6 =  Bootcamp(id: UUID().uuidString, name: "Devpops 7")
//        self.bootcamps = [b1,b2,b3,b4,b5,b6]
    }
    
}


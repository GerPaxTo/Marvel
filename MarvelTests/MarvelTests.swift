//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import XCTest
import ViewInspector
import SwiftUI
import Combine
@testable import Marvel

final class MarvelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testErrorView() throws {
        let view = ErrorView(error: "Testing")
             .environmentObject(viewModelMarvel())

        XCTAssertNotNil(view)

        //numero de vistas (asi, solo hay 1)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)

        //imagen de error
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)

        // Texto
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)

        let texto = try text.text().string()
        XCTAssertEqual(texto, "Testing")

        //boton
        let boton = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(boton)
        try boton.button().tap()
    }
    
   
    //Testing de Modelos
    
    func testModels() throws {
        let char = Character(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"), urls: [["String" : "String"]])
        XCTAssertNotNil(char)
        XCTAssertEqual(char.id, 1011334)

        let result =  Result(id: 3011, title: "3-D Man", description: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)", resourceURI: "", startYear: 2023, endYear: 2023, rating: "", type: "", modified: "", thumbnail: ThumbnailSer(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", extension: "jpg"), creators: Creators(available: 0, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 0, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: "")], returned: 0), comics: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0), events: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0))

        XCTAssertNotNil(result)
        XCTAssertEqual(result.title, "3-D Man")
    }

    
    // Test Asincrono de Combine
    
    func testviewModelMarvel() throws {
        var suscriptors  = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Finalizada carga Characters")

        //Instanciar el ViewModel
        let vm = viewModelMarvel(testing: true)
        XCTAssertNotNil(vm)

        //Observador de los Bootcamps
        vm.characters.publisher
            .sink { completion in
                switch completion{
                case.finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { datos in
                //recibimos los datos
            }
            .store(in: &suscriptors)
        vm.LoadCharactersTesting()

        self.waitForExpectations(timeout: 10) //esperamos a la espectiva
        
    }
    
    
    func testCharactersLoad() throws {
        var suscriptors = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Characteres test")

        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionChars(id: ""))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {

                    throw URLError(.badServerResponse)
                }

                return $0.data
            }
            .decode(type: MarvelChar.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    print("Print error fail")
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                case .finished:
                    print("Fin Characters Ok")
                }

            } receiveValue: { data in
                XCTAssertEqual( data.data.count, 20)
                expectation.fulfill()
            }
            .store(in: &suscriptors)

        self.waitForExpectations(timeout: 10)
     
    }
    
    func testcharactersRowView() throws {
        let view = charactersRowView(chars: Character(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"), urls: [["String" : "String"]]))
             
        XCTAssertNotNil(view)

        //numero de vistas (asi, solo hay 1)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)

        //imagen de error
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)

        // Texto
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)

        let texto = try text.text().string()
        XCTAssertEqual(texto, "3-D Man")

    }
    
    func testSeriesView() throws {
        let view = SeriesView(result: Result(id: 3011, title: "3-D Man", description: "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)", resourceURI: "", startYear: 2023, endYear: 2023, rating: "", type: "", modified: "", thumbnail: ThumbnailSer(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", extension: "jpg"), creators: Creators(available: 0, collectionURI: "", items: [CreatorsItem(resourceURI: "", name: "", role: "")], returned: 1), characters: Characters(available: 1, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 1), stories: Stories(available: 0, collectionURI: "", items: [StoriesItem(resourceURI: "", name: "", type: "")], returned: 0), comics: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0), events: Characters(available: 0, collectionURI: "", items: [Next(resourceURI: "", name: "")], returned: 0)))
            .environmentObject(viewModelSeries(id: 3011))
             
        XCTAssertNotNil(view)

        //numero de vistas (asi, solo hay 1)
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)

        //imagen de error
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)

        // Rectangulo
        let rectangulo = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rectangulo)
        
        // Texto
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)

        let texto = try text.text().string()
        XCTAssertEqual(texto, "3-D Man")
        
        // Texto
        let textd = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(textd)

        let textod = try textd.text().string()
        XCTAssertEqual(textod, "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)")

    }
}


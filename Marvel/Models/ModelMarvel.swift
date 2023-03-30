//
//  ModelMarvel.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation

struct MarvelChar: Codable {
    var data: ApiCharacterData
}

struct ApiCharacterData: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Codable,  Identifiable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
    var urls: [[String: String]]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String
    var `extension`: String
}


//// This file was generated from JSON Schema using codebeautify, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome2 = try Welcome2(json)
//
//import Foundation
//
//
//struct MarvelChar: Codable {
//    var code: Int
//    var status, copyright, attributionText, attributionHTML: String
//    var etag: String
//    var data: DataClass
//}
//
//// MARK: - DataClass
//struct DataClass: Codable {
//    var offset, limit, total, count: Int
//    var results: [Result]
//}
//
//// MARK: - Result
//struct Result: Codable,  Identifiable  {
//    var id: Int
//    var name, resultDescription: String
//    var modified: Date
//    var thumbnail: Thumbnail
//    var resourceURI: String
//    var comics, series: Comics
//    var stories: Stories
//    var events: Comics
//    var urls: [URLElement]
//}
//
//// MARK: - Comics
//struct Comics: Codable {
//    var available: Int
//    var collectionURI: String
//    var items: [ComicsItem]
//    var returned: Int
//}
//
//// MARK: - ComicsItem
//struct ComicsItem: Codable {
//    var resourceURI: String
//    var name: String
//}
//
//// MARK: - Stories
//struct Stories: Codable {
//    var available: Int
//    var collectionURI: String
//    var items: [StoriesItem]
//    var returned: Int
//}
//
//// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    var resourceURI: String
//    var name: String
//    var type: TypeEnum
//}
//
//enum TypeEnum: Codable {
//    case cover
//    case interiorStory
//}
//

//
//// MARK: - URLElement
//struct URLElement: Codable {
//    var type: String
//    var url: String
//}
//

//
//  ModelSeries.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 29/03/23.
//
import Foundation

// MARK: - Welcome9
struct MarvelSeries: Codable {
    var code: Int
    var status, copyright, attributionText, attributionHTML: String
    var etag: String
    var data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable  {
    var offset, limit, total, count: Int
    var results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable  {
    var id: Int
    var title: String
    var resultDescription: String?
    var resourceURI: String
    var urls: [URLElement]
    var startYear, endYear: Int
    var rating, type: String
    var modified: Date
    var thumbnail: ThumbnailSer
    var creators: Creators
    var characters: Characters
    var stories: Stories
    var comics, events: Characters
    var next, previous: Next?
}

// MARK: - Characters
struct Characters: Codable  {
    var available: Int
    var collectionURI: String
    var items: [Next]
    var returned: Int
}

// MARK: - Next
struct Next: Codable  {
    var resourceURI: String
    var name: String
}

// MARK: - Creators
struct Creators: Codable  {
    var available: Int
    var collectionURI: String
    var items: [CreatorsItem]
    var returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable  {
    var resourceURI: String
    var name, role: String
}

// MARK: - Stories
struct Stories: Codable  {
    var available: Int
    var collectionURI: String
    var items: [StoriesItem]
    var returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable  {
    var resourceURI: String
    var name: String
    var type: TypeEnum
}

enum TypeEnum: Codable  {
    case cover
    case empty
    case interiorStory
}

// MARK: - Thumbnail
struct ThumbnailSer: Codable  {
    var path: String
    var thumbnailExtension: String
}

// MARK: - URLElement
struct URLElement: Codable  {
    var type: String
    var url: String
}


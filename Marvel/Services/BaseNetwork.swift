//
//  BaseNetwork.swift
//  Marvel
//
//  Created by Gerardo Paxtian on 28/03/23.
//

import Foundation

let server = "https://gateway.marvel.com"
let apiKey = "4f3f0ecd97b20c7cb936d9206a7df955"
let ts = 1
let hash = "36a714fe2a8b840e258070afefdb6afb"

enum endpoints : String {
    case Characters = "/v1/public/characters"            //  /{characterId}
    case Comics = "/v1/public/comics"
    case Creators = "/v1/public/creators"
    case Events = "/v1/public/events"
    case Series = "/v1/public/series"
    case Stories = "/v1/public/stories"
}

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}
    
//    GET /v1/public/characters/{characterId}/comics Fetches lists of comics filtered by a character id.
//    GET /v1/public/characters/{characterId}/events Fetches lists of events filtered by a character id.
//    GET /v1/public/characters/{characterId}/series Fetches lists of series filtered by a character id.
//    GET /v1/public/characters/{characterId}/stories Fetches lists of stories filtered by a character id.
//    GET /v1/public/comics Fetches lists of comics.
//    GET /v1/public/comics/{comicId} Fetches a single comic by id.
//    GET /v1/public/comics/{comicId}/characters Fetches lists of characters filtered by a comic id.
//    GET /v1/public/comics/{comicId}/creators Fetches lists of creators filtered by a comic id.
//    GET /v1/public/comics/{comicId}/events Fetches lists of events filtered by a comic id.
//    GET /v1/public/comics/{comicId}/stories Fetches lists of stories filtered by a comic id.
//    GET /v1/public/creators Fetches lists of creators.
//    GET /v1/public/creators/{creatorId} Fetches a single creator by id.
//    GET /v1/public/creators/{creatorId}/comics Fetches lists of comics filtered by a creator id.
//    GET /v1/public/creators/{creatorId}/events Fetches lists of events filtered by a creator id.
//    GET /v1/public/creators/{creatorId}/series Fetches lists of series filtered by a creator id.
//    GET /v1/public/creators/{creatorId}/stories Fetches lists of stories filtered by a creator id.
//    GET /v1/public/events Fetches lists of events.
//    GET /v1/public/events/{eventId} Fetches a single event by id.
//    GET /v1/public/events/{eventId}/characters Fetches lists of characters filtered by an event id.
//    GET /v1/public/events/{eventId}/comics Fetches lists of comics filtered by an event id.
//    GET /v1/public/events/{eventId}/creators Fetches lists of creators filtered by an event id.
//    GET /v1/public/events/{eventId}/series Fetches lists of series filtered by an event id.
//    GET /v1/public/events/{eventId}/stories Fetches lists of stories filtered by an event id.
//    GET /v1/public/series Fetches lists of series.
//    GET /v1/public/series/{seriesId} Fetches a single comic series by id.
//    GET /v1/public/series/{seriesId}/characters Fetches lists of characters filtered by a series id.
//    GET /v1/public/series/{seriesId}/comics Fetches lists of comics filtered by a series id.
//    GET /v1/public/series/{seriesId}/creators Fetches lists of creators filtered by a series id.
//    GET /v1/public/series/{seriesId}/events Fetches lists of events filtered by a series id.
//    GET /v1/public/series/{seriesId}/stories Fetches lists of stories filtered by a series id.
//    GET /v1/public/stories Fetches lists of stories.
//    GET /v1/public/stories/{storyId} Fetches a single comic story by id.
//    GET /v1/public/stories/{storyId}/characters Fetches lists of characters filtered by a story id.
//    GET /v1/public/stories/{storyId}/comics Fetches lists of comics filtered by a story id.
//    GET /v1/public/stories/{storyId}/creators Fetches lists of creators filtered by a story id.
//    GET /v1/public/stories/{storyId}/events Fetches lists of events filtered by a story id.
//    GET /v1/public/stories/{storyId}/series Fetches lists of series filtered by a story id.


struct BaseNetwork {
    
    //lista Characters
    func getSessionChars(id:String) -> URLRequest{
        let urlcad : String = "\(server)\(endpoints.Characters.rawValue)?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)"
        
        
        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    //lista Characters
    func getSessionSeries(id:String) -> URLRequest{
        let urlcad : String = "\(server)\(endpoints.Characters.rawValue)/\(id)/series?apikey=\(apiKey)&ts=\(ts)&hash=\(hash)"
        
        
        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
}



//
//  Info.swift
//  CollectionViewConInformacionExterna_JoseLopezVilchez
//
//  Created by dam2 on 16/1/25.
//

import Foundation

struct Api<T : Codable> : Codable {
    
//    let count, pages : Int;
//    let next, prev : String?;
    var results : [T];
}

struct Nested : Codable {
    let name, url : String;
    //let url : URL;
}

struct Character : Codable {
    /*
     {
           "id": 1,
           "name": "Rick Sanchez",
           "status": "Alive",
           "species": "Human",
           "type": "",
           "gender": "Male",
           "origin": {
             "name": "Earth (C-137)",
             "url": "https://rickandmortyapi.com/api/location/1"
           },
           "location": {
             "name": "Citadel of Ricks",
             "url": "https://rickandmortyapi.com/api/location/3"
           },
           "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
           "episode": [
             "https://rickandmortyapi.com/api/episode/1",
             "https://rickandmortyapi.com/api/episode/51"
           ],
           "url": "https://rickandmortyapi.com/api/character/1",
           "created": "2017-11-04T18:48:46.250Z"
         },
    */
    
    let id : Int;
    let name, status, species, type, gender, created, image, url : String;
    let origin, location : Nested;
    //let image, url : URL;
    let episodes : [String];
    
    enum CodingKeys: String, CodingKey {
            case id, name, status, species, type, gender
            case origin, location
            case image, url
            case episodes = "episode"
            case created
        }
    
}

struct Location : Codable {
    
    /*
    {
           "id": 1,
           "name": "Earth (C-137)",
           "type": "Planet",
           "dimension": "Dimension C-137",
           "residents": [
             "https://rickandmortyapi.com/api/character/38",
             "https://rickandmortyapi.com/api/character/394"
           ],
           "url": "https://rickandmortyapi.com/api/location/1",
           "created": "2017-11-10T12:42:04.162Z"
    },
    */
    
    let id : Int;
    let name, type, dimension, created, url : String;
    let residents : [String];
    //let url : URL;
    
}

struct Episode : Codable {
    /*
    {
           "id": 1,
           "name": "Pilot",
           "air_date": "December 2, 2013",
           "episode": "S01E01",
           "characters": [
             "https://rickandmortyapi.com/api/character/1",
             "https://rickandmortyapi.com/api/character/435"
           ],
           "url": "https://rickandmortyapi.com/api/episode/1",
           "created": "2017-11-10T12:56:33.798Z"
    },
    */
    
    let id : Int;
    let name, airDate, episode, created, url : String;
    let characters : [String];
    //let url : URL;
    
    enum CodingKeys: String, CodingKey {
            case id, name
            case airDate = "air_date"
            case episode, characters, url, created
        }
}

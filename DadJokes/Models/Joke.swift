//
//  Joke.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation
import Apollo

// Exclusively Decode json - automatic
public struct Joke : Decodable {
    
    var id: String
    var text: String
    
    private enum Keys : String, CodingKey {
        case id
        case text = "joke"
    }
    
}

/*
 Use general form to choose which properties to en/decode
 
struct CJoke: Codable {
 
    var id: String
    var joke: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case joke
    }

}
 */
 
 
 
 
 



//
//  Joke.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation
import Apollo

// subclass Decodable for easier json decoding
struct Joke : Decodable {
    // make sure member vars are named after json return values
    var id: String?
    var joke: String?
    
    static func random() {
        
    }
}

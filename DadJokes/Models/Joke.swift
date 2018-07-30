//
//  Joke.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation
import Apollo

class Joke {
    var id: String?
    var joke: String?
    
    
    init(id: String, joke: String) {
        self.id = id
        self.joke = joke
    }
}


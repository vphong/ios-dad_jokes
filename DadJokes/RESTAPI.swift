//
//  RESTAPI.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation

class RESTManager {
    
    let endpoint = "https://icanhazdadjoke.com/"
    var url: URL
    var config: URLSessionConfiguration
    
    init() {
        self.url = URL(string: self.endpoint)!
        self.config = URLSessionConfiguration.default
        self.config.httpAdditionalHeaders = [
            "User-Agent": "contact@vanna.io (https://github.com/vphong/ios-dad_jokes)",
            "Accept": "application/json"
        ]
    }
    
    func getRandomJoke(completion: @escaping ((Joke?) -> ())) {
        
        var joke = Joke()
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: self.url) { (data, response, error) in
            
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                
                guard let data = data else {
                    print("invalid data")
                    return
                    
                }
                
                
                // Swift 4 method
                // must be in do/catch or if let bc dataTask can't throw
                do {
                    
                    joke = try JSONDecoder().decode(Joke.self, from: data)
                    completion(joke)
                    
                } catch {
                    print("error decoding json")
                }
                
                // Swift 3 method
                // guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
            }
        
            
            
        }
        
        
        
        /*(data: Data, response, error) in
            
            if let error = error {
                // handle errors
                print(error.localizedDescription)
            }
            else if let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                // check status code of response
                
                
                guard let data = data else { return }
         
         

            }
            
            completion(joke)
            
        }*/
        task.resume()
        
    }
    
    
}

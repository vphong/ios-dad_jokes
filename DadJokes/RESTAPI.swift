//
//  RESTAPI.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation

class RESTManager : URLSessionDataDelegate {
    
    let endpoint = "https://icanhazdadjoke.com/"
    lazy var url = URL(string: self.endpoint)
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.httpAdditionalHeaders = [
            "User-Agent": "contact@vanna.io (https://github.com/vphong/ios-dad_jokes)",
            "Accept": "application/json"
        ]
        return URLSession(configuration: config, delegate: (self as! URLSessionDelegate), delegateQueue: nil)
    }()
    private var dataTask: URLSessionDataTask?
    
    
    func getRandomJoke(completion: @escaping ((Joke?) -> ())) {
        
        self.dataTask?.cancel() // cancel datatask if exists for reuse
        
        var joke = Joke()
        var err: Error?
        
        self.dataTask = self.session.dataTask(with: self.url!) { (data, response, error) in
            
            // executed just before leaving current scope - cleanup
            defer {
                
                self.dataTask = nil
            }
            
            if let err = error {
                // handle client error
                joke.joke = "Error: \(err.localizedDescription)"
                completion(joke)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                // handle server error
                joke.joke = "Error: bad HTTP status. Is icanhazdadjokes.com online?"
                completion(joke)
                return
            }
            
            // handle mimetype error
            
            if let data = data {
                
                // Swift 4 method
                // must be in do/catch or if let bc URLSession.dataTask() can't throw
                do {
                    // success
                    joke = try JSONDecoder().decode(Joke.self, from: data)
                    DispatchQueue.main.async {
                        completion(joke)
                    }
                    
                } catch {
                    print("error decoding json")
                    joke.joke = "Error: could not decode JSON."
                    completion(joke)
                }
                
                // Swift 3 method
                // guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
            }
            
        }
        
        self.dataTask?.resume()
        
    }
    
    func url
    
}

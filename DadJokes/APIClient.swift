//
//  RESTAPI.swift
//  DadJokes
//
//  Created by Vanna Phong on 30/07/2018.
//  Copyright © 2018 vphong. All rights reserved.
//

import Foundation

class NetworkingClient {
    
    static let sharedInstance = NetworkingClient()
    
    private let apiEndpoint = "https://icanhazdadjoke.com/"
    lazy private var url = URL(string: self.apiEndpoint)
    lazy private var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.httpAdditionalHeaders = [
            "User-Agent": "contact@vanna.io (https://github.com/vphong/ios-dad_jokes)",
            "Accept": "application/json"
        ]
        return URLSession(configuration: config, delegate: (self as! URLSessionDelegate), delegateQueue: nil)
    }()
    
    private var dataTask: URLSessionDataTask?
    
    
    func getRandomJokeFromAPI(completion: @escaping ((Joke?) -> Void)) {
        
        self.dataTask?.cancel() // cancel datatask if exists for reuse
        
        self.dataTask = self.session.dataTask(with: self.url!) { (data, response, error) in
            
            // executed just before leaving current scope - cleanup
            defer {
                
                self.dataTask = nil
            }
            
            if let err = error {
                // handle client error
                print("Error: \(err.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                // handle server error
                print("Error: bad HTTP status. Is icanhazdadjokes.com online?")
                completion(nil)
                return
            }
            
            // handle mimetype error
            
            if let data = data {
                
                // Swift 4 method
                // must be in do/catch to handle errors thrown
                do {
                    // success
                    let joke = try JSONDecoder().decode(Joke.self, from: data)
                    DispatchQueue.main.async {
                        completion(joke)
                    }
                    
                } catch {
                    print("Error: could not decode JSON.")
                    completion(nil)
                }
                
                // Swift 3 method
                // guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
            }
            
        }
        
        self.dataTask?.resume()
        
    }
}

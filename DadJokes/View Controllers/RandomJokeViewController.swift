//
//  RandomJokeViewController.swift
//  
//
//  Created by Vanna Phong on 30/07/2018.
//

import UIKit
import ChameleonFramework

class RandomJokeViewController: UIViewController {

    var joke = Joke()
    let api = RESTManager()
    
    @IBOutlet weak var jokeTextView: UITextView!
    
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        apollo.fetch(query: RandomJokeQuery()) { (result, error) in
//            guard let jokeData = result?.data?.joke else { return }
//            print("\(jokeData.joke)")
//            self.joke.id = jokeData.id
//            self.joke.text = jokeData.joke
//            self.jokeTextView.text = jokeData.joke
//        }
        
        DispatchQueue.global(qos: .background).async {
            
            self.api.getRandomJoke(completion: { (joke) in
                self.joke = joke!
                
                // UI updates always on main thread
                DispatchQueue.main.async {
                    self.jokeTextView.text = self.joke.joke
                }
            })
        }
        
        self.view.backgroundColor = GradientColor(UIGradientStyle.diagonal, frame: self.view.frame, colors: [UIColor.flatLime, UIColor(complementaryFlatColorOf: UIColor.flatLime)])
        
        self.jokeTextView.textColor = UIColor.lightText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "newJokeSegue" {
            // handle newJoke
        }
        
    }

}

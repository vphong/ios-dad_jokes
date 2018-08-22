//
//  RandomJokeViewController.swift
//  
//
//  Created by Vanna Phong on 30/07/2018.
//

import UIKit
import ChameleonFramework

class RandomJokeViewController: UIViewController {

    
    @IBOutlet weak var jokeTextView: UITextView!
    
    private let api = NetworkingClient.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        apollo.fetch(query: RandomJokeQuery()) { (result, error) in
//            guard let jokeData = result?.data?.joke else { return }
//            print("\(jokeData.joke)")
//            self.joke.id = jokeData.id
//            self.joke.text = jokeData.joke
//            self.jokeTextView.text = jokeData.joke
//        }
        
        
        
        self.jokeTextView.alpha = 0.0
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            self.api.getRandomJokeFromAPI(completion: { (joke) in
                if let joke = joke {
                    self.updateUI(with: joke)
                }
            })
        }
        
        self.view.backgroundColor = GradientColor(UIGradientStyle.diagonal, frame: self.view.frame, colors: [UIColor.flatLime, UIColor(complementaryFlatColorOf: UIColor.flatLime)])
        
        self.jokeTextView.textColor = UIColor.lightText
        
    }
    
    func updateUI(with joke: Joke) {
        self.jokeTextView.text = joke.text
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.jokeTextView.alpha = 1.0
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    @IBAction func swipedLeft(_ sender: Any) {
        
        // segue doesn't exist - manually push
        let newJokeVC = self.storyboard?.instantiateViewController(withIdentifier: "randomJoke")
        self.navigationController?.pushViewController(newJokeVC!, animated: true)
        
    }
    
    @IBAction func swipedRight(_ sender: Any) {
        
   
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    */
    
    
}

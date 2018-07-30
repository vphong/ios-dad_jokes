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
    @IBOutlet weak var jokeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apollo.fetch(query: RandomJokeQuery()) { (result, error) in
            guard let jokeData = result?.data?.joke else { return }
            print("\(jokeData.joke)")
            self.joke.id = jokeData.id
            self.joke.text = jokeData.joke
            self.jokeTextView.text = jokeData.joke
        }
        
        self.view.backgroundColor = GradientColor(UIGradientStyle.diagonal, frame: self.view.frame, colors: [UIColor.flatLime, UIColor(complementaryFlatColorOf: UIColor.flatLime)])
        
        self.jokeTextView.textColor = UIColor.lightText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

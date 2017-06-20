//
//  ViewController.swift
//  Tappity
//
//  Created by Joshua Mengel on 29/5/17.
//  Copyright © 2017 Joshua Mengel. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Merge me
    
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var scoreThree: UILabel!
    @IBOutlet weak var scoreFour: UILabel!
    @IBOutlet weak var scoreFive: UILabel!
    @IBOutlet weak var scoreSix: UILabel!
    @IBOutlet weak var scoreSeven: UILabel!
    @IBOutlet weak var scoreEight: UILabel!
    @IBOutlet weak var scoreNine: UILabel!
    @IBOutlet weak var scoreTen: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let theFirstViewController = tabBarController?.viewControllers![0] as! ViewController
        theFirstViewController.called()
    }
    
    func updateHighScores(_ scoreLabel: Dictionary<Int, String>) {
        print(scoreLabel)
        
        let UILabels = [scoreOne, scoreTwo, scoreThree, scoreFour, scoreFive, scoreSix, scoreSeven, scoreEight, scoreNine, scoreTen]
        
        for i in UILabels {
            i?.text = "Meme"
        }
        
        
        
    }
}

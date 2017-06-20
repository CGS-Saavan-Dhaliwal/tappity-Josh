//
//  ViewController.swift
//  Tappity
//
//  Created by Joshua Mengel on 29/5/17.
//  Copyright © 2017 Joshua Mengel. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    var score = 0
    var counter = 30
    var timerOn = false
    
    var highScore = 0
    
    var highScoreText = [1: "test"]
    
    @IBAction func scoreIncreace(button: UIButton) {
        if timerOn == false {
            score += 1
            scoreLabel.text = "\(score)"
            self.timerOn = true
            let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                self.counter -= 1
                self.timeLabel.text = "\(self.counter)"
                
                if self.counter == 0 {
                    
                    if self.score > self.highScore {
                        
                        let alertController = UIAlertController(title: "You got a score of \(self.score)", message: "Enter your name to save your score!", preferredStyle: .alert)
                        
                        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
                            alert -> Void in
                            
                            self.highScore = self.score
                            
                            let firstTextField = alertController.textFields![0] as UITextField
                            
                            let scoreReadout = ("Name: \(firstTextField.text ?? "Unknown"), score: \(self.highScore)")
                            
                            // dictionary stuff
                            
                            self.highScoreText.updateValue("\(scoreReadout)", forKey: self.score)
                            
                            for (key, value) in self.highScoreText {
                                if value == self.highScoreText.values.min() {
                                     print(key)
                                }
                            }
                            
                            reset()
                        })
                        
                        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
                            (action : UIAlertAction!) -> Void in
                            
                        })
                        
                        alertController.addTextField { (textField : UITextField!) -> Void in
                            textField.placeholder = "Enter First Name"
                        }
                        
                        alertController.addAction(saveAction)
                        alertController.addAction(cancelAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                    } else {
                        let alert = UIAlertController(title: "Game over", message: "Your score is \(self.score)",
                            preferredStyle: UIAlertControllerStyle.actionSheet)
                        alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler:
                            nil ))
                        self.present(alert, animated: true, completion: nil)
                        
                        reset()
                    }
                    
                    timer.invalidate()
                }
            }} else {
            score += 1
            scoreLabel.text = "\(score)"
        }
        
        func reset() {
            score = 0
            highScore = 0
            counter = 30
            scoreLabel.text = "\(self.score)"
            timeLabel.text = "\(self.counter)"
            view.backgroundColor = UIColor.blue
            timerOn = false
        }
        
        let colours = [UIColor.blue, UIColor.red, UIColor.green, UIColor.purple, UIColor.black, UIColor.orange, UIColor.yellow, UIColor.magenta, UIColor.gray, UIColor.brown]
        
        let randomNumber = Int(arc4random_uniform(UInt32(colours.count)))
        
        self.view.backgroundColor = (colours[randomNumber])
        
        // Find the button's width and height
        let buttonWidth = button.frame.width
        let buttonHeight = button.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = button.superview!.bounds.width
        let viewHeight = button.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        button.center.x = xoffset + buttonWidth / 2
        button.center.y = yoffset + buttonHeight / 2
        
    }
    
    func called() {
        let theSecondViewController = tabBarController?.viewControllers![1] as! ViewController2
        theSecondViewController.updateHighScores(highScoreText)
    }
}

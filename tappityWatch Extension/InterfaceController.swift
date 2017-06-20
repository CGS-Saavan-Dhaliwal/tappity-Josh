//
//  InterfaceController.swift
//  Tappity_watch Extension
//
//  Created by Joshua Mengel on 30/5/17.
//  Copyright © 2017 Joshua Mengel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBOutlet var timeLabel: WKInterfaceLabel!
    @IBOutlet var scoreLabel: WKInterfaceLabel!
    
    var score = 0
    
    var time: Timer!
    
    var timerEnabled = false
    
    var i = 30
    
    @IBAction func tapButton() {
        score += 1
        scoreLabel.setText("\(score)")
        
        timer()
    }
    
    func timer() {
        
        if timerEnabled == false {
            
            self.i -= 1
            self.timeLabel.setText("\(self.i)")
            
            self.timerEnabled = true
            time = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (Timer) in
                
                if self.i == 0 {
                    self.time.invalidate()
                    self.timerEnabled = false
                    
                    let titleOfAlert = "You got a score of"
                    let messageOfAlert = "\(self.score)"
                    
                    self.presentAlert(withTitle: titleOfAlert, message: messageOfAlert, preferredStyle: .alert, actions: [WKAlertAction(title: "OK", style: .default){
                        //something after clicking OK
                        }])
                    
                    self.reset()
                }
                
                self.timeLabel.setText("\(self.i)")
                self.i -= 1
            })
        }
    }
    
    func reset() {
        i = 30
        score = 0
        self.scoreLabel.setText("\(score)")
    }
}

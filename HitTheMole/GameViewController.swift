//
//  GameViewController.swift
//  HitTheMole
//
//  Created by Ali Yasin Eser on 2.04.2018.
//  Copyright © 2018 Ali Yasin Eser. All rights reserved.
//

import UIKit
import Darwin

class GameViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var rngObject0: UIImageView!
    @IBOutlet weak var rngObject1: UIImageView!
    @IBOutlet weak var rngObject2: UIImageView!
    @IBOutlet weak var rngObject3: UIImageView!
    @IBOutlet weak var rngObject4: UIImageView!
    @IBOutlet weak var rngObject5: UIImageView!
    @IBOutlet weak var rngObject6: UIImageView!
    @IBOutlet weak var rngObject7: UIImageView!
    @IBOutlet weak var rngObject8: UIImageView!
    @IBOutlet weak var rngObject9: UIImageView!
    @IBOutlet weak var rngObject10: UIImageView!
    @IBOutlet weak var rngObject11: UIImageView!
    @IBOutlet weak var rngObject12: UIImageView!
    @IBOutlet weak var rngObject13: UIImageView!
    @IBOutlet weak var rngObject14: UIImageView!
    @IBOutlet weak var rngObject15: UIImageView!
    
    var currentSeen = 0 // which one of the UIImage has the mole
    var objArr = [UIImageView]()
    var timerCount = 30
    var timer = Timer()
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create an array of images
        objArr = [rngObject0,rngObject1,rngObject2,rngObject3,
                        rngObject4,rngObject5,rngObject6,rngObject7,
                        rngObject8,rngObject9,rngObject10,rngObject11,
                        rngObject12,rngObject13,rngObject14,rngObject15]
        // Schedule the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timerIntervalDone), userInfo: nil, repeats: true)
        
        let highScore = UserDefaults.standard.object(forKey: "highScore")
        
        
        if let high = highScore as? String{
            highScoreLabel.text = high
        }else{
            highScoreLabel.text = "0"
            UserDefaults.standard.set(highScoreLabel.text!, forKey: "highScore")
        }
        
        
        // Enable user interaction so the images can be tapped
        rngObject0.isUserInteractionEnabled = true
        rngObject1.isUserInteractionEnabled = true
        rngObject2.isUserInteractionEnabled = true
        rngObject3.isUserInteractionEnabled = true
        rngObject4.isUserInteractionEnabled = true
        rngObject5.isUserInteractionEnabled = true
        rngObject6.isUserInteractionEnabled = true
        rngObject7.isUserInteractionEnabled = true
        rngObject8.isUserInteractionEnabled = true
        rngObject9.isUserInteractionEnabled = true
        rngObject10.isUserInteractionEnabled = true
        rngObject11.isUserInteractionEnabled = true
        rngObject12.isUserInteractionEnabled = true
        rngObject13.isUserInteractionEnabled = true
        rngObject14.isUserInteractionEnabled = true
        rngObject15.isUserInteractionEnabled = true
        
        // Create recognizers for each image view
        let gestureRecognizer0 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction0))
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction1))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction2))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction3))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction4))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction5))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction6))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction7))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction8))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction9))
        let gestureRecognizer10 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction10))
        let gestureRecognizer11 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction11))
        let gestureRecognizer12 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction12))
        let gestureRecognizer13 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction13))
        let gestureRecognizer14 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction14))
        let gestureRecognizer15 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.gestureFunction15))
        
        // Add recognizers to image views
        rngObject0.addGestureRecognizer(gestureRecognizer0)
        rngObject1.addGestureRecognizer(gestureRecognizer1)
        rngObject2.addGestureRecognizer(gestureRecognizer2)
        rngObject3.addGestureRecognizer(gestureRecognizer3)
        rngObject4.addGestureRecognizer(gestureRecognizer4)
        rngObject5.addGestureRecognizer(gestureRecognizer5)
        rngObject6.addGestureRecognizer(gestureRecognizer6)
        rngObject7.addGestureRecognizer(gestureRecognizer7)
        rngObject8.addGestureRecognizer(gestureRecognizer8)
        rngObject9.addGestureRecognizer(gestureRecognizer9)
        rngObject10.addGestureRecognizer(gestureRecognizer10)
        rngObject11.addGestureRecognizer(gestureRecognizer11)
        rngObject12.addGestureRecognizer(gestureRecognizer12)
        rngObject13.addGestureRecognizer(gestureRecognizer13)
        rngObject14.addGestureRecognizer(gestureRecognizer14)
        rngObject15.addGestureRecognizer(gestureRecognizer15)
        
        // Game UI updates
        timeLabel.text = String(timerCount)
        currentScoreLabel.text = String(score)
        currentSeen = 0
        score = 0
        timeLabel.text = String(timerCount)
        currentScoreLabel.text = String(score)
        
    }

    
    // Dismiss the current view and go back to main menu.
    @IBAction func goToMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Function for every interval endings. Interval is equals to 1 second normally.
    // In every second, UI must be updated.
    @objc func timerIntervalDone(){
        // decrement the timer so timer can end
        timerCount-=1
        
        if score > Int(highScoreLabel.text!)!{
            highScoreLabel.text = String(score)
            UserDefaults.standard.set(highScoreLabel.text!, forKey: "highScore")
        }
        
        // check the timer. If the counter is equals to zero it means that the game is over and
        // update operations will be processed. Due to answer of notification, user can play
        // again or go back to main menu
        if timerCount == 0 {
            // remove the current location of the mole.
            objArr[currentSeen].image = nil
            timer.invalidate()
            // Create and alert box to let user decide to replay or go back to menu
            let alert = UIAlertController(title: "Time is up", message: "You did your best!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Menu", style: .cancel, handler: {action in  self.dismiss(animated: false, completion: nil)})
            let replayButton = UIAlertAction(title: "Replay", style: .default, handler: {action in self.replay()})
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }else{ // If there is still time to play. Remove the current mole and relocate to next rng position
            timeLabel.text = String(timerCount)
            let rng = Int(arc4random_uniform(16))
            objArr[currentSeen].image = nil
            currentSeen = rng
            objArr[currentSeen].image = #imageLiteral(resourceName: "moleInGame.png")
        }
    }
    
    // replay operation.
    func replay() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timerIntervalDone), userInfo: nil, repeats: true)
        currentSeen = 0
        objArr[currentSeen].image = #imageLiteral(resourceName: "moleInGame.png")
        timerCount = 30
        score = 0
        timeLabel.text = String(timerCount)
        currentScoreLabel.text = String(score)
        
    }
    
    
    /* GESTURE FUNCTIONS */
    @objc func gestureFunction0(){
        if rngObject0.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
        
    }
    @objc func gestureFunction1(){
        if rngObject1.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction2(){
        if rngObject2.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction3(){
        if rngObject3.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction4(){
        if rngObject4.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction5(){
        if rngObject5.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction6(){
        if rngObject6.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction7(){
        if rngObject7.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction8(){
        if rngObject8.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction9(){
        if rngObject9.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction10(){
        if rngObject10.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction11(){
        if rngObject11.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction12(){
        if rngObject12.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction13(){
        if rngObject13.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction14(){
        if rngObject14.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    @objc func gestureFunction15(){
        if rngObject15.image != nil {
            score = score + 1
            currentScoreLabel.text = String(score)
        }
    }
    
    
}

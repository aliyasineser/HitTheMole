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
    
    var currentSeen = 0
    var objArr = [UIImageView]()
    var timerCount = 30
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objArr = [rngObject0,rngObject1,rngObject2,rngObject3,
                        rngObject4,rngObject5,rngObject6,rngObject7,
                        rngObject8,rngObject9,rngObject10,rngObject11,
                        rngObject12,rngObject13,rngObject14,rngObject15]
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timerIntervalDone), userInfo: nil, repeats: true)
        
        currentSeen = 0
        objArr[currentSeen].image = #imageLiteral(resourceName: "moleInGame.png")
        timerCount = 30
    }

    @IBAction func goToMenu(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func timerIntervalDone(){
        // decrement the timer so timer can end
        timerCount-=1
        // check the timer. If the counter is equals to zero it means that the game is over and
        // update operations will be processed. Due to answer of notification, user can play
        // again or go back to main menu
        if timerCount == 0 {
            let alert = UIAlertController(title: "Time is up", message: "You did your best!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Menu", style: .cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: .default, handler: {action in self.replay()})
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        let rng = Int(arc4random_uniform(16))
        objArr[currentSeen].image = nil
        currentSeen = rng
        objArr[currentSeen].image = #imageLiteral(resourceName: "moleInGame.png")
        
    }
    
    // replay operation.
    func replay() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timerIntervalDone), userInfo: nil, repeats: true)
        currentSeen = 0
        objArr[currentSeen].image = #imageLiteral(resourceName: "moleInGame.png")
        timerCount = 30
    }
    
    
}

//
//  StopWatchViewController.swift
//  TimerApp
//
//  Created by Kimaya Desai on 10/10/18.
//  Copyright © 2018 Kimaya Desai. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00:00"
        reset.isEnabled = false
        pause.isEnabled = false
        start.isEnabled = true
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        reset.isEnabled = true
        start.isEnabled = true
        pause.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func startButton(_ sender: Any) {
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            reset.isEnabled = true
            pause.isEnabled = true
            start.isEnabled = false
        }
    }
    
    // MARK :- Helper Method
    
    @objc func runTimer(){
        counter += 0.1
        timerLabel.text = "\(counter)"
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        let min = (flooredCounter % 3600) / 60
        var minS = "\(min)"
        if (min<10){
            minS = "0\(min)"
        }
        let sec = (flooredCounter % 3600)  % 60
        var secS = "\(sec)"
        if (sec<10){
            secS = "0\(sec)"
        }
        
        let decisec = String(format:"%.1f", counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minS):\(secS).\(decisec)"
       
    }
    
    override func viewDidLoad() {
        
        reset.layer.cornerRadius = 10
        reset.layer.borderWidth = 3
        pause.layer.cornerRadius = 10
        pause.layer.borderWidth = 3
        start.layer.cornerRadius = 10
        start.layer.borderWidth = 3
        
        timerLabel.layer.cornerRadius = 15
        timerLabel.layer.borderWidth = 4
        
        super.viewDidLoad()
        reset.isEnabled = false
        pause.isEnabled = false
        start.isEnabled = true
    }
}

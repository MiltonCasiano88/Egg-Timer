//
//  ViewController.swift
//  Egg Timer
//
//  Created by Milton Casiano on 10/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OutputLabel: UILabel!
  
    @IBOutlet weak var progressview: UIProgressView!
    
    var eggTimes = ["Hard" : 10, "Medium" : 7, "Soft": 4] // dictionary
    
    var startTime = 0
    var totalTime = 0
    
    var timer = Timer()
    
    @IBAction func clickme(_ sender: UIButton) {
    
        timer.invalidate()
        progressview.progress = 0.0
        startTime = 0
        
    //who.what = value
        
        let hardness = sender.currentTitle!
        //output of hardness = hard
        print(hardness)
        OutputLabel.text = hardness
    
    
        totalTime = eggTimes[hardness]!

        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }


        @objc func updateCounter() {
        if startTime < totalTime {
            
            startTime += 1
            progressview.progress = Float(startTime)/Float(totalTime)
        }
        
        else {
            OutputLabel.text = "eggs are ready!"
            timer.invalidate()
        }
    }
}


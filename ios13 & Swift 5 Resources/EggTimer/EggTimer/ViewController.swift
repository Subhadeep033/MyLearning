//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var processcomplete = 0
    var player : AVAudioPlayer!
    
    //MARK: - Egg making time ------
    let eggTime = ["Soft" : 1, "Medium" : 8, "Hard" : 12]
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        self.progressLabel.text = ""
        self.progressBar.progress = 0.0
        processcomplete = 0
        
        let hardness = sender.currentTitle ?? ""
        titleLabel.text = hardness
        
        switch hardness {
        case "Soft":
            setTimer(withInterval: eggTime[hardness] ?? 0)
        case "Medium":
            setTimer(withInterval: eggTime[hardness] ?? 0)
        case "Hard":
            setTimer(withInterval: eggTime[hardness] ?? 0)
        default:
            print("Error!")
        }
    }
    
    private func setTimer(withInterval : Int){
        let interVal = withInterval * 60
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.processcomplete < interVal {
                self.processcomplete += 1
                self.progressBar.progress = Float(self.processcomplete) / Float(interVal)
                self.progressLabel.text = "\(interVal - self.processcomplete) seconds remaining"
                
            } else {
                self.timer.invalidate()
                self.progressLabel.text = "Complete"
                self.titleLabel.text = "Done!"
                self.playSound()
            }
        }
    }
    
    private func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

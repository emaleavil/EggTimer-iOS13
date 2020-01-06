//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountDownTimerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private var countDownTimer: CountDownTimer = CountDownTimerImpl()
    
    override func viewDidLoad() {
        countDownTimer.delegate = self
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        countDownTimer.stop()
        
        guard let type = sender.currentTitle else {
            print("Wrong type selected")
            return
        }
        
        let hardness = type.toHardness()
        countDownTimer.start(timeInMinutes: hardness.time())
    }
    
    func onTimeUpdated(currentTime: Int, endTime: Int) {
        self.progressBar.updateProgress(currentTime: currentTime, endTime: endTime )
    }
    
    func onFinished() {
        self.titleLabel.text = "DONE"
    }
}

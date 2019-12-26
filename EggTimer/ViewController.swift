//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    private let countDownTimer: CountDownTimer = CountDownTimerImpl()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        countDownTimer.stop()
        
        guard let type = sender.currentTitle else {
            print("Wrong type selected")
            return
        }
        
        let hardness = type.toHardness()
        
        countDownTimer.start(timeInMinutes: hardness.time()) {
            self.titleLabel.text = "DONE"
        }
    }
    
}

//
//  CountDownTimer.swift
//  EggTimer
//
//  Created by Emanuel Leal Vila on 27/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CountDownTimer {
    func start(timeInMinutes: Int, onFinished: @escaping () -> Void)
    func stop()
}

class CountDownTimerImpl: CountDownTimer {
    
    private var timer: Timer? = nil
    private var countDownInSec: Int? = nil
    
    func start(timeInMinutes: Int, onFinished: @escaping () -> Void) {
        print("Timer started")
        countDownInSec = timeInMinutes * 1
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                guard let countDown = self.countDownInSec else {
                    self.stop()
                    return
                }
                
                self.countDownInSec = countDown - 1
                print("CountDown: \(countDown)")
                if self.countDownInSec == 0 {
                    self.stop()
                    onFinished()
                }
                
            })
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        print("Timer Stopped")
    }
}

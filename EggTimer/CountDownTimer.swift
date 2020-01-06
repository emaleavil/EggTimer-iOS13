//
//  CountDownTimer.swift
//  EggTimer
//
//  Created by Emanuel Leal Vila on 27/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CountDownTimer {
    
    var delegate: CountDownTimerDelegate? { get set }
    
    func start(timeInMinutes: Int)
    func stop()
}

protocol CountDownTimerDelegate {
    func onTimeUpdated(currentTime: Int, endTime: Int) -> Void
    func onFinished() -> Void
}
class CountDownTimerImpl: CountDownTimer {
    
    var delegate: CountDownTimerDelegate? = nil
    
    private var timer: Timer? = nil
    private var countDownInSec: Int? = nil
    private var endTime: Int? = nil
    
    
    func start(timeInMinutes: Int) {
        print("Timer started")
        countDownInSec = timeInMinutes * 60
        endTime =  timeInMinutes * 60
        
        if timer == nil {
            delegate?.onTimeUpdated(currentTime: 0, endTime: self.endTime!)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                guard let countDown = self.countDownInSec else {
                    self.stop()
                    return
                }
                
                let newTimeInSec = countDown - 1
                self.countDownInSec = newTimeInSec
                self.delegate?.onTimeUpdated(currentTime: self.endTime! - newTimeInSec, endTime: self.endTime!)
                print("CountDown: \(countDown)")
                if self.countDownInSec == 0 {
                    self.stop()
                    self.delegate?.onFinished()
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

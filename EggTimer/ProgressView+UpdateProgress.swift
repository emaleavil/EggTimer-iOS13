//
//  ProgressView+UpdateProgress.swift
//  EggTimer
//
//  Created by Emanuel Leal Vila on 06/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

extension UIProgressView {
    
    func updateProgress(currentTime: Int, endTime: Int) {
        let progress = Float(currentTime) / Float(endTime)
        print("Progress \(progress)")
        setProgress(progress, animated: true)
    }
}

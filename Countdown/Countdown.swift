//
//  Countdown.swift
//  Countdown
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class countDown {
    
    //Mark time started
    //Timer: Continually check if we've reached the length of time
    //Delegate: let us know when that happens.
    //Functions:
    //Start
    //Stop
    //Reset
    
    var timer: Timer?
    var startDate: Date?
    var stopDate: Date?
    var timeRemaining: TimeInterval //Number of seconds (Double)
    var duration: TimeInterval
    
    //TODO: delegate
    
    
    init(duration: TimeInterval = 60) {
        self.duration = duration
        self.timeRemaining = duration
    }
    
    func start(duration: TimeInterval) {
        self.duration = duration
        self.timeRemaining = duration
        
        stopDate = Date(timeIntervalSinceNow: duration)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
        
    }
    
    @objc func update(timer: Timer) {
        //Calculate time remaining
        //stopDate - currentTime = timeRemaining
        
        if let stopDate = stopDate {
            let currentTime = Date()
           timeRemaining =  stopDate.timeIntervalSince(currentTime)
            print("Time Remaining: \(timeRemaining)")
        }
    }
    
    func stop() {
        
       stopDate = nil
    }
    
    func reset() {
       
        stopDate = nil
        
    }
}

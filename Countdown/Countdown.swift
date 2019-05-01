//
//  Countdown.swift
//  Countdown
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

protocol CountdownDelegate: AnyObject {
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}

class Countdown {
    
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
    
    weak var delegate: CountdownDelegate?
    
    
    init(duration: TimeInterval = 60) {
        self.duration = duration
        self.timeRemaining = duration
    }
    
    func start(duration: TimeInterval) {
        self.duration = duration
        self.timeRemaining = duration
        
        //projected date into future.
        stopDate = Date(timeIntervalSinceNow: duration)
        //Start a timer to update continiously.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
        
    }
    
    @objc func update(timer: Timer) {
        //Calculate time remaining
        //stopDate - currentTime = timeRemaining
        
        if let stopDate = stopDate {

            let currentTime = Date()
            
            if currentTime <= stopDate {
                //Timer is active, keep counting
                timeRemaining =  stopDate.timeIntervalSince(currentTime)
                print("Time Remaining: \(timeRemaining)")
                delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
            } else {
                // currentTime > stopDate
                //Timer is finidshed, send stop message
              //Stop the timer
                clearTimer()
                reset()
                delegate?.countdownDidFinish()
            }
            
        }
    }
    
    private func clearTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func stop() {
        
       stopDate = nil
    }
    
    func reset() {
       
        stopDate = nil
        timeRemaining = 0
        
    }
}

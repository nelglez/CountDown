//
//  ViewController.swift
//  Countdown
//
//  Created by Nelson Gonzalez on 5/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    let countdown = Countdown()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.countDownDuration = 60
        countdown.delegate = self
    }
    
    private func updateViews() {
        timeLabel.text = "\(countdown.timeRemaining)"
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        print("Countdown: \(datePicker.countDownDuration)")
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        //get duration?
        let duration = datePicker.countDownDuration
        countdown.start(duration: duration)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
    
    
}

extension CountdownViewController: CountdownDelegate {
    func countdownDidFinish() {
        updateViews()
        print("FINISHED")
    }
    
    func countdownDidUpdate(timeRemaining: TimeInterval) {
        //update the views
        updateViews()
    }
    
    
}

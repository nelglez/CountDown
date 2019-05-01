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
    //sometime in future not right awat
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        //customize it to show 00:00:00.00
        
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.countDownDuration = 60
        countdown.delegate = self
    }
    
    private func updateViews() {
      //  timeLabel.text = "\(countdown.timeRemaining)"
        let date = Date(timeIntervalSinceReferenceDate: countdown.timeRemaining)
        timeLabel.text = dateFormatter.string(from: date)
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

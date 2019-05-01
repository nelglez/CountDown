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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        print("Countdown: \(datePicker.countDownDuration)")
    }
    
}


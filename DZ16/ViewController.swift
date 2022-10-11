//
//  ViewController.swift
//  DZ16
//
//  Created by Dmitriy on 10/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    private var timer = Timer()
    private var timeInSeconds = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isEnabled = true
        stopButton.isEnabled = false
    }
    
    //function for when the app enters background
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer.invalidate()
    }
    
    //function for when the app leaves background
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if stopButton.isEnabled {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
            startButton.isEnabled = false
            stopButton.isEnabled = true
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @objc func fireTimer() {
        timeInSeconds += 1
        let minutes = Int(timeInSeconds / 60)
        let seconds = timeInSeconds - 60 * minutes
        timeLabel.text = "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
}

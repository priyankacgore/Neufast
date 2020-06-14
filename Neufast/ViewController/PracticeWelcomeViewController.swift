//
//  PracticeWelcomeViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 03/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class PracticeWelcomeViewController: UIViewController {
    var welcomeTimer: Timer?
//    var seconds = 30
    var welcomeEndTime = 5
    var welcomeStartTime = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        self.createWelcomeTimer()
//        self.updateTime()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        self.cancelTimer()
        let questionView = storyboard?.instantiateViewController(withIdentifier: "PracticeQueViewController")
        self.navigationController?.pushViewController(questionView!, animated: true)
    }

    
    //MARK: Timer
    func createWelcomeTimer() {
        welcomeStartTime = 0
        welcomeTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateWelcomeTime), userInfo: nil, repeats: true)
        RunLoop.current.add(welcomeTimer!, forMode: RunLoopMode.commonModes)
        welcomeTimer!.tolerance = 0.1
    }
    
    func cancelTimer() {
        welcomeTimer?.invalidate()
        welcomeTimer = nil
    }

    
   
    
    @objc func updateWelcomeTime() {
        welcomeStartTime = welcomeStartTime + 1
        print("welcomeStartTime: \(welcomeStartTime)")
        if welcomeStartTime == welcomeEndTime {
            welcomeTimer?.invalidate()
            welcomeTimer = nil
            print("After Welcome Time End: \(welcomeStartTime)")
            let questionView = storyboard?.instantiateViewController(withIdentifier: "PracticeQueViewController")
            self.navigationController?.pushViewController(questionView!, animated: true)
        }
//        let min = (seconds / 60) % 60
//        let sec = seconds % 60
//
//       print(String(format: "%02d", min) + ":" + String(format: "%02d", sec))
    }

}

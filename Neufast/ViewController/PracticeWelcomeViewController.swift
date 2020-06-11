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
    var timeLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        self.createTimer()
//        self.updateTime()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        cancelTimer()
        let questionView = storyboard?.instantiateViewController(withIdentifier: "PracticeQueViewController")
        self.navigationController?.pushViewController(questionView!, animated: true)
    }

    
    //MARK: Timer
    func createTimer() {
//      if welcomeTimer == nil {
//        let timer = Timer(timeInterval: 1.0,
//          target: self,
//          selector: #selector(updateTime),
//          userInfo: nil,
//          repeats: true)
//        //RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
//       // timer.tolerance = 0.1
//
//        self.timer = timer
        
        welcomeTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateWelcomeTime), userInfo: nil, repeats: false)
        RunLoop.current.add(welcomeTimer!, forMode: RunLoopMode.commonModes)
        welcomeTimer!.tolerance = 0.1

//      }
    }
    
    func cancelTimer() {
            welcomeTimer?.invalidate()
            welcomeTimer = nil
    }

    
   
    
    @objc func updateWelcomeTime() {
        timeLeft = timeLeft - 1
        print("timeLeft: \(timeLeft)")
        if timeLeft <= 0 {
            welcomeTimer?.invalidate()
            welcomeTimer = nil
            print(timeLeft)
            let questionView = storyboard?.instantiateViewController(withIdentifier: "PracticeQueViewController")
            self.navigationController?.pushViewController(questionView!, animated: true)
        }
//        let min = (seconds / 60) % 60
//        let sec = seconds % 60
//
//       print(String(format: "%02d", min) + ":" + String(format: "%02d", sec))
    }

}

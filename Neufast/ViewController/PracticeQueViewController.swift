//
//  PracticeQueViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 03/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class PracticeQueViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var overlayQueLabel: UILabel!
    @IBOutlet weak var timeProgress: UIProgressView!
    @IBOutlet weak var answerBtn: UIButton!
    @IBOutlet weak var overlayView: UIView!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIView!
    
    var progress : Progress?
    
    var questions: [Any]?
    var timer: Timer?
    var loaderTimer: Timer?
    var loaderStartTime = 0
    var loaderEndTime = 5
    
    var overlayTimer: Timer?
    var overlayStartTime = 0
    var overlayEndTime = 3
    
    var endTime = 5
    var startTime = 0
    var selectedQuestion: String?
    var questionNo = 1
    var answerBtnText = "Answer"
    var backFromAns: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = ["Why don\'t you start by telling me little about yourself?", "What are your weaknesses?", "What are your strengths","How much is your total experience?", "What is the reason behind switching the job?", "Do you have any offer in hand?", "What is your notice period"]
        //self.title = "Question 1 of \(String(describing: questions?.count))"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6661407351, green: 0.7471138835, blue: 0.9474585652, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       // self.navigationItem.title = "Question 1 of \(String(describing: questions?.count))"
//        navigationController?.navigationBar.topItem?.title = "Route Options"
        self.overlayView.isHidden = true
        self.overlayQueLabel.text = ""
        self.progress = Progress(totalUnitCount: Int64(self.endTime))
        self.timeProgress.transform = timeProgress.transform.scaledBy(x: 1, y: 4)
        self.displayQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.overlayView.isHidden = true
       // self.title = "Question 1 of \(String(describing: questions?.count))"
        //backFromAns = self.setLoaderPointer(pointer: <#T##Bool#>)
        print("Back \(String(describing: backFromAns))")
    }
    
    func setLoaderPointer(pointer: Bool) {
        backFromAns = pointer
    }
    
    @IBAction func onAnswer(_ sender: Any) {
        self.cancelTimer()
        
        if answerBtnText == "Answer" {
//            let ansView = storyboard?.instantiateViewController(withIdentifier: "PracticeAnsViewController")
//            self.navigationController?.present(ansView!, animated: false, completion: nil)
            self.overlayView.isHidden = false
//           self.messageLabel.isHidden = true
//           self.questionLabel.isHidden = true
//           self.overlayQueLabel.text = self.questionLabel.text
//            self.view.addSubview(self.overlayView)
            self.questionLabel.bringSubview(toFront: self.overlayView)
            self.createOverlayTimer()
            answerBtnText = "Done"
            answerBtn.setImage(UIImage(named: "done"), for: .normal)
        } else if answerBtnText == "Done" {
            self.cancelOverlayTimer()
//            let loaderView = LoaderView(nibName: "LoaderView", bundle: nil)
//            let navigationController = UINavigationController(rootViewController: loaderView)
                           
            // Present View "Modally"
//            self.present(navigationController, animated: true, completion: nil)
            loaderStartTime = 0
            loaderTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLoaderTime), userInfo: nil, repeats: true)
            RunLoop.current.add(loaderTimer!, forMode: RunLoopMode.commonModes)
            loaderTimer!.tolerance = 0.1
            LoaderClass.startActivityIndicator(to_view: self.view)
//            if loaderTimer == nil {
//                let completeView = storyboard?.instantiateViewController(withIdentifier: "PracticeCompleteViewController")
//                self.navigationController?.pushViewController(completeView!, animated: true)
//            }
        }
    }
    
    @IBAction func onHelpCenter(_ sender: Any) {
        let helpView = storyboard?.instantiateViewController(withIdentifier: "GuidelineViewController")
        self.navigationController?.pushViewController(helpView!, animated: true)
    }
    
    
    
    func displayQuestion() {
        self.createTimer()
        if questions?.count != 0 {
//            let questionNo = questionNo -1
            print("questionNo: \(questionNo)")
            self.title = "Question \(questionNo) of \(String(describing: questions?.count))"
            selectedQuestion = questions![questionNo-1] as? String
             //print("questionNo: \(questionNo-1)")
        }
        questionLabel.text = self.selectedQuestion
       
    }
//    func updateQuestionNTime() {
//        if questions!.count != 0 {
//            for i in questions! {
//                questionLabel.text = questions?[0] as! String
////                timeLabel.text = self.createTimer()
//            }
//        } else {
//            return
//        }
//
////      if task.completed {
////        timeLabel.text = "Completed"
////      } else {
////       let time = Date().timeIntervalSince(task.creationDate)
//
//        let hours = Int(time) / 3600
//        let minutes = Int(time) / 60 % 60
//        let seconds = Int(time) % 60
//
//        var times: [String] = []
//        if hours > 0 {
//          times.append("\(hours)h")
//        }
//        if minutes > 0 {
//          times.append("\(minutes)m")
//        }
//        times.append("\(seconds)s")
//
//        timeLabel.text = times.joined(separator: " ")
//      }
    
    //MARK: Timer
    func createTimer() {
        startTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        timer!.tolerance = 0.1
        timeProgress.progress = Float(startTime)
    }
    
    func createOverlayTimer() {
        overlayStartTime = 0
        self.messageLabel.isHidden = true
        self.questionLabel.isHidden = true
        self.overlayQueLabel.text = self.questionLabel.text
        overlayTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateOverlayTime), userInfo: nil, repeats: true)
        RunLoop.current.add(overlayTimer!, forMode: RunLoopMode.commonModes)
        overlayTimer!.tolerance = 0.1
    }
    func cancelTimer() {
//        questionNo += 1
        timer?.invalidate()
        timer = nil
    }
    
    func cancelOverlayTimer() {
        overlayTimer?.invalidate()
        overlayTimer = nil
        self.overlayView.isHidden = true
    }
    
    @objc func updateLoaderTime() {
        loaderStartTime = loaderStartTime + 1
        if loaderStartTime == loaderEndTime {
            LoaderClass.stopActivityIndicator(to_view: self.view)
            loaderTimer?.invalidate()
            loaderTimer = nil
            if questionNo < questions!.count {
                answerBtnText = "Answer"
                answerBtn.setImage(UIImage(named: "answer"), for: .normal)
                displayQuestion()
            } else {
                let completeView = storyboard?.instantiateViewController(withIdentifier: "PracticeCompleteViewController")
                self.navigationController?.pushViewController(completeView!, animated: true)
            }
        }
    }
    
    @objc func updateOverlayTime() {
        overlayStartTime = overlayStartTime + 1
        print("overlayStartTime: \(overlayStartTime)")
        if overlayStartTime == overlayEndTime {
            overlayTimer?.invalidate()
            overlayTimer = nil
            self.messageLabel.isHidden = false
            self.questionLabel.isHidden = false
            self.overlayQueLabel.text = ""
            self.overlayView.isHidden = true            
        }
    }
    
    @objc func updateTime() {
        startTime = startTime + 1
        
//        timeLeft -= 1
//        timeLabel.text = "\(timeLeft)s"
        timeLabel.text = "\(startTime)s"
        self.progress?.completedUnitCount = Int64(startTime)
        
        let progressFloat = Float(self.progress!.fractionCompleted)
        self.timeProgress.setProgress(progressFloat, animated: true)
//        let color = self.downloadProgressBar.progressTintColor
//        self.downloadProgressBar.progressTintColor = self.downloadProgressBar.trackTintColor
//        self.downloadProgressBar.trackTintColor = color
        if startTime == endTime {
            questionNo = questionNo + 1
//            displayQuestion()
//            timer?.cancelTimer()
            timer?.invalidate()
            timer = nil
            if questionNo < questions!.count {
                displayQuestion()
            } else {
                answerBtnText = "Done"
                answerBtn.setImage(UIImage(named: "done"), for: .normal)
            }
        }
    }
    
    @objc func updateTimer() {
    }
    
}

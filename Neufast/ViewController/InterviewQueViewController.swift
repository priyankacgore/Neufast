//
//  PracticeQueViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 03/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class InterviewQueViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var iscrollView: UIScrollView!
    @IBOutlet weak var itimeLabel: UILabel!
    @IBOutlet weak var iquestionLabel: UILabel!
    @IBOutlet weak var imessageLabel: UILabel!
    @IBOutlet weak var ioverlayQueLabel: UILabel!
    @IBOutlet weak var interviewTimeProgress: UIProgressView!
    @IBOutlet weak var ianswerBtn: UIButton!
    @IBOutlet weak var ioverlayView: UIView!
    
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIView!
    
    var iprogress : Progress?
    
    var iquestions: [Any]?
    var itimer: Timer?
    var iloaderTimer: Timer?
    var iloaderStartTime = 0
    var iloaderEndTime = 5
    
    var ioverlayTimer: Timer?
    var ioverlayStartTime = 0
    var ioverlayEndTime = 3
    
    var iendTime = 5
    var istartTime = 0
    var iselectedQuestion: String?
    var iquestionNo = 1
    var ianswerBtnText = "Answer"
    var backFromAns: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iquestions = ["Why don\'t you start by telling me little about yourself?", "What are your weaknesses?", "What are your strengths","How much is your total experience?", "What is the reason behind switching the job?", "Do you have any offer in hand?", "What is your notice period"]
        //self.title = "Question 1 of \(String(describing: questions?.count))"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6661407351, green: 0.7471138835, blue: 0.9474585652, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       // self.navigationItem.title = "Question 1 of \(String(describing: questions?.count))"
//        navigationController?.navigationBar.topItem?.title = "Route Options"
        self.ioverlayView.isHidden = true
        self.ioverlayQueLabel.text = ""
        self.iprogress = Progress(totalUnitCount: Int64(self.iendTime))
        self.interviewTimeProgress.transform = interviewTimeProgress.transform.scaledBy(x: 1, y: 4)
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
        
        if ianswerBtnText == "Answer" {
//            let ansView = storyboard?.instantiateViewController(withIdentifier: "PracticeAnsViewController")
//            self.navigationController?.present(ansView!, animated: false, completion: nil)
            self.ioverlayView.isHidden = false
//            self.imessageLabel.isHidden = true
//            self.iquestionLabel.isHidden = true
//            self.ioverlayQueLabel.text = self.iquestionLabel.text
//            self.view.addSubview(self.overlayView)
            self.iquestionLabel.bringSubview(toFront: self.ioverlayView)
            self.createOverlayTimer()
            ianswerBtnText = "Done"
            ianswerBtn.setImage(UIImage(named: "done"), for: .normal)
        } else if ianswerBtnText == "Done" {
            self.cancelOverlayTimer()
//            let loaderView = LoaderView(nibName: "LoaderView", bundle: nil)
//            let navigationController = UINavigationController(rootViewController: loaderView)
                           
            // Present View "Modally"
//            self.present(navigationController, animated: true, completion: nil)
            iloaderStartTime = 0
            iloaderTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLoaderTime), userInfo: nil, repeats: true)
            RunLoop.current.add(iloaderTimer!, forMode: RunLoopMode.commonModes)
            iloaderTimer!.tolerance = 0.1
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
        if iquestions?.count != 0 {
//            let questionNo = questionNo -1
            print("questionNo: \(iquestionNo)")
            self.title = "Question \(iquestionNo) of \(String(describing: iquestions?.count))"
            iselectedQuestion = iquestions![iquestionNo-1] as? String
             //print("questionNo: \(questionNo-1)")
        }
        iquestionLabel.text = self.iselectedQuestion
       
    }
//    func updateQuestionNTime() {
//        if questions!.count != 0 {
//            for i in questions! {
//                iquestionLabel.text = questions?[0] as! String
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
//        itimeLabel.text = times.joined(separator: " ")
//      }
    
    //MARK: Timer
    func createTimer() {
        istartTime = 0
        itimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        RunLoop.current.add(itimer!, forMode: RunLoopMode.commonModes)
        itimer!.tolerance = 0.1
        interviewTimeProgress.progress = Float(istartTime)
    }
    
    func createOverlayTimer() {
        ioverlayStartTime = 0
        self.imessageLabel.isHidden = true
        self.iquestionLabel.isHidden = true
        self.ioverlayQueLabel.text = self.iquestionLabel.text
        ioverlayTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateOverlayTime), userInfo: nil, repeats: true)
        RunLoop.current.add(ioverlayTimer!, forMode: RunLoopMode.commonModes)
        ioverlayTimer!.tolerance = 0.1
    }
    func cancelTimer() {
//        questionNo += 1
        itimer?.invalidate()
        itimer = nil
    }
    
    func cancelOverlayTimer() {
        ioverlayTimer?.invalidate()
        ioverlayTimer = nil
        self.ioverlayView.isHidden = true
    }
    
    @objc func updateLoaderTime() {
        iloaderStartTime = iloaderStartTime + 1
        if iloaderStartTime == iloaderEndTime {
            LoaderClass.stopActivityIndicator(to_view: self.view)
            iloaderTimer?.invalidate()
            iloaderTimer = nil
            if iquestionNo < iquestions!.count {
                ianswerBtnText = "Answer"
                ianswerBtn.setImage(UIImage(named: "answer"), for: .normal)
                displayQuestion()
            } else {
                let icompleteView = storyboard?.instantiateViewController(withIdentifier: "InterviewFinishViewController")
                self.navigationController?.pushViewController(icompleteView!, animated: true)
            }
        }
    }
    
    @objc func updateOverlayTime() {
        ioverlayStartTime = ioverlayStartTime + 1
        print("overlayStartTime: \(ioverlayStartTime)")
        if ioverlayStartTime == ioverlayEndTime {
            ioverlayTimer?.invalidate()
            ioverlayTimer = nil
            self.imessageLabel.isHidden = false
            self.iquestionLabel.isHidden = false
            self.ioverlayQueLabel.text = ""
            self.ioverlayView.isHidden = true
        }
    }
    
    @objc func updateTime() {
        istartTime = istartTime + 1
        
//        timeLeft -= 1
//        itimeLabel.text = "\(timeLeft)s"
        itimeLabel.text = "\(istartTime)s"
        self.iprogress?.completedUnitCount = Int64(istartTime)
        
        let progressFloat = Float(self.iprogress!.fractionCompleted)
        self.interviewTimeProgress.setProgress(progressFloat, animated: true)
//        let color = self.downloadProgressBar.progressTintColor
//        self.downloadProgressBar.progressTintColor = self.downloadProgressBar.trackTintColor
//        self.downloadProgressBar.trackTintColor = color
        if istartTime == iendTime {
            iquestionNo = iquestionNo + 1
//            displayQuestion()
//            itimer?.cancelTimer()
            itimer?.invalidate()
            itimer = nil
            if iquestionNo < iquestions!.count {
                displayQuestion()
            } else {
                ianswerBtnText = "Done"
                ianswerBtn.setImage(UIImage(named: "done"), for: .normal)
            }
        }
    }
    
    @objc func updateTimer() {
    }
    
}

  /*  @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIView!
    var iprogress : Progress?
    
    var questions: [Any]?
    var itimer: Timer?
    var loaderTimer: Timer?
    var loaderStartTime = 0
    var loaderEndTime = 5
    
    var endTime = 5
    var startTime = 0
    var selectedQuestion: String?
    var questionNo = 1
    var answerBtnText = "Answer"
    var backFromAns: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = ["Why don\'t you start by telling me little about yourself?", "What are your weaknesses?", "What are your strengths","How much is your total experience?", "What is the reason behind switching the job?", "Do you have any offer in hand?", "What is your notice period"]
        self.title = "Question 1 of \(String(describing: questions?.count))"
        self.navigationController?.navigationBar.isHidden = false
       // self.navigationItem.title = "Question 1 of \(String(describing: questions?.count))"
//        navigationController?.navigationBar.topItem?.title = "Route Options"
        self.progress = Progress(totalUnitCount: Int64(self.endTime))
        self.interviewProgress.transform = interviewProgress.transform.scaledBy(x: 1, y: 4)
        self.displayQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Question 1 of \(String(describing: questions?.count))"
        //backFromAns = self.setLoaderPointer(pointer: <#T##Bool#>)
        print("Back \(String(describing: backFromAns))")
    }
    
    func setLoaderPointer(pointer: Bool) {
        backFromAns = pointer
    }
    
    @IBAction func onAnswer(_ sender: Any) {
        self.cancelTimer()
        if answerBtnText == "Answer" {
            let ansView = storyboard?.instantiateViewController(withIdentifier: "PracticeAnsViewController")
            self.navigationController?.present(ansView!, animated: false, completion: nil)
//            self.navigationController?.pushViewController(ansView!, animated:false)
            answerBtnText = "Done"
            answerBtn.setImage(UIImage(named: "done"), for: .normal)
        } else if answerBtnText == "Done" {
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
            selectedQuestion = questions![questionNo-1] as? String
        }
        
        iquestionLabel.text = self.selectedQuestion
       
    }
//    func updateQuestionNTime() {
//        if questions!.count != 0 {
//            for i in questions! {
//                questionLabel.text = questions?[0] as! String
////                itimeLabel.text = self.createTimer()
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
//      if timer == nil {
//        let timer = Timer(timeInterval: 1.0,
//          target: self,
//          selector: #selector(updateTimer),
//          userInfo: nil,
//          repeats: true)
//        RunLoop.current.add(timer, forMode: .RunLoopMode.commonModes)
//        timer.tolerance = 0.1
//
//        self.timer = timer
//      }
        startTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        timer!.tolerance = 0.1
        interviewProgress.progress = Float(startTime)
    }
    
    func cancelTimer() {
//        questionNo += 1
        timer?.invalidate()
        timer = nil
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
    @objc func updateTime() {
        startTime = startTime + 1
        
//        timeLeft -= 1
//        timeLabel.text = "\(timeLeft)s"
        timeLabel.text = "\(startTime)s"
        self.progress?.completedUnitCount = Int64(startTime)
        
        let progressFloat = Float(self.progress!.fractionCompleted)
        self.interviewProgress.setProgress(progressFloat, animated: true)
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
    
}*/

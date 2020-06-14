//
//  SettingViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 02/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit
import AVFoundation

class InterviewSettingController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var checkerView: UIView!
    @IBOutlet weak var lblNetwork: UILabel!
    @IBOutlet weak var lblCamera: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblLight: UILabel!
    @IBOutlet weak var lblMicrophone: UILabel!
    
    var captureSession = AVCaptureSession()

    var previewLayer = AVCaptureVideoPreviewLayer()

    var movieOutput = AVCaptureMovieFileOutput()

    var videoCaptureDevice : AVCaptureDevice?
    
    let interviewAlertInstance =  interviewAlert.ialertInstance
    
    override func viewDidLoad(){
        super.viewDidLoad()

        self.title = "Setting Quickcheck"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().barTintColor = UIColor(red: 154.0/255.0, green: 175.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6661407351, green: 0.7471138835, blue: 0.9474585652, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationItem.hidesBackButton = true
//        self.navigationController?.navigationBar.tintColor = UIColor.init(displayP3Red: 154.0, green: 176.0, blue: 238.0, alpha: 0)
        self.navigationController?.navigationBar.isHidden = false

        let device = AVCaptureDevice.devices(for: AVMediaType.video) as? [AVCaptureDevice]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onStart(_ sender: Any) {
        let titleText = "Once you start the video interview, you must finish the whole process."
        let messageText = "No breaks will be scheduled."
        interviewAlertInstance.showInterviewAlert(title: titleText, message: messageText, iconImg: UIImage(named: "interview-icon")!, firstBtnLabel: "I'm ready to start.", secondBtnLabel: "I want to practice again.", navController: self.navigationController!)
//        let interviewQueView = storyboard?.instantiateViewController(withIdentifier: "InterviewQueViewController")
//        self.navigationController?.pushViewController(interviewQueView!, animated: true)
    }
    
    @IBAction func onHelpCenter(_ sender: Any) {
//        let practiceWelcomeView = storyboard?.instantiateViewController(withIdentifier: "PracticeWelcomeController")
//        self.navigationController?.pushViewController(practiceWelcomeView!, animated: true)
        let helpView = storyboard?.instantiateViewController(withIdentifier: "GuidelineViewController")
        self.navigationController?.pushViewController(helpView!, animated: true)
    }
    
    func backClick() {
        self.dismiss(animated: true, completion: nil)
    }
}

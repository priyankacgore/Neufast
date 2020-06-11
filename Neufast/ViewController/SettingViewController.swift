//
//  SettingViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 02/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit
import AVFoundation

class SettingViewController: UIViewController {

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
    
    override func viewDidLoad(){
        super.viewDidLoad()

        self.title = "Setting Quickcheck"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(red: 154.0/255.0, green: 175.0/255.0, blue: 238.0/255.0, alpha: 1.0)
//        self.navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 154.0, green: 175.0, blue: 238.0, alpha: 1.0)
//        self.navigationController?.navigationBar.tintColor = UIColor.init(displayP3Red: 154.0, green: 176.0, blue: 238.0, alpha: 0)
        self.navigationController?.navigationBar.isHidden = false

        let device = AVCaptureDevice.devices(for: AVMediaType.video) as? [AVCaptureDevice]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onStart(_ sender: Any) {
        let practiceWelcomeView = storyboard?.instantiateViewController(withIdentifier: "PracticeWelcomeController")
        self.navigationController?.pushViewController(practiceWelcomeView!, animated: true)
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

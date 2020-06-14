//
//  HomeViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 28/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

enum viewType {
    case helloView
    case companyInfoView
    case InterviewInfoView
    case buttonView
}
class HomeViewController: UIViewController {//}, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var helloView: UIView!
    @IBOutlet weak var companyInfoView: UIView!
    @IBOutlet weak var InterviewInfoView: UIView!
    @IBOutlet weak var buttonView: UIView!
//    @IBOutlet weak var homeTableView: UITableView!
    
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    let viewTypeCount =  4
    let AlertInstance =  CustomAlert.alertInstance
    
    override func loadView() {
        super.loadView()
        //add tableview
        //view.addSubview(homeTableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
//        homeTableView.register(UINib(nibName: "HelloViewCell", bundle: nil), forCellReuseIdentifier: "HelloViewCell")
//        homeTableView.register(UINib(nibName: "companyInfoCell", bundle: nil), forCellReuseIdentifier: "companyInfoCell")
//        homeTableView.register(UINib(nibName: "InterviewInfoCell", bundle: nil), forCellReuseIdentifier: "InterviewInfoCell")
//        homeTableView.register(UINib(nibName: "ButtonViewCell", bundle: nil), forCellReuseIdentifier: "ButtonViewCell")
                       
               //homeTableView.estimatedRowHeight = 56
//        homeTableView.separatorStyle = .singleLine
//        homeTableView.rowHeight = UITableViewAutomaticDimension
//        homeTableView.delegate = self
//        homeTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let myURL = "https://www.youtube.com/watch?v=mBPg327obNM"
        let url = URL(string:myURL)

        player = AVPlayer(url: url!)

        avpController.player = player

        avpController.view.frame.size.height = videoView.frame.size.height

        avpController.view.frame.size.width = videoView.frame.size.width

        self.videoView.addSubview(avpController.view)
    }
    
    @IBAction func practiceInterview(_ sender: Any) {
        let practiceView = storyboard?.instantiateViewController(withIdentifier: "PracticeViewController")
        self.navigationController?.pushViewController(practiceView!, animated: true)
    }
    
    @IBAction func startInterview(_ sender: Any) {
//        let titleText = "We suggest you to practice interview answers first before starting the video interview."
//        let messageText = "Once you start the video interview, you must finish the whole process. No breaks will be scheduled."
//        CustomAlert.alertInstance.showAlert(title: titleText, message: messageText, iconImg: UIImage(named: "practice-icon")!, firstBtnLabel: "Practice", secondBtnLabel: "Start the Interview")
//        let interviewView = storyboard?.instantiateViewController(withIdentifier: "InterViewController")
//        self.navigationController?.pushViewController(interviewView!, animated: true)
      
//        let interviewAlert = interviewAlertView(nibName: "interviewAlertView", bundle: nil)
//        let navigationController = UINavigationController(rootViewController: interviewAlert)
//               // Present View "Modally"
//        self.present(navigationController, animated: true, completion: nil)
        
//        let interView = storyboard?.instantiateViewController(withIdentifier: "IntervieWelcomeController")
//              self.navigationController?.pushViewController(interView!, animated: true)
         let titleText = "We suggest you to practice interview answers first before starting the video interview."
        let messageText = "Once you start the video interview, you must finish the whole process. No breaks will be scheduled."
        AlertInstance.showAlert(title: titleText, message: messageText, iconImg: UIImage(named: "practice-icon")!, firstBtnLabel: "Practice", secondBtnLabel: "Start the Interview", navController: self.navigationController!)
//        AlertInstance.prepareScreen(navController: self.navigationController!)
    }
    
    @IBAction func onHelpCenter(_ sender: Any) {
        let helpView = storyboard?.instantiateViewController(withIdentifier: "GuidelineViewController")
        self.navigationController?.pushViewController(helpView!, animated: true)
    }
    
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         var cell = tableView.dequeueReusableCell(withIdentifier: "HelloViewCell", for: indexPath)
            if indexPath.row == 0 {
                cell = tableView.dequeueReusableCell(withIdentifier: "HelloViewCell", for: indexPath) as! HelloViewCell
            //cell.configure(with: message)
            } else if indexPath.row == 1 {//        case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: "companyInfoCell", for: indexPath) as! companyInfoCell
//            cell.configure(with: message)
            } else if indexPath.row == 2 {
//        case 2:
                cell = tableView.dequeueReusableCell(withIdentifier: "InterviewInfoCell", for: indexPath) as! InterviewInfoCell
            //            cell.configure(with: message)
            } else if indexPath.row == 3 {
//        case 3:
                cell = tableView.dequeueReusableCell(withIdentifier: "ButtonViewCell", for: indexPath) as! ButtonViewCell
            //            cell.configure(with: message)

            }
            return cell
    }
*/
}


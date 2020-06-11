//
//  PracticeCompleteViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 08/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class PracticeCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPracticeAgain(_ sender: Any) {
           let practiceView = storyboard?.instantiateViewController(withIdentifier: "PracticeViewController") as! UIViewController
           self.navigationController?.pushViewController(practiceView, animated: true)
       }
    
    @IBAction func onStartInterview(_ sender: Any) {
        let interView = storyboard?.instantiateViewController(withIdentifier: "IntervieWelcomeController")
              self.navigationController?.pushViewController(interView!, animated: true)
          }

       @IBAction func onBacktoHome(_ sender: Any) {
           let homeView = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
           self.navigationController?.pushViewController(homeView!, animated: true)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

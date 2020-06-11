//
//  successView.swift
//  Neufast
//
//  Created by Priyanka Gore on 27/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class interviewAlertView: UIViewController {
    
   
    @IBOutlet weak var practiceBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPractice(_ sender: Any) {
//       self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let practiceView = storyboard.instantiateViewController(withIdentifier: "PracticeViewController")
        self.navigationController?.pushViewController(practiceView, animated: true)
    }
    
    @IBAction func onStartInterview(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let interView = storyboard.instantiateViewController(withIdentifier: "IntervieWelcomeController")
        self.navigationController?.pushViewController(interView, animated: true)
//        self.dismiss(animated: true, completion: nil)
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

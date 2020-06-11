//
//  IntervieWelcomeController.swift
//  Neufast
//
//  Created by Priyanka Gore on 01/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class IntervieWelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func onStartNow(_ sender: Any) {
        let iSettingView = storyboard?.instantiateViewController(withIdentifier: "InterviewSettingController")
        self.navigationController?.pushViewController(iSettingView!, animated: true)
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    

}

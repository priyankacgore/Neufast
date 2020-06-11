//
//  PracticeViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 01/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func practiceNow(_ sender: Any) {
        let settingView = storyboard?.instantiateViewController(withIdentifier: "SettingViewController")
        self.navigationController?.pushViewController(settingView!, animated: true)
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
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

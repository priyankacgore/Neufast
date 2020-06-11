//
//  InterviewCompleteViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 08/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class InterviewCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogOut(_ sender: Any) {
        let loginview = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! UIViewController
        self.navigationController?.pushViewController(loginview, animated: true)
    }

    @IBAction func onProfile(_ sender: Any) {
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

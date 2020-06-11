//
//  LoginViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 27/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var accessCodeText: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var agreeBtn: UIButton!
    var isAgreed: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtnClick(_ sender: Any) {
        //print(pagecontrol.currentPage)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func privacyBtnClick(_ sender: Any) {
        // Register Nib
//        let privacyView = PrivacyPolicyViewController(nibName: "PrivacyPolicyViewController", bundle: nil)
//        let navigationController = UINavigationController(rootViewController: privacyView)
//
//        // Present View "Modally"
//        self.present(navigationController, animated: true, completion: nil)
        
//       let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: classForCoder))
//           QCPrivacyViewController *privacyViewController = [storyBoard instantiateViewControllerWithIdentifier:@"PrivacyView"];
//           [self.navigationController pushViewController:privacyViewController animated:YES];
        //let storyboard = UIStoryboard(name: "Main", bundle: MainBundle())//Bundle(for: classForCoder))
        let privacyView = storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyViewController")
        self.navigationController?.pushViewController(privacyView!, animated: true)
    }
    
    @IBAction func agreeBtnClick(_ sender: Any) {
        self.agreeBtn.isSelected = !self.agreeBtn.isSelected
        if(self.agreeBtn.isSelected) {
            isAgreed = true
            self.agreeBtn.setImage(UIImage(named: "filled-checkbox"), for: .normal)
        }
        else {
            self.isAgreed = false
            self.agreeBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        }
    }
    
    @IBAction func nextClick(_ sender: Any) {
        let welcomeView = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController")
        self.navigationController?.pushViewController(welcomeView!, animated: true)
        
    }
    
    
    @IBAction func cannotAccessClick(_ sender: Any) {
        let notAccessView = notAccessAccountView(nibName: "notAccessAccountView", bundle: nil)
        let navigationController = UINavigationController(rootViewController: notAccessView)
                
        // Present View "Modally"
        self.present(navigationController, animated: true, completion: nil)
//        let notAccessView = storyboard?.instantiateViewController(withIdentifier: "ViewController")
//        self.navigationController?.pushViewController(notAccessView!, animated: true)
    }
    
    func textFieldDidChange(textField: UITextField) {
        if self.emailText.text == "" || self.accessCodeText.text == "" {
            //Disable button
        } else {
            //Enable button
        }
    }
}

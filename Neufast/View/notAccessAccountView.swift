//
//  notAccessAccountView.swift
//  Neufast
//
//  Created by Priyanka Gore on 27/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class notAccessAccountView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailText.delegate = self
        self.emailText.addTarget(self, action: Selector("textFieldDidChange:"), for: UIControlEvents.editingChanged)
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    func textFieldDidChange(textField: UITextField) {
        self.sendBtn.isEnabled = false
        if self.emailText.text == "" {
            print("Enter Valid Email Address")
            //Disable button
        } else {
            self.sendBtn.isEnabled = true
        }
    }
    
    @IBAction func onSend(_ sender: Any) {
        
        let successVw = successView(nibName: "successView", bundle: nil)
        let navigationController = UINavigationController(rootViewController: successVw)
                
        // Present View "Modally"
        self.present(navigationController, animated: true, completion: nil)
        
//        let successVC = self.storyboard?.instantiateViewController(withIdentifier: "successVC") as! successView
//
//        self.present(successVC, animated: true, completion: nil)
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)        
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

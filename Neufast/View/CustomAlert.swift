//
//  CustomAlert.swift
//  Neufast
//
//  Created by Priyanka Gore on 10/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import Foundation
import UIKit

class CustomAlert: UIView {
    static let alertInstance = CustomAlert()
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        parentView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func showAlert(title: String, message: String, iconImg:UIImage, firstBtnLabel: String, secondBtnLabel: String) {        
        self.titleLbl.text = title
        self.messageLbl.text = message
        logoImgView.image = iconImg
        if firstBtnLabel != "" {
            firstBtn.titleLabel?.text = firstBtnLabel
        } else if secondBtnLabel != "" {
            secondBtn.titleLabel?.text = secondBtnLabel
        } else if secondBtnLabel == ""{
            firstBtn.isHidden = true
        }
        
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onFirstBtnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let practiceView = storyboard.instantiateViewController(withIdentifier: "PracticeViewController")
//        let navigationController = UINavigationController(rootViewController: practiceView)
        let navigationController = UINavigationController(nibName: "PracticeViewController", bundle: nil)
        navigationController.pushViewController(practiceView, animated: true)
//        navigationController.pushViewController(practiceView, animated: true)
    }
    
    @IBAction func onSecondBtnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let interView = storyboard.instantiateViewController(withIdentifier: "IntervieWelcomeController")
        _ = UINavigationController(rootViewController: interView)
        UINavigationController().pushViewController(interView, animated: true)
    }
    
    @IBAction func onCloseClick(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}

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
    
    var navigationController: UINavigationController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)![0] as! UIView
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        parentView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // And create a method which take a navigation controller
    func prepareScreen(navController: UINavigationController)-> UIView {
//        parentView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        navigationController = navController
        let nibView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)![0] as! UIView
        self.addSubview(nibView)
        return nibView
      }

    // In Button action
    func showAlert(title: String, message: String, iconImg:UIImage, firstBtnLabel: String, secondBtnLabel: String, navController: UINavigationController!) -> UIView {
        navigationController = navController
        parentView = Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)![0] as! UIView
        self.titleLbl.text = title
        self.messageLbl.text = message
        logoImgView.image = iconImg
        if firstBtnLabel != "" {
            firstBtn.titleLabel?.text = firstBtnLabel
        }
        if secondBtnLabel != "" {
            secondBtn.titleLabel?.text = secondBtnLabel
        } else if secondBtnLabel == ""{
            secondBtn.isHidden = true
        }
//         prepareScreen(navController: navController)
//        self.addSubview(parentView)
//
//        return parentView
        UIApplication.shared.keyWindow?.addSubview(parentView)
        return parentView
    }
    
    @IBAction func onFirstBtnClick(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let practiceView = storyboard.instantiateViewController(withIdentifier: "PracticeViewController")
////        let navigationController = UINavigationController(rootViewController: practiceView)
//        let navigationController = UINavigationController(nibName: "PracticeViewController", bundle: nil)
//        navigationController.pushViewController(practiceView, animated: true)
        parentView.removeFromSuperview()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let practiceViewController = storyBoard.instantiateViewController(withIdentifier: "PracticeViewController")
        navigationController?.pushViewController(practiceViewController, animated: true)

//        navigationController.pushViewController(practiceView, animated: true)
    }
    
    @IBAction func onSecondBtnClick(_ sender: Any) {
        parentView.removeFromSuperview()

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let interView = storyboard.instantiateViewController(withIdentifier: "IntervieWelcomeController")
//        _ = UINavigationController(rootViewController: interView)
//        UINavigationController().pushViewController(interView, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let interViewController = storyBoard.instantiateViewController(withIdentifier: "IntervieWelcomeController")
        navigationController?.pushViewController(interViewController, animated: true)
    }
    
    @IBAction func onCloseClick(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}

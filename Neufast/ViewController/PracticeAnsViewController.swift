//
//  PracticeAnswerViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 07/06/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class PracticeAnsViewController: UIViewController {

    @IBOutlet weak var overlayImagView: UIImageView!
    @IBOutlet weak var countDownImg: UIImageView!
    var practiceQueController: PracticeQueViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDone(_ sender: Any) {
//        let completeView = storyboard?.instantiateViewController(withIdentifier: "PracticeCompleteViewController")
//        self.navigationController?.pushViewController(completeView!, animated: true)
//        let loaderView = LoaderView(nibName: "LoaderView", bundle: nil)
//        let navigationController = UINavigationController(rootViewController: loaderView)
//                       
//        // Present View "Modally"
//        self.present(navigationController, animated: true, completion: nil)
        
//        let completeView = storyboard?.instantiateViewController(withIdentifier: "PracticeCompleteViewController")
//        self.navigationController?.pushViewController(completeView!, animated: true)
//        let vc = PracticeQueViewController()
////        vc.backFromAns = 1
        let backFromAns = true
        practiceQueController?.backFromAns = true
        practiceQueController?.setLoaderPointer(pointer: backFromAns)
        self.dismiss(animated: false, completion: nil)
        self.navigationController?.popViewController(animated: false)
        if backFromAns == true{
            practiceQueController?.loaderView.isHidden = false
            practiceQueController?.answerBtn.setImage(UIImage(named: "done"), for: .normal)
            practiceQueController?.view.bringSubview(toFront:  practiceQueController!.loaderView)
            practiceQueController?.activityLoader.isHidden = false
            practiceQueController?.activityLoader.startAnimating()
        }
//        self.navigationController?.popToViewController(vc, animated: true)
//        self.navigationController?.popToViewController(vc, animated: true)
//        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onHelpCenter(_ sender: Any) {
        let helpView = storyboard?.instantiateViewController(withIdentifier: "GuidelineViewController")
        self.navigationController?.pushViewController(helpView!, animated: true)
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

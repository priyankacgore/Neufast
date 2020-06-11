//
// LoaderClass.swift

import Foundation
import UIKit

struct LoaderClass {
    
    // MARK: ----------> MBProgressHUD Showing And Hiding Methods <----------
    static func startActivityIndicator(to_view : UIView) {
        
        let hud = MBProgressHUD.showAdded(to:to_view, animated: true)
        
         hud.label.text = "Loading..."
       // hud.animationType = .zoomIn
        hud.label.textColor = UIColor.darkGray
        hud.label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)!
//        hud.hide(animated: true, afterDelay: 5.0)
        /*
         //----------> Call Method like this <----------
         ModelClass.startActivityIndicator(to_view: self.view)
         
         */
    }
   
    static func stopActivityIndicator(to_view : UIView) {
        
        MBProgressHUD.hide(for: to_view, animated: true)
        /*
         //----------> Call Method like this <----------
         MModelClass.stopActivityIndicator(to_view: self.view)
         */
    }
    
    // MARK:- ----------> AlertView with title Method <----------
    
   static func show_AlertView_With_Title(alert_Title: String, alert_msg: String , viewController : UIViewController) {
        
        DispatchQueue.main.async(execute: {
            var alert = UIAlertController(title: alert_Title, message: alert_msg, preferredStyle: .alert)
            
            func yesHandler(_ actionTarget: UIAlertAction) {
                
            }
            //event handler with predefined function
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: yesHandler));
            
            viewController.present(alert, animated: true, completion: nil)
        })

        /*
            //----------> Call Method like this <----------
     
        ModelClass.show_AlertView_With_Title(alert_Title: "Test Alert", alert_msg: "Test Message To Display", viewController: self)

        */
    }
}

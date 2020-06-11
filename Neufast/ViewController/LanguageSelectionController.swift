//
//  LanguageSelectionController.swift
//  Neufast
//
//  Created by Priyanka Gore on 27/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class LanguageSelectionController: UIViewController {
    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var chineseSimBtn: UIButton!
    @IBOutlet weak var chineseTradBtn: UIButton!
    var selectedLang: String = "en"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextClick(){
        print("Language: \(selectedLang)")
        UserDefaults.standard.set(selectedLang, forKey: "selectedLanguage")
        Bundle.setLanguage(selectedLang)
        let introView = storyboard?.instantiateViewController(withIdentifier: "IntroViewController")
        self.navigationController?.pushViewController(introView!, animated: true)
    }
    
    @IBAction func englishBtnClick(_ sender: Any) {
    self.englishBtn.isSelected = !self.englishBtn.isSelected
    if(self.englishBtn.isSelected) {
        self.selectedLang = "en"
        //isAgreed = true
        self.englishBtn.setImage(UIImage(named: "filled-circle"), for: .normal)
        self.chineseSimBtn.setImage(UIImage(named: "circle"), for: .normal)
        self.chineseTradBtn.setImage(UIImage(named: "circle"), for: .normal)
    }
    else {
        //self.isAgreed = false
        self.englishBtn.setImage(UIImage(named: "circle"), for: .normal)
//        self.chineseSimBtn.setImage(UIImage(named: "circle"), for: .normal)
//        self.chineseTradBtn.setImage(UIImage(named: "circle"), for: .normal)
    }
    }
    
    @IBAction func chineseSimBtnClick(_ sender: Any) {
    self.chineseSimBtn.isSelected = !self.chineseSimBtn.isSelected
    if(self.chineseSimBtn.isSelected) {
        self.selectedLang = "zh-Hans"
        //isAgreed = true
        self.englishBtn.setImage(UIImage(named: "circle"), for: .normal)
        self.chineseSimBtn.setImage(UIImage(named: "filled-circle"), for: .normal)
        self.chineseTradBtn.setImage(UIImage(named: "circle"), for: .normal)
    }
    else {
        //self.isAgreed = false
        self.chineseSimBtn.setImage(UIImage(named: "circle"), for: .normal)
    }
    }
    
    @IBAction func chineseTradBtnClick(_ sender: Any) {
    self.chineseTradBtn.isSelected = !self.chineseTradBtn.isSelected
    if(self.chineseTradBtn.isSelected) {
        //isAgreed = true
        self.selectedLang = "zh-Hant"
        self.englishBtn.setImage(UIImage(named: "circle"), for: .normal)
        self.chineseSimBtn.setImage(UIImage(named: "circle"), for: .normal)
        self.chineseTradBtn.setImage(UIImage(named: "filled-circle"), for: .normal)
    }
    else {
        //self.isAgreed = false
        self.chineseTradBtn.setImage(UIImage(named: "circle"), for: .normal)
    }
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

extension Bundle {
    class func setLanguage(_ language: String) {
        var onceToken: Int = 0
        if(onceToken == 0) {
            object_setClass(Bundle.main, PrivateBundle.self)
        }
        onceToken = 1
        objc_setAssociatedObject(Bundle.main, &associatedLanguageBundle, (language != nil) ? Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj") ?? "") : nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC )
    }
}

private var associatedLanguageBundle:Character = "0"

class PrivateBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let bundle: Bundle? = objc_getAssociatedObject(self, &associatedLanguageBundle) as? Bundle
        return(bundle != nil) ? (bundle!.localizedString(forKey: key, value: value, table: tableName)) : (super.localizedString(forKey: key, value: value, table: tableName))
    }
}

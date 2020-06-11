//
//  IntroViewController.swift
//  Neufast
//
//  Created by Priyanka Gore on 27/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    var arrImages : [UIImage] = []
    var CountImg : Int = 0
//    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrImages = [UIImage(named: "IntroScreen1"),
                     UIImage(named: "IntroScreen2"),
                     UIImage(named: "IntroScreen3"),
                     UIImage(named: "IntroScreen4")] as! [UIImage]
//        nextbtn.setTitle("Next", for: .normal)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        self.loadScrollView()
    }

    func loadScrollView() {
        let pageCount = arrImages.count
        scrollview.frame = view.bounds
        scrollview.delegate = self
        scrollview.backgroundColor = UIColor.clear
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = true
        scrollview.showsVerticalScrollIndicator = false
        
        pagecontrol.numberOfPages = pageCount
        pagecontrol.currentPage = 0
        
        for i in (0..<pageCount) {
            
            let imageView = UIImageView()
            imageView.frame = CGRect(x: i * Int(self.view.frame.size.width) , y: 0, width:
                Int(self.view.frame.size.width) , height: Int(self.view.frame.size.height)-100)
            
            imageView.image = arrImages[i]
            self.scrollview.addSubview(imageView)
        }
        
        let width1 = (Float(arrImages.count) * Float(self.view.frame.size.width))
        scrollview.contentSize = CGSize(width: CGFloat(width1), height: self.view.frame.size.height)
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pagecontrol.currentPage = Int(pageNumber)
        CountImg = pagecontrol.currentPage
    }

    @IBAction func backbtnClick(_ sender: Any) {
        print(pagecontrol.currentPage)
        
    }

    @IBAction func skipBtnClick(_ sender: Any) {
        //skipBtn.setTitle("Skip", for: .normal)
        let loginview = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! UIViewController
        self.navigationController?.pushViewController(loginview, animated: true)
    }
//    @IBAction func NextbtnClick(_ sender: Any) {
//
//        if CountImg < arrImages.count - 1 {
//
//            CountImg = CountImg + 1
//            pagecontrol.currentPage = CountImg
//            let xval = Int(CGFloat(CountImg) * scrollview.frame.size.width)
//            print(xval)
//            scrollview.setContentOffset(CGPoint(x: xval, y: 0), animated: true)
//            nextbtn.setTitle("Next", for: .normal)
//
//        } else {
//            print("Do Not Move Next Page!!!!!")
//            pagecontrol.currentPage = CountImg
//            nextbtn.setTitle("Skip", for: .normal)
//            let loginview = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! UIViewController
//            self.navigationController?.pushViewController(loginview, animated: true)
//        }
//    }

    @IBAction func pagecontrolbtnClick(_ sender: Any) {

        let xval = Int(CGFloat(pagecontrol.currentPage) * scrollview.frame.size.width)
        scrollview.setContentOffset(CGPoint(x: xval, y: 0), animated: true)
        CountImg = pagecontrol.currentPage
    }

}

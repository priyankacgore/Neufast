//
//  HomeVideoView.swift
//  Neufast
//
//  Created by Priyanka Gore on 28/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit
import AVKit


class HomeVideoView: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    init() {
//        super.init()
//        let myURL = ""
//        let url = URL(string:myURL)
//
//        player = AVPlayer(url: url!)
//
//        avpController.player = player
//
//        avpController.view.frame.size.height = videoView.frame.size.height
//
//        avpController.view.frame.size.width = videoView.frame.size.width
//
//        self.videoView.addSubview(avpController.view)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

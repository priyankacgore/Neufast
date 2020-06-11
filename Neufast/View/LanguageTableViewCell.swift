//
//  LanguageTableViewCell.swift
//  Neufast
//
//  Created by Priyanka Gore on 26/05/20.
//  Copyright © 2020 Asiapay. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet var langLabel: UILabel!
    @IBOutlet var selectBox: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

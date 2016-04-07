//
//  SpeakerTableViewCell.swift
//  FISU_application
//
//  Created by LoïcDumas on 07/04/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class SpeakerTableViewCell: UITableViewCell {
    var speaker : Speaker?
    
    @IBOutlet weak var speakerNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

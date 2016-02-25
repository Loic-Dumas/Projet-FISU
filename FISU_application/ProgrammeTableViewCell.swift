//
//  ProgrammeTableViewCell.swift
//  FISU_application
//
//  Created by Arnaud ZARAGOZA on 23/02/2016.
//  Copyright © 2016 Arnaud ZARAGOZA. All rights reserved.
//

import UIKit

class ProgrammeTableViewCell: UITableViewCell {

    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityBeginning: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MessageTableViewCell.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/27/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var myEmailLabel: UILabel!
    
    @IBOutlet weak var myUserTypeLabel: UILabel!
    
    @IBOutlet weak var myCellLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

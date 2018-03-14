//
//  eSmartTableViewCell.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/1/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class eSmartTableViewCell: UITableViewCell {

    @IBOutlet weak var myCellImage: UIImageView!
   
    @IBOutlet weak var myContent_title_ar: UILabel!
    @IBOutlet weak var myContent_url: UILabel!
    @IBOutlet weak var myContent_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var myContent_body: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}

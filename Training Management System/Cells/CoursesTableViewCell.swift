//
//  CoursesTableViewCell.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/5/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var myCourse_image: UIImageView!
    @IBOutlet weak var myCourse_timing: UILabel!
    @IBOutlet weak var myCourse_fee: UILabel!
    @IBOutlet weak var myCourse_end: UILabel!
    @IBOutlet weak var myCourse_name: UILabel!
    @IBOutlet weak var myCourse_starting: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

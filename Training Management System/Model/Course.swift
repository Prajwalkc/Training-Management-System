//
//  Course.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/5/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class Course: NSObject {
    var course_name :String?
    var course_starting : String?
    var course_timing :  String?
    var course_end : String?
    var course_body : String?
    var course_fee : String?
    var featured_img : String?
    
    
    init(json : NSDictionary) {
        self.course_name = json["course_name"] as? String
        self.course_end = json["course_end"] as? String
        self.course_fee = json["course_fee"] as? String
        self.featured_img = json["featured_img"] as? String
        self.course_starting = json["course_starting"] as? String
        self.course_body = json["course_body"] as? String
        self.course_timing = json["course_timing"] as? String
    }
}

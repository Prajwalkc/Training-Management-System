//
//  eSmartNewsView.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/1/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
class eSmartNewsView: NSObject {
    var content_title : String?
    var content_url : String?
    var content_page_title : String?
    var content_body : String?
    var featured_img : String?
    
     init(json : NSDictionary) {
            self.content_title = json["content_title"] as? String
            self.content_url = json["content_url"] as? String
        self.content_page_title = json["content_page_title"] as? String
        self.content_body = json["content_body"] as? String
    self.featured_img = json["featured_img"] as? String
    }
}

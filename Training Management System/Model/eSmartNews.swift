//
//  eSmartNews.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/28/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class eSmartNews: NSObject {
  
    var content_page_title : String?
    var content_body : String?
    var content_id : String?
    var content_title : String?
    var content_url : String?
    var featured_img : String?
    var content_title_ar : String?

     init(json : NSDictionary) {
        self.content_id = json["content_id"] as? String
        self.content_title = json["content_title"] as? String
        self.content_url = json["content_url"] as? String
        self.content_title_ar = json["content_title_ar"] as? String
        self.featured_img = json["featured_img"] as? String
        self.content_body = json["content_body"] as? String
        self.content_page_title = json["content_page_title"] as? String
    }
}

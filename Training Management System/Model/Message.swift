//
//  Message.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/5/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class Message: NSObject {
    var text : String?
    var fromID : String?
    var toID : String?
    
    
    init(json : NSDictionary) {
        self.text = json["text"] as? String
        self.fromID = json["fromID"] as? String
        self.toID = json["toMail"] as? String
    }
}

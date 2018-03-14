//
//  Student.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/27/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class Student: NSObject {
    var name : String?
    var email : String?
    var userType : String?
  


    init(json : NSDictionary){
        self.name = json["name"] as? String
        self.email = json["email"] as? String
        self.userType = json["userType"] as? String
    }
}

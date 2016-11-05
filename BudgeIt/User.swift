//
//  User.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import Foundation

class User {
    var username:String
    var email:String
    var zip:Int
    var occupation:String
    
    init(username:String,email:String,zip:Int,occupation:String) {
        self.username = username
        self.email = email
        self.zip = zip
        self.occupation = occupation
    }
    
}

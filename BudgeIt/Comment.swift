//
//  Comment.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


class Comment{
    var text:String!
    var postedBy:FIRUser?
    var datePosted:NSDate!
    
    init(text:String,postedBy:FIRUser, datePosted:NSDate) {
        self.text = text
        self.postedBy = postedBy
        self.datePosted = datePosted
    }
    
    
}

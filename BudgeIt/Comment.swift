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
    var postedBy:String
    var datePosted:NSDate!
    
    init(text:String,postedBy:String, datePosted:NSDate) {
        self.text = text
        self.postedBy = postedBy
        self.datePosted = datePosted
    }
    
    init(d: [String:AnyObject]){
        self.text = d["text"] as! String
        self.postedBy = d["postedBy"] as! String
        self.datePosted = d["datePosted"] as! NSDate
    }
    
    class func commentsFromDictionary(d:[[String:AnyObject]]) -> [Comment]{
        var comments = [Comment]()
        for dict in d{
            comments.append(Comment(d: dict))
        }
        return comments
    }
    
    
}

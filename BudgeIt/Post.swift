//
//  Post.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class Post{
    var title:String
    var id:Int = 0
    var text:String
    var numRatings:Int
    var ratedBy:[Int:Float]
    var totalRating:Int
    var comments:Array<Comment>
    var zip:Int
    var postedBy:String
    var datePosted:NSDate
    
    init(title:String,id:Int,text:String,numR:Int,ratedBy:[Int:Float],totalRating:Int,comments:Array<Comment>,zip:Int,postedBy:String,datePosted:NSDate){
        self.title = title
        self.id = id
        self.text = text
        self.numRatings = numR
        self.totalRating = totalRating
        self.comments = comments
        self.zip = zip
        self.postedBy = postedBy
        self.datePosted = datePosted
        self.ratedBy = ratedBy
    }
}

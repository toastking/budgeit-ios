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
    var dictionary:[String:AnyObject]
    static var cUser:User?
    class var currentUser:User?{
        get {
            
            if cUser == nil{
                let defaults = UserDefaults.standard
                
                let currentUserData = defaults.object(forKey: "currentUser") as? Data
                
                if let currentUserData = currentUserData{
                    let dictionary = try! JSONSerialization.jsonObject(with: currentUserData as Data, options: [])
                    
                    cUser = User(d: dictionary as! [String:AnyObject])
                }
            }
            
            return cUser
            
        }
        set(user) {
            cUser = user
            let defaults = UserDefaults.standard
            
            if let user = user{
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary, options: [])
                defaults.set(data, forKey: "currentUser")
            }else{
                //store the nil in storage
                defaults.set(nil, forKey: "currentUser")
            }
            
            //save the object
            defaults.synchronize()
        }
    }
    
    init(username:String,email:String,zip:Int,occupation:String,d:[String:AnyObject]) {
        self.username = username
        self.email = email
        self.zip = zip
        self.occupation = occupation
        self.dictionary = d
    }
    
    init(d:[String:AnyObject]){
        self.username = d["username"] as! String
        self.email = d["email"] as! String
        self.zip = d["zip"] as! Int
        self.occupation = d["occupation"] as! String
        self.dictionary = d
    }
    
    
}

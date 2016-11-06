//
//  HomeViewController.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!

    var ref:FIRDatabaseReference!=nil
    
    var posts:[Post]!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        posts = []
        
        ref = FIRDatabase.database().reference()
       
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        //get the data
        ref.child("posts").observe(.value, with: { snapshot in
//            print(snapshot.value)
//            self.posts = Post.PostsWithArray(dicts: snapshot.value as! [[String: AnyObject]])
            print(snapshot)
        })
        
        homeTableView.rowHeight = UITableViewAutomaticDimension //set thiis so autolayout will decide the height
        homeTableView.estimatedRowHeight = 200
        
     
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath) as! HomeTableViewCell
        //assign the business
        cell.post = posts[indexPath.row]
        
        return cell
    }

    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if posts.count == 0{
            return 0
        }else{
            return posts.count
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignOutPress(_ sender: AnyObject) {
        print("signing out..")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

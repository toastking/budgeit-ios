//
//  HomeViewController.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!

    var posts:[Post]!
    var ref:FIRDatabaseReference?=nil
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
//        homeTableView.delegate = self
//        homeTableView.dataSource = self
        homeTableView.rowHeight = UITableViewAutomaticDimension //set thiis so autolayout will decide the height
        homeTableView.estimatedRowHeight = 200
        
     
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

//
//  AddPostViewController.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import CoreLocation

class AddPostViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var postTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    let locationManager = CLLocationManager() //get the current locaiton
    var location:CLLocation!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        
        view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = manager.location!
        print("locations = \(self.location)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSubmitButtonPress(_ sender: Any) {
        
        var currentZip:Int?
        // get the current zip
        CLGeocoder().reverseGeocodeLocation(self.location, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                
                currentZip = Int(pm.postalCode!) //prints zip code
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
        
        
        let date = Date()
        let dateFormatter = DateFormatter()
        
        
        let postDictionary:NSDictionary = ["title" : titleTextField.text! as? String,
                           "text" : postTextField.text! as? String!,
                           "datePosted" :dateFormatter.string(from: date) ,
                           "numRatings" : 0,
                           "ratings": [String:AnyObject](),
                           "totalRating": 0,
                           "postedBy": FIRAuth.auth()?.currentUser?.displayName ?? "anonymous",
                           "zip": currentZip ?? 0]
        
        ref.child("posts").childByAutoId().setValue(postDictionary)
        //TODO: add segue
        
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

//
//  LoginViewController.swift
//  BudgeIt
//
//  Created by Matt on 11/5/16.
//  Copyright © 2016 Matt Del Signore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSignUpButtonPress(_ sender: AnyObject) {
        let signupAlert = UIAlertController(title: "Sign Up", message: "Sign up for the app", preferredStyle: .alert)
        
        //add sign up text fields
        signupAlert.addTextField { (textField) in
            textField.placeholder = "Username"
        }
        
        signupAlert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        signupAlert.addTextField { (textField) in
            textField.placeholder = "Email"
            textField.keyboardType = .emailAddress
        }
        
        signupAlert.addTextField { (textField) in
            textField.placeholder = "Occupation"
        }
        
        signupAlert.addTextField { (textField) in
            textField.placeholder = "ZipCode"
            textField.keyboardType = .numberPad
        }
        
        let signUpAction = UIAlertAction(title:"signup", style: .default) { (_) in
            let usernameField = signupAlert.textFields![0] as UITextField
            let passwordField = signupAlert.textFields![1] as UITextField
            let emailField = signupAlert.textFields![2] as UITextField
            let occupationField = signupAlert.textFields![3] as UITextField
            let zipcodeField = signupAlert.textFields![4] as UITextField
            //TODO: add data to database
            FIRAuth.auth()!.createUser(withEmail: emailField.text!,
                                       password: passwordField.text!) { user, error in
                                        if let user = user {
                                            //save the data for the user
                                        }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        signupAlert.addAction(signUpAction)
        signupAlert.addAction(cancelAction)
        self.present(signupAlert,animated: true )
    }
    
    @IBAction func onLoginButtonPress(_ sender: AnyObject) {
        
        FIRAuth.auth()?.signIn(withEmail: self.userNameField.text!, password: self.passwordField.text!) { (user, error) in
            if(error == nil){
                //perform the segue
                self.shouldPerformSegue(withIdentifier: "LoginSegue", sender: self)
            }
        }
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

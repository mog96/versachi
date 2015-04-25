//
//  LoginViewController.swift
//  versachi
//
//  Created by Mateo Garcia on 4/25/15.
//  Copyright (c) 2015 Theta Delta Chi, Eta Deuteron Charge. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signupField: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func emailStart(sender: AnyObject) {
        self.emailField.text = ""
    }
    
    
    @IBAction func passwordStart(sender: AnyObject) {
        self.passwordField.text = ""
    }
    @IBAction func signupPressed(sender: AnyObject) {
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                println("signupwinning")
            } else {
                println("signuplosing")
                
                //let errorString = error.userInfo["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }
    }
    
    @IBAction func loginPressed(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(emailField.text, password: passwordField.text) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                println("winning")
                self.performSegueWithIdentifier("login", sender: self)
            } else {
                println("losing")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}


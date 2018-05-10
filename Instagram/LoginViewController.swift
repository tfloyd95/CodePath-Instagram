//
//  LoginViewController.swift
//  Instagram
//
//  Created by Tavien on 2/25/18.
//  Copyright © 2018 Warpedflo. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any)
    {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil
            {
                print("You're logged in!")
            }
            else
            {
                let error = error
                print(error?.localizedDescription)
                /*if error?.code == 202
                 {
                 print("Username has already been taken")
                 }*/
                
            }
        }
       
    }
    
    @IBAction func OnSignUp(_ sender: Any)
    {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                
            }

                
        }
    }
}


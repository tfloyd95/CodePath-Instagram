//
//  ViewController.swift
//  Instagram
//
//  Created by ARG Lab on 2/25/18.
//  Copyright © 2018 Odin. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityIndicator.stopAnimating()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        loginUser()
    }
    @IBAction func signupButton(_ sender: Any) {
        registerUser()
    }
    
    func loginUser() {
        activityIndicator.startAnimating()
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        if (username.isEmpty || password.isEmpty){
            let alert = UIAlertController(title: nil, message: "Username or Password is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            activityIndicator.stopAnimating()
        }
        
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.activityIndicator.stopAnimating()
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
        }
    }
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        newUser.username = usernameLabel.text ?? ""
        newUser.password = passwordLabel.text ?? ""
        
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                //self.performSegue(withIdentifier: "pushSegue" , sender: self)
                
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


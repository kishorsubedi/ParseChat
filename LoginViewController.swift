//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Kishor Subedi on 3/3/18.
//  Copyright © 2018 Kishor Subedi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                print("You're logged in!")
                
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        
        let newuser = PFUser()
        
        newuser.username = usernameField.text
        newuser.password = passwordField.text
        
        newuser.signUpInBackground { (success: Bool, error: Error?) in
            
            if success
            {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                print("yay, created a new user")
            }
            else
            {
                print(error?.localizedDescription ?? "Not a way")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  LoginViewController.swift
//  ObjectiveCApp
//
//  Created by Aileen Taboy on 10/13/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //log out user
//        let firebaseAuth = FIRAuth.auth()
//        do {
//            try firebaseAuth?.signOut()
//        } catch let signOutError as NSError {
//            print ("Error signing out: %@", signOutError)
//        }

        //check state of user
        let currentUserStatusCheck = CurrentUser()
        currentUserStatusCheck.checkUSerStatus { (isLogged) in
            
            switch isLogged {
            case true:
                print("user logged in!")
                self.performSegue(withIdentifier: "accountCreated", sender: self)
            case false:
                
                print("user not logged ")
                //self.performSegue(withIdentifier: "", sender: self)
                
            }
            
            
        }
        
        
        formatView()
        

        
       
    }
    
   
    
    func formatView() {
        //add radius to login button
        loginButton.layer.cornerRadius = 5
        
        passWord.setBottomBorder(borderColor: .darkGray)
        userName.setBottomBorder(borderColor: .darkGray)
     
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func CreateAccountAction(_ sender: UIButton) {
        
        let username = userName.text!
        let password = passWord.text!
        
        if username.characters.count > 0 && password.characters.count > 0 {
            
        
        FIRAuth.auth()?.createUser(withEmail: username, password: password, completion: { (user, error) in
            
            if error == nil {
                
                
                //MARK: segue to next view
                
                createAccount(user: user!)
                
                self.performSegue(withIdentifier: "accountCreated", sender: self)
                
                
            } else {
          
                
                self.alertControllerView(title: "Error", message: (error?.localizedDescription)!)
                
                
            }
            
            
        })
        
        } else {
            self.alertControllerView(title: "Fill in all fields", message: "please fill in all the required fields")
        }
        
        
    }
    
    
    
    

    @IBAction func loginButton(_ sender: AnyObject) {
        
        
        if userName.text?.characters.count == 0 || passWord.text?.characters.count == 0 {
            self.alertControllerView(title: "Credential Error", message: "Please fill in all the credentials")
        }
            
            FIRAuth.auth()?.signIn(withEmail: userName.text!, password: passWord.text!, completion: { (user, error) in
                
//                
//                // tell user if they are not verified
//                if user?.isEmailVerified == false {
//                    
//                    self.alertControllerView(title: "Verify Email", message: "Please verify your email before loging in.")
//                    
//                }
                
                if (error != nil) {
                    
                    if let userInfo = error?.localizedDescription {
                        
                        self.alertControllerView(title: "Error", message: userInfo)
                        
                    }
                    
                }
                // add error handeling here for loging errors
                
            })
            
        
        
        
        
        
    }
    
    
    func alertControllerView(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
   
}

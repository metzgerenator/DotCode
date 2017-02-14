//
//  ProfileViewController.swift
//  DotCode
//
//  Created by Aileen Taboy on 2/13/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var DeveloperName: UILabel!
    
    @IBOutlet weak var City: UILabel!
    
    
    @IBOutlet weak var website: UILabel!

    @IBOutlet weak var aboutMe: UILabel!
    
    
    @IBOutlet weak var skillsContainer: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser  = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            //MARK: fix conflict here
            if let name = Developer.userName {
                
                self.DeveloperName.text = name
            
            }
            
            if let companyName = Developer.companyName {
                
                 self.DeveloperName.text = companyName
            }
            
            
            if let location = Developer.location {
                
                self.City.text = location
            }
            
            
            if let description = Developer.developerDescription {
                
                self.aboutMe.text = description
                
            }
            
            if let website = Developer.website {
                
                self.website.text = website
            }
            
            
            
            
            
            
        }
        

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

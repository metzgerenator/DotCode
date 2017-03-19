//
//  ClientSummaryViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/14/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ClientSummaryViewController: UIViewController {

    @IBOutlet var profilePhoto: UIImageView!
    
    @IBOutlet var pointOfContactPhoto: UIImageView!
    
    @IBOutlet var companyName: UILabel!
    
    @IBOutlet var location: UILabel!
    
    @IBOutlet var website: UILabel!
    
    
    @IBOutlet var PointOfContact: UILabel!
    
    
    
    @IBOutlet var aboutUsLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Client) in
            
            
            if let name = Client.companyName {
                
                self.companyName.text = name
            }
            
            if let clientLocation = Client.location {
                
                self.location.text = clientLocation
                
            }
            
            
            if let webSite = Client.website {
                
                self.website.text = webSite
                
            }
            
            
            
            
            
            
            
            
        }

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

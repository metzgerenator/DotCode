//
//  ClientDescriptionViewController.swift
//  DotCode
//
//  Created by Michael Metzger  on 3/12/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class ClientDescriptionViewController: UIViewController {
    
    var name: String?
    var location: String?
    
    
    @IBOutlet var clientName: UILabel!
    
    
    
    @IBOutlet var clientLocation: UILabel!
    
    
    
    

    @IBAction func photoAction(_ sender: Any) {
        
        
        
    }
    
    
    
    @IBAction func editDescription(_ sender: Any) {
        
        self.performSegue(withIdentifier: "description", sender: self)
        
        
    }
    
    
    
    @IBAction func editSocialMedia(_ sender: Any) {
        
        
        
        
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "clientMain", sender:self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let clientName = name, let clientLocation = location {
            
            self.clientName.text = clientName
            self.clientLocation.text = clientLocation
            
        }
        
        
        let currentUser = CurrentUser()
        currentUser.userAttributes { (Developer) in
            
            
//            if let clientName = Developer.companyName, let city = Developer.location {
//                
//                self.clientName.text = clientName
//                self.loca
//            }
//            
            
            
            
            
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
